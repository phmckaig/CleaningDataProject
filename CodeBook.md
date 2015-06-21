Code Book
==========

## 1. Procedure

    *Merges the training and the test sets to create one data set.
    *Extracts only the measurements on the mean and standard deviation for each  measurement.
    *Uses descriptive activity names to name the activities in the data set
    *Appropriately labels the data set with descriptive activity names.
    * Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 2. Data Description
 A complete description of the variables is available at :

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project is here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* subject_test : test data subject IDs  
* subject_train  : training data subject IDs 
* activity_labels : labels for activity IDs in both sets
* features : labels for each variable in both sets
* X_test : test values of variables 
* X_train : training values of variables 
* y_test : test activity ID 
* y_train : training activity ID 

* x.merged is a merging of X_test and X_train
* y.merged is a merging of y_test and y_train 
* meanstd.merged is the merged file containig the means and standard deviations
* subject.merged  is a merging of subject_test and subject_train
* consolidatedSet  is a merging of subjects and meanstd
* tidy_data  is the final output



## 3.Data cleaning
Parentheses are removed from the variable names

## 4. Output 
tidy_data.txt is generated that contains the mean and standard deviation for each variable.
