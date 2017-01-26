### The purpose of this script is to collect, work with, and clean a data set
### on the accelerometers from the Samsung Galaxy S smartphone

##
## 1. Merge the training and the test sets to create one data set.
##

# Set working directory to data set folder
setwd("~/Desktop/Coursera-Files/Course3/UCI HAR Dataset")
column_names <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Set working directory to train data folder and read files
setwd("~/Desktop/Coursera-Files/Course3/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
X_train <- read.table("X_train.txt")

# Set working directory to test data folder and read files
setwd("~/Desktop/Coursera-Files/Course3/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
X_test <- read.table("X_test.txt")

# Give files column names
names(subject_train) = "subject"
names(subject_test) = "subject"
names(y_train) = "activity_labels"
names(y_test) = "activity_labels"
names(X_train) = column_names$V2
names(X_test) = column_names$V2

# Merge data sets together 
train_combined <- cbind(subject_train, y_train, X_train)
test_combined <- cbind(subject_test, y_test, X_test)
merged <- rbind(train_combined, test_combined)

# Return working directory to GitHub repository folder
setwd("~/Desktop/Coursera-GitHub/gettingandcleaningdata")


##
## 2. Extract only the measurements on the mean and standard deviation for each measurement.
##

# Extract the columns with "mean" or "std" in their names
mean_and_stddev <- grepl("mean\\(\\)", names(merged)) | grepl("std\\(\\)", names(merged))

#Add two extra columns at the beginning to maintain subject and activity_levels columns
mean_and_stddev[1:2] <- TRUE
merged <- merged[, mean_and_stddev]


##
## 3. Use descriptive activity names to name the activities in the data set
##

# Name activity_levels variables based off of the activity_labels.txt file
merged$activity_labels = factor(merged$activity, levels = c(1,2,3,4,5,6), labels = activity_labels$V2)


##
## 4. Appropriately label the data set with descriptive variable names.
##

# Done in the first part when merging data sets together


##
## 5. From the data set in step 4, create a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
##

# Need reshape2 package to melt
library(reshape2)

# Melt to get the average variable for each activity and each subject
melted <- melt(merged, id = c("subject","activity_labels"))

# Tidy data set result
tidy_result <- dcast(melted, subject + activity_labels ~ variable, mean)
