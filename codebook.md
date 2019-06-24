## Codebook assosciated with *run_analysis.R*
This codebook helps decribe the *humanActivityMeansTidy.txt* space seperated text file produced by *run_analysis.R*. Each obseravtion represents averaged signal measurements for unique identifiers 'Subject' and 'Activity'.  There are thirty unique subjects in the dataset, and six factor levels for Activity. The processed data contains one-hundred-eighty observations of eighty-eight variables.

The Human Activity Recognition Using Smartphones Data Set is used for this project. Additional information about the data, and the dataset can be found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Software Requirements
The software *run_analysis.R* was developed on 06-16-2019 in R version 3.6.0 (R Core Team 2019) on Ubuntu 18.04.1 Lts. Additional packages
include dplyr version 0.8.1 (Hadley Wickham, et al., 2019).

### Transformations
*run_analysis.R* applies the followiing transformations to the Human Activity Recognition Using Smartphones Data Set:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Variables
The followiing information about the variables used in the dataset can be found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
 
The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
 
 The followiing is an ordered list and description of the variables created in the *run_analysis.R* script.
 1. `urlDat` - Character vecter which contains the html download path to zip file which contains The Human Activity Recognition Using Smartphones Data Set.
 2. `mainDir` - Character vector which defines an optional parameter which specifies the working directory.
 3. `features.dat` - 561 x 2 data frame of functions used in experiment.
 4. `activities.dat` - 6 x 2 data frame which describes factor 'Activity' and assoscitated key identifiers.
 5. `xTrain.dat` - 7352 x 561 data frame which contains training set for features.
 6. `yTrain.dat` - 7352 x 1 data frame which contains training set for response activity key.
 7. `subjectTrain.dat` 7352 x 1 data frame which contains 'Subject' key identifier for training set.
 8. `xTest.dat` - 2947 x 561 data frame which contains test set for features.
 9. `yTest.dat` - 2947 x 1 data frame which contains test set for response activity key.
 10. `subjectTest.dat` 2947 x 1 data frame which contains 'Subject' key identifier for test set.
 11. `x.dat` - 10299 x 561 data frame. Merged training and test set of features.
 12. `y.dat` - 10299 x 1 data frame. Merged training and test set for response activity key.
 13. `subject.dat` - 10299 x 1 data frame. Merged training and test set for subject key identifiers.
 14. `humanActivity.dat` - 10299 x 563 data frame. Complete data set.
 15. `humanActivityTidy.dat` - 10299 x 88 data frame. Filtered data set of means and standard deviations.
 16. `humanActivityMeansTidy.dat` - 180 x 88  grouped data frame which describes the means of each variable for each activity and subject.
 




