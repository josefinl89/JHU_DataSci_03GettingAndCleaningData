library(dplyr)
library(stringr)
list.files()

# extracting features names
col_names <- read.table("./features.txt")

# read in test data
test_var <- read.table("./test/X_test.txt", col.names = col_names$V2)
test_labels <- read.table("./test/y_test.txt", col.names = "activity")
test_labels$activity <- as.character(test_labels$activity)
class(test_labels$activity)
test_labels$activity <- test_labels$activity %>% 
        str_replace_all(c("1" = "walking", "2" = "walking_upstairs",
                                   "3" = "walking_downstairs", "4" = "sitting",
                                   "5" = "standing", "6" = "laying"))
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
df_test <- bind_cols(subject_test, test_labels, test_var)

# read in train
train_var <- read.table("./train/X_train.txt", col.names = col_names$V2)
train_labels <- read.table("./train/y_train.txt", col.names = "activity")
train_labels$activity <- as.character(train_labels$activity)
class(train_labels$activity)
train_labels$activity <- train_labels$activity %>% 
        str_replace_all(c("1" = "walking", "2" = "walking_upstairs",
                          "3" = "walking_downstairs", "4" = "sitting",
                          "5" = "standing", "6" = "laying"))
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
df_train <- bind_cols(subject_train, train_labels, train_var)

# merge test and train data
merged_df <- full_join(df_test, df_train) %>%
        select(subject, activity, contains(c("mean", "std")))

# tidy data set with avg of each var grouped by activity and subject
extract_mean <- merged_df %>%
        group_by(activity, subject) %>%
        summarise(across(everything(), mean))

# export extract_mean df as csv-file
write.csv(extract_mean, file = "../labels_mean.csv")
