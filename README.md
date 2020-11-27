# JHU_DataSci_03GettingAndCleaningData
Repo for week 4 assignment

The **ActivitySubject_mean.txt** is a data set that contains average mean and standard deviation measurements of activities for each subject performed while wearing a Samsung Galaxy SII on their waist. 

The **CodeBook.md** explains where the original data were downloaded, simplified description of how the original data were collected and the naming-system of the variables. In the code book there is also a short description of how the data set in this repo is created.

The **run_analysis.R** file is a script that:
1. Read in the test and train set.
2. Merge the test and train set.
3. Extract only measurments of mean and standard devitaion and create an "intermediate" data frame.
4. Create a new data set with average of each mean and standard deviation measurements of each activity for each subject.
5. Export the new data set as txt-file (ActivitySubject_mean.txt).
