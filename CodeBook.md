## title: "CodeBook.md"
## author: "E.D."
## date: "September 23, 2016"
## output: html_document
---

## This is the CodeBook.md file for the Getting And Cleaning Data course final project.

## General Information
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Input Data

Here are the input data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Transformations and Processing
## General Objectives of the run_analysis.R script includes the following:
The run_analysis.R script will perform the following steps:
0.  Get the Data Set.
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set.
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each 
    variable for each activity and each subject.

## Variable List:
1. FileURL - contains the link to the compressed zip file.
2. Destfile- contains the local PC destination of the downloaded zip file.
3. subject_test - reads in the subject test data table.
4. x_test - reads in the x test data table.
5. y_test - reads in the y test data table.
6. subject_train - reads in the subject training data table.
7. x_train - reads in the x training data table.
8. y_train - reads in the y training data table.
9. features - reads in the features data table.
10. activity_labels - reads in the activity labels data table.
11. merge_test - merged the test data for Y, X, and subject
12. merge_train - merged the training data for Y, X, and subject.
13. merge_data_set - merged the test data and training data for Y, X, and subject.
14. mean_stddev - is a vector for defining ID, mean and standard deviation.
15. setMeanStddev - contains the subset for the mean and standard deviation data.
16. setActivityNames - Uses descriptive activity names to name the activities in the data set.
17. TidyDataSet - contains the independent tidy data set with the average of each variable 
                  for each activity and each subject.
                  
## Highlights of the Processing Algorithm
#------------------------------------------------------------------------------------------------
0. Get the Data Set.
   0a. Download the data file.
   0b. Unzip the dataSet to /mydata directory
#------------------------------------------------------------------------------------------------
## 1. Merges the training and the test sets to create one data set.
   1a. Read the testing tables.
   1b. Read the training tables.
   1c. Read the feature table.
   1d. Read the activity lable table.
   1e. Assign column names.
   1f. Merge the test and training data sets into one data set.

##------------------------------------------------------------------------------------------------  
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
   2a. Read column names.
   2b. Create vector for defining ID, mean and standard deviation.
   2c. Generate subset of the means and standard deviations.

##------------------------------------------------------------------------------------------------   
## 3. Use descriptive activity names to name the activities in the data set.

##------------------------------------------------------------------------------------------------ 
## 4. Appropriately labels the data set with descriptive variable names.

##------------------------------------------------------------------------------------------------   
## 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject.

   5a. Write final tidy data set in TidyDataSet.txt file

## Output Data
One file called TidyDataSet.txt. TidyDataSet.txt contains the following information:
"subjectId" 
"activityId" 
"timeBodyAccelerometer-mean()-X" 
"timeBodyAccelerometer-mean()-Y" 
"timeBodyAccelerometer-mean()-Z" 
"timeBodyAccelerometer-std()-X" 
"timeBodyAccelerometer-std()-Y" 
"timeBodyAccelerometer-std()-Z" "
"timeGravityAccelerometer-mean()-X" 
"timeGravityAccelerometer-mean()-Y" 
"timeGravityAccelerometer-mean()-Z" 
"timeGravityAccelerometer-std()-X" 
"timeGravityAccelerometer-std()-Y" 
"timeGravityAccelerometer-std()-Z" 
"timeBodyAccelerometerJerk-mean()-X" 
"timeBodyAccelerometerJerk-mean()-Y" 
"timeBodyAccelerometerJerk-mean()-Z" 
"timeBodyAccelerometerJerk-std()-X" 
"timeBodyAccelerometerJerk-std()-Y" 
"timeBodyAccelerometerJerk-std()-Z" 
"timeBodyGyroscope-mean()-X"
"timeBodyGyroscope-mean()-Y"
"timeBodyGyroscope-mean()-Z"
"timeBodyGyroscope-std()-X" 
"timeBodyGyroscope-std()-Y"
"timeBodyGyroscope-std()-Z" 
"timeBodyGyroscopeJerk-mean()-X" 
"timeBodyGyroscopeJerk-mean()-Y" 
"timeBodyGyroscopeJerk-mean()-Z" 
"timeBodyGyroscopeJerk-std()-X" 
"timeBodyGyroscopeJerk-std()-Y" 
"timeBodyGyroscopeJerk-std()-Z" 
"timeBodyAccelerometerMagnitude-mean()" 
"timeBodyAccelerometerMagnitude-std()" 
"timeGravityAccelerometerMagnitude-mean()"
"timeGravityAccelerometerMagnitude-std()"
"timeBodyAccelerometerJerkMagnitude-mean()"
"timeBodyAccelerometerJerkMagnitude-std()" 
"timeBodyGyroscopeMagnitude-mean()" 
"timeBodyGyroscopeMagnitude-std()" 
"timeBodyGyroscopeJerkMagnitude-mean()"
"timeBodyGyroscopeJerkMagnitude-std()" 
"frequencyBodyAccelerometer-mean()-X"
"frequencyBodyAccelerometer-mean()-Y"
"frequencyBodyAccelerometer-mean()-Z" 
"frequencyBodyAccelerometer-std()-X"
"frequencyBodyAccelerometer-std()-Y" 
"frequencyBodyAccelerometer-std()-Z" 
"frequencyBodyAccelerometer-meanFreq()-X" 
"frequencyBodyAccelerometer-meanFreq()-Y" 
"frequencyBodyAccelerometer-meanFreq()-Z" 
"frequencyBodyAccelerometerJerk-mean()-X" 
"frequencyBodyAccelerometerJerk-mean()-Y" 
"frequencyBodyAccelerometerJerk-mean()-Z" 
"frequencyBodyAccelerometerJerk-std()-X" 
"frequencyBodyAccelerometerJerk-std()-Y" 
"frequencyBodyAccelerometerJerk-std()-Z" 
"frequencyBodyAccelerometerJerk-meanFreq()-X" 
"frequencyBodyAccelerometerJerk-meanFreq()-Y" 
"frequencyBodyAccelerometerJerk-meanFreq()-Z"
"frequencyBodyGyroscope-mean()-X" 
"frequencyBodyGyroscope-mean()-Y" 
"frequencyBodyGyroscope-mean()-Z" 
"frequencyBodyGyroscope-std()-X" 
"frequencyBodyGyroscope-std()-Y" 
"frequencyBodyGyroscope-std()-Z" 
"frequencyBodyGyroscope-meanFreq()-X" 
"frequencyBodyGyroscope-meanFreq()-Y" 
"frequencyBodyGyroscope-meanFreq()-Z" 
"frequencyBodyAccelerometerMagnitude-mean()" 
"frequencyBodyAccelerometerMagnitude-std()" 
"frequencyBodyAccelerometerMagnitude-meanFreq()" 
"frequencyBodyAccelerometerJerkMagnitude-mean()" 
"frequencyBodyAccelerometerJerkMagnitude-std()" 
"frequencyBodyAccelerometerJerkMagnitude-meanFreq()" 
"frequencyBodyGyroscopeMagnitude-mean()" 
"frequencyBodyGyroscopeMagnitude-std()" 
"frequencyBodyGyroscopeMagnitude-meanFreq()" 
"frequencyBodyGyroscopeJerkMagnitude-mean()" 
"frequencyBodyGyroscopeJerkMagnitude-std()" 
"frequencyBodyGyroscopeJerkMagnitude-meanFreq()" 
"activityType"
