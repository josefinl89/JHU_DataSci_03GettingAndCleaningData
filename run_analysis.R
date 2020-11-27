library(dplyr)
library(stringr)
list.files()

# TEST DATA
# extracting vairable names
col_names <- read.table("./features.txt")

# read in test variables and activity
test_var <- read.table("./test/X_test.txt", col.names = col_names$V2)
test_labels <- read.table("./test/y_test.txt", col.names = "activity")
test_labels$activity <- as.character(test_labels$activity)

# replaceing activity no. labels with names
test_labels$activity <- test_labels$activity %>% 
        str_replace_all(c("1" = "walking", "2" = "walking_upstairs",
                                   "3" = "walking_downstairs", "4" = "sitting",
                                   "5" = "standing", "6" = "laying"))

# read in test subject data
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")

# merging test data of subject, activity and variables
df_test <- bind_cols(subject_test, test_labels, test_var)

# TRAIN DATA
# read in train data with the same procedure as above with test data
train_var <- read.table("./train/X_train.txt", col.names = col_names$V2)
train_labels <- read.table("./train/y_train.txt", col.names = "activity")
train_labels$activity <- as.character(train_labels$activity)
train_labels$activity <- train_labels$activity %>% 
        str_replace_all(c("1" = "walking", "2" = "walking_upstairs",
                          "3" = "walking_downstairs", "4" = "sitting",
                          "5" = "standing", "6" = "laying"))
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
df_train <- bind_cols(subject_train, train_labels, train_var)

# MERGE TEST AND TRAIN DATA, MAKE A TIDY DATA
# merge test and train data containing measurements of mean and std
merged_df <- full_join(df_test, df_train) %>%
        select(subject, activity, contains(c("mean", "std")))

# tidy data set of merged test and train data
# with avg of each variabels grouped by activity and subject
extract_mean <- merged_df %>%
        group_by(activity, subject) %>%
        summarise(across(everything(), mean))

# export extract_mean df as txt-file
write.table(extract_mean, file = "../ActivitySubject_mean.txt", row.names = F)

tidyData_names <- names(extract_mean)
tidyData_names
