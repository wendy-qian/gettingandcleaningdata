# Getting and Cleaning Data for Data Science Coursera - Course 3, Week 4

## The Data

Be sure to get the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once you have the data, edit the script in order to access the general data folder (UCI HAR Dataset), the train folder, and the test folder. The respective files that we'll be using are:

### From the UCI HAR Dataset folder
* activity_labels.txt
* features.txt

### From the train folder
* subject_train.txt
* X_train.txt
* y_train.txt

### From the test folder
* subject_test.txt
* X_test.txt
* y_text.txt

## The Analysis

### Merging the data
In run_analsis.R, the first step I took was to import all of the .txt files so that I had the data to work with in my environment. 

Before actually merging, I assigned the columns names - the subject_test.txt and subject_train.txt columns were given the name "subject", the activity_labels.txt column was given the name "activity_labels", and the X_train and X_test columns were given the corresponding names from the features.txt file. 

I then merged the data together so that we could start extracting and filtering. This data set was named "merged". 

### Extracting the data

I extracted the mean and standard deviation columns by using the grepl() function and looking for instances of "mean" and "std". This was initially solved and added to the "mean_and_stddev" variable, then added back into the original data set, "merged". 

### Matching the activities

I re-named the variables in the activity_labels columnn with the respective activity labels in the activity_labels.txt file. 

### Melting and getting a tidy data set

Finally, I melted the data in order to produce a indendent tiny data set that has the average of each variable for each activity and each subject. This data set is named "tidy_result".

