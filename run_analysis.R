## E.D. September 23, 2016
## The run_analysis.R script will perform the following steps:
## 0. Get the Data Set.
## 1.	Merges the training and the test sets to create one data set.
## 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.	Uses descriptive activity names to name the activities in the data set.
## 4.	Appropriately labels the data set with descriptive variable names. 
## 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject.

##------------------------------------------------------------------------------------------------
## 0. Get the Data Set.

## Download the data file.
if(!file.exists("./mydata")){dir.create("./mydata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./mydata/Dataset.zip")

## Unzip the dataSet to /mydata directory
unzip(zipfile="./mydata/Dataset.zip",exdir="./mydata")

##------------------------------------------------------------------------------------------------
##1. Merges the training and the test sets to create one data set.

## Read the  testing tables.
subject_test <- read.table("./mydata/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./mydata/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./mydata/UCI HAR Dataset/test/y_test.txt")

## Read the training tables.
subject_train <- read.table("./mydata/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./mydata/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./mydata/UCI HAR Dataset/train/y_train.txt")

## Read the feature table.
features <- read.table('./data/UCI HAR Dataset/features.txt')

## Read the activity lablel table.
activity_Labels = read.table('./mydata/UCI HAR Dataset/activity_labels.txt')

## Assign column names.
colnames(subject_test) <- "subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_train) <- "subjectId"
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(activity_Labels) <- c('activityId','activityType')

## Merge the data sets into one data set.
merge_test <- cbind(y_test, subject_test, x_test)  
merge_train <- cbind(y_train, subject_train, x_train)
merge_data_set <- rbind(merge_train, merge_test)

##------------------------------------------------------------------------------------------------  
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Read column names.
colNames <- colnames(merge_data_set)

## Create vector for defining ID, mean and standard deviation.
mean_stddev <- (grepl("activityId" , colNames) | 
                      grepl("subjectId" , colNames) | 
                      grepl("mean.." , colNames) | 
                      grepl("std.." , colNames) 
  )

##Generate subset of the means and standard deviations.
setMeanStddev <- merge_data_set[ , mean_stddev == TRUE]

##------------------------------------------------------------------------------------------------   
##3. Uses descriptive activity names to name the activities in the data set.
setActivityNames <- merge(setMeanStddev, activity_Labels,
                                by='activityId',
                                all.x=TRUE)
  
##------------------------------------------------------------------------------------------------ 
## 4. Appropriately labels the data set with descriptive variable names.

names(setActivityNames)<-gsub("^t", "time", names(setActivityNames))
names(setActivityNames)<-gsub("^f", "frequency", names(setActivityNames))
names(setActivityNames)<-gsub("Acc", "Accelerometer", names(setActivityNames))
names(setActivityNames)<-gsub("Gyro", "Gyroscope", names(setActivityNames))
names(setActivityNames)<-gsub("Mag", "Magnitude", names(setActivityNames))
names(setActivityNames)<-gsub("BodyBody", "Body", names(setActivityNames))
  
##------------------------------------------------------------------------------------------------   
##5. 	From the data set in step 4, creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject.

TidyDataSet <- aggregate(. ~subjectId + activityId, setActivityNames, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]

## Writing second tidy data set in txt file
write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)

