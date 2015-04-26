

## Coursera
### Getting and Cleaning Data - Course Project



### Code Book
run_analysis.R  performs the 5 steps described in the course project's definition.

You should create one R script called run_analysis.R that does the following. 
1) Merges the training and the test sets to create one data set.
For this data is mergered using the rbind () function.  

2) Extracts only the measurements on the mean and standard deviation for each measurement. 
Only columns with mean and standard deviation measures are taken from the whole dataset 
After extracting these columns, they are given the correct names which is taken from  the file features.txt 

3) Uses descriptive activity names to name the activities in the data set
As activity data is addressed with values 1:6, we take the activity names and IDs from  activity_labels.txt  and they are substituted in the dataset.

4) Appropriately labels the data set with descriptive variable names. 
For the whole dataset, those columns with vague column names are corrected.

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
A new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows) is generated. 
The output file is called  averages_data.txt , and uploaded to this repository.



### Variables
•  x_train ,  y_train ,  x_test ,  y_test ,  subject_train  and  subject_test  contain the data from the downloaded files as part of the date for the project.
•  x_data ,  y_data  and  subject_data  is the parte where we have merge the previous datasets for further analysis.
•  features  contains the correct names for the  x_data  dataset, which are applied to the column names stored in  mean_and_std_features , a numeric vector used to xtract the desired data.
• A similar approach is taken with activity names through the  activities  variable.
•  all_data  merges  x_data ,  y_data  and  subject_data  in a one tidy dataset.
• averages_data contains the relevant averages which will be later stored in a  .txt  file.  ddply()  from the plyr package is used to apply  colMeans()  and ease the development.


For this project and solution I got references from and must give credit due to:
https://github.com/OscarPDR/Coursera-Getting-and-Cleaning-Data-Course-Project 


