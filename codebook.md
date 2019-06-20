## Codebook assosciated with *run_analysis.R*
This codebook helps decribe the *humanActivityMeansTidy.txt* space seperated text file produced by *run_analysis.R*. Each obseravtion represents averaged signal measurements for unique identidiers 'Subject' and 'Activity'.  There are thirty unique subjects in the dataset, and six factor levels for Activity.

The Human Activity Recognition Using Smartphones Data Set is used for this project. Additional information about the data, and the dataset can be found at the UCI Machine Learning Repository. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Software Requirements
The software *run_analysis.R* was developed on 06-16-2019 in R version 3.6.0 (R Core Team 2019) on Ubuntu 18.04.1 Lts. Additional packages
include dplyr version 0.8.1 (Hadley Wickham, et al., 2019).

#### Transformations.
The followiing transformations were made to the Human Activity Recognition Using Smartphones Data Set:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#### Describe Variables.
