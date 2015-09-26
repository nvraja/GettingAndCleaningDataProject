##******************************************************************************
## Getting and Cleaning Data Coursera Course Peer Assessments Project
## www.coursera.org
##
## You should create one R script called run_analysis.R that does the following.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each
##    variable for each activity and each subject. 
##******************************************************************************

## 1. Merges the training and the test sets to create one data set.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
##******************************************************************************

# load plyr package
library(plyr)

# obtain activity labels and features for naming the columns of the data
activities  <- read.table("UCI HAR Dataset/activity_labels.txt", 
                          sep="", stringsAsFactors=FALSE,
                          col.names=c("index","name"))
features    <- read.table("UCI HAR Dataset/features.txt", 
                          sep="", stringsAsFactors=FALSE,
                          col.names=c("index","name"))

# load training data and test data and rename some columns
x_train     <- read.table("UCI HAR Dataset/train/X_train.txt", 
                          sep="", col.names=features$name)
y_train     <- read.table("UCI HAR Dataset/train/y_train.txt", 
                          sep="", col.names="activity")
subj_train  <- read.table("UCI HAR Dataset/train/subject_train.txt",
                          sep="", col.names="subjectID")
x_test     <- read.table("UCI HAR Dataset/test/X_test.txt", 
                          sep="", col.names=features$name)
y_test     <- read.table("UCI HAR Dataset/test/y_test.txt", 
                          sep="", col.names="activity")
subj_test  <- read.table("UCI HAR Dataset/test/subject_test.txt",
                          sep="", col.names="subjectID")

# combine training and test data (nr and order of rows and cols are identical)
full_data <- rbind( cbind(subj_train, y_train, x_train), 
                    cbind(subj_test, y_test, x_test) )
full_data$subjectID <- as.factor(full_data$subjectID)
full_data$activity <- factor(full_data$activity, levels=activities$index,
                        labels=activities$name)
# provide summary output on subject IDs and activities
summary(full_data[,c("subjectID", "activity")])


## 2. Extracts only the measurements on the mean and standard deviation for each
##    measurement.
##******************************************************************************

# Besides subject IDs and Activities get all columns with term "std" or "mean"
tidy_data <- full_data[ , c(1:2, 
                            grep("std", names(full_data)),
                            grep("mean", names(full_data)))]
# provide summary output on all variables
summary(tidy_data)
# write tidy data to text file, columns seperated by ";"
write.table(tidy_data, "tidy_data_1.txt", sep=";", row.names=FALSE)


## 5. Creates a second, independent tidy data set with the average of each
##    variable for each activity and each subject. 
##******************************************************************************

# apply column means function to data subsetted by subject ID and activity
tidy_data_2 <- ddply(tidy_data, .(subjectID, activity), .fun=function(x){
    colMeans(x[,-c(1:2)])
})
# provide summary output on all variables
summary(tidy_data_2)
# write tidy data with means by subject and activity to text file,
# columns seperated by ";"
write.table(tidy_data_2, "tidy_data_2.txt", sep=";", row.names=FALSE)
