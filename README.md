# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Included in this Repository:
1. **README.md**<br/>
  Description of assignment for week 4 of Getting and Cleaning Data Course and its requirements.
2. **run_analysis.R**<br/>
  R script which retrieves and cleans the Human Activity Recognition Using Smartphones Data Set according to the following project requirements.
    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement.
    * Uses descriptive activity names to name the activities in the data set.
    * Appropriately labels the data set with descriptive variable names.
    * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
3. **codebook.md**<br/>
  Codebook which describes the data, variables and tranformations used in R script *run_analysis.R*.
4. **humanActivityMeansTidy.txt**<br/>
  Clean and tidy dataset according to specified analysis requirements; produced by *run_analysis.R*.
