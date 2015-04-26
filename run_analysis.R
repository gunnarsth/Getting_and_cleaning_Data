

## Coursera
### Getting and Cleaning Data - Course Project
#Project assignment
#https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions
#  You should create one R script called run_analysis.R that does the following. 
# 1)	Merges the training and the test sets to create one data set.
# 2)	Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3)	Uses descriptive activity names to name the activities in the data set
# 4)	Appropriately labels the data set with descriptive variable names. 
# 5)	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 
# Good luck!

# For this project and solution I got references from and must give credit due to:
# https://github.com/OscarPDR/Coursera-Getting-and-Cleaning-Data-Course-Project 



#library requirements
library(plyr)

# 1)  
#Read source data into R and 
#Merges the training and the test sets to create one data set.

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)


# 2) 
# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")

# get only those columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

# 3) 
# Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# 4)  
# Appropriately labels the data set with descriptive variable names. 

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# 5)  
# From the data set in step 4, 
# creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.


# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)