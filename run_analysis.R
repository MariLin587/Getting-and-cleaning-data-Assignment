# It is assumed that the working directory contains a folder "UCI HAR Dataset"
# which contains the data

X_test_raw<-read.table("./UCI HAR Dataset/test/X_test.txt")
X_train_raw<-read.table("./UCI HAR Dataset/train/X_train.txt")


#Merging of the train and test sets

XY_raw<-rbind(X_test_raw, X_train_raw)


# Loading and merging of the training labels

Y_test_raw<-read.table("./UCI HAR Dataset/test/y_test.txt")
Y_train_raw<-read.table("./UCI HAR Dataset/train/y_train.txt")
Training_labels<-rbind(Y_test_raw, Y_train_raw)


# Reads the features
features<-read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)

#Subject data for the test set and the training set - loading and merging
Train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
Test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
Subjects<-rbind(Test_subject, Train_subject)

#Labeling the columns in XY_raw - creating unique names

Column_names<-make.names(features$V2, unique=TRUE)C
names(XY_raw)<-Column_names

# Creating one dataset


Combined_raw<-cbind(Subjects, Training_labels, XY_raw)

#Labeling the added columns

names(Combined_raw)[1]="ID"
names(Combined_raw)[2]="Activity"

#Naming the activities

activity.labels<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
Combined_raw$Activity<-activity.labels[Combined_raw$Activity]

#selecting only the mean and standard deviation and creating a new data frame
#called Data_mean_sd

library(dplyr)
Data_mean_sd<-select(Combined_raw, ID, Activity, contains("mean"), contains("std"))
