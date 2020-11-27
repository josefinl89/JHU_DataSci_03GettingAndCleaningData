Code book for week 4 assignment

# Code book for week 4 assignment
## by Josefin L.

This code book describes a tidy data set created by merging and grouping the test and train data set obtained from the "Human Activity Recognition Using Smartphones Dataset
Version 1.0" from www.smartlabs.ws. 

The data were downloaded from this link: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
<br>

## The original data
30 volunteers were wearing a Smartphone Galaxy SII on their waist while performing six different activities (walking, walking_upstairs, walking_downstairs, sitting, standing, laying). Measurments from the embedded accelerometer and gyroscope where recorded:
- 3-axial (X, Y, Z) linear acceleration from the accelerometer
- 3-axial (X, Y, Z) angular velocity from the gyroscope 
 
From the recorded signal measurments, different features (variables) were produced:
- Acceleration signals were sepearated into body and gravity accelerations signals, denoted as 
	- tBodyAcc-XYZ
	- tGravityAcc-XYZ
- Body linear acceleration signals and angular velocity signals were derived in time to obtain jerk signals, denoted as 
	- tBodyAccJerk-XYZ
	- tBodyGyroJerk-XYZ
- Magnitude of the three-dimesional signals were calculated, denoted as 
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
- Some signals were Fast Fourier Transformed (FFT) and denoted as 
	- fBodyAcc-XYZ
	- fBodyAccJerk-XYZ
	- fBodyGyro-XYZ
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag

The estimations of the variables were:
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the <br> &nbsp;&nbsp;&nbsp;&nbsp;number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order <br /> &nbsp;&nbsp;&nbsp;&nbsp;equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins<br /> &nbsp;&nbsp;&nbsp;&nbsp; of the FFT of each window.
angle(): Angle between to vectors.

For detailed information of the features, read the features_info.txt file from the download link.
<br>
<br>
## The tidy data created for this assignment
To obtain a tidy data set containing the average of each mean and standard deviation measurements of each activity for each subject, I did the following:

- Read in the feature names as table.
- Build one data frame for test data and one for train data:

	- Read in test/train features data and name column with feature names from the feature names table.
	- Read in test/train activity (labels) data and name column as "activity". Transform column to character objects.
	- Replaceing activity number labels with their respective activity names.
	- Read in subject data and name column as "subject"
	- Combine all test/train data to one data frame.
- Merge the test and the train data, extracting only measurements that are mean and standard deviations.
- Create a new data set that contains information of the average of the measurements of each activity for each subject from the merged data set. The variable names containing "mean" and "std", now mean the mean and standard deviation of each activiy for each subject, respectively. 
- Export the new data set as txt-file, named "ActivitySubject_mean.txt"

In the data file, the first line contains the column names. Each following line correspond to each row in the data set.