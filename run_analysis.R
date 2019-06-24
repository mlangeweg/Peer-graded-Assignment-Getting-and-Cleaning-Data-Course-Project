# MJL 2019-06-16
# Ubuntu 18.04.1 Lts
# Rstudio Version 1.1.456
# R version 3.6.0

# The purpose of this script is to complete the requirements for the week 4 assignment of the 
## Getting and Cleaning Data course.

## Assignment requirements: You should create one R script called run_analysis.R that does the following. 

### Merges the training and the test sets to create one data set.
### Extracts only the measurements on the mean and standard deviation for each measurement. 
### Uses descriptive activity names to name the activities in the data set.
### Appropriately labels the data set with descriptive variable names. 
### From the data set in step 4, creates a second, independent tidy data set with the average of each variable
#### for each activity and each subject.

# Clear workspace
rm(list = ls()); gc()

# library statements
required.packages <- c("dplyr")
lapply(required.packages, require, character.only = TRUE)

# Program inputs:
urlDat <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  # Path to dataset

# Set working directory
mainDir <- "/home/michael/Documents/coursera_assignments/getting_cleaning_data/week4"  # Specify working directory (optional)
if (file.exists(mainDir)){
  setwd(mainDir)
}

#-------------------------------------------------Import raw data-------------------------------------------------#
# Create data subfolder if it does not already exist
if(!file.exists("./data")){  
  dir.create("./data")
}  

# Download zip file from url destination
if(!file.exists("./data/Dataset.zip")) {  
  download.file(urlDat, destfile="./data/Dataset.zip")  
}

# Unzip directory  
if(!file.exists("./data/UCI HAR Dataset")) {
  unzip(zipfile="./data/Dataset.zip",exdir="./data")  
}

# Read in tables from raw data
## Features and activities meta data
features.dat <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("n","Functions"))
activities.dat <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("id", "Activity"))

## Training data
xTrain.dat <- read.table("./data/UCI HAR Dataset/train/X_train.txt",  col.names = features.dat$Functions)
yTrain.dat <- read.table("./data/UCI HAR Dataset/train/y_train.txt",  col.names = "id")
subjectTrain.dat <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")

## Test data
xTest.dat <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features.dat$Functions)
yTest.dat <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "id")
subjectTest.dat <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")


#-------------------------------Merge Training and Test Sets-------------------------------------------#
# Merge train and test data for x
x.dat <- rbind(xTrain.dat, xTest.dat)

# Merge train and test data for y
y.dat <- rbind(yTrain.dat, yTest.dat)

# Combine train and test data for subjects
subject.dat <- rbind(subjectTrain.dat, subjectTest.dat)

# Column bind subjects, x, and y data frames
humanActivity.dat <- cbind(subject.dat, y.dat, x.dat)

#--------------------------------Extract mean and standard deviation calculations of data----------------------------#
humanActivityTidy.dat <- humanActivity.dat %>% 
  select(Subject, id, contains("mean"), contains("std"))  # Select "Subject" and "id" vectors, filter variables with strings 'mean' and 'std'

#-------------------------Use descriptive activity names to name the activities in the data set----------------------------#
humanActivityTidy.dat$id <- activities.dat[humanActivityTidy.dat$id, 2]

#-------------------------------Clean up variable names-----------------------------------------------#
colnames(humanActivityTidy.dat)[2] <- "Activity"  # Change id name to Activity
colnames(humanActivityTidy.dat) <- gsub(".", "", colnames(humanActivityTidy.dat), fixed = TRUE)  # Remove periods from column names

# Replace abbreviations, uppercase subjects
colnames(humanActivityTidy.dat) <- gsub("Acc", "Accelerometer", colnames(humanActivityTidy.dat))
colnames(humanActivityTidy.dat) <- gsub("Gyro", "Gyroscope", colnames(humanActivityTidy.dat))
colnames(humanActivityTidy.dat) <- gsub("BodyBody", "Body", colnames(humanActivityTidy.dat))  # Typo?
colnames(humanActivityTidy.dat) <- gsub("Mag", "Magnitude", colnames(humanActivityTidy.dat))
colnames(humanActivityTidy.dat) <- gsub("^t", "Time", colnames(humanActivityTidy.dat))
colnames(humanActivityTidy.dat) <- gsub("^f", "Frequency", colnames(humanActivityTidy.dat))
colnames(humanActivityTidy.dat) <- gsub("tBody", "TimeBody", colnames(humanActivityTidy.dat))
colnames(humanActivityTidy.dat) <- gsub("mean", "Mean", colnames(humanActivityTidy.dat), ignore.case = TRUE)
colnames(humanActivityTidy.dat) <- gsub("std", "StandardDeviation", colnames(humanActivityTidy.dat), ignore.case = TRUE)
colnames(humanActivityTidy.dat) <- gsub("-freq()", "Frequency", colnames(humanActivityTidy.dat), ignore.case = TRUE)
colnames(humanActivityTidy.dat) <- gsub("angle", "Angle", colnames(humanActivityTidy.dat))
colnames(humanActivityTidy.dat) <- gsub("gravity", "Gravity", colnames(humanActivityTidy.dat))

#------------------------------Create df with the average of each variable for each activity and each subject------------------#
humanActivityMeansTidy.dat <- humanActivityTidy.dat %>% 
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean))

# write to file "humanActivityMeansTidy.txt"
write.table(humanActivityMeansTidy.dat, "humanActivityMeansTidy.txt", row.names = FALSE, 
            quote = FALSE)

