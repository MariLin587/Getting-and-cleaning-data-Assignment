#The purpose of the tidying work is 
#1) To create a tidy dataset containing the calculated mean values and standard deviations of the measurements
#2) To create a second independent tidy data set called "Summary  with the average of each variable 
for each activity and each subject

run_analysis.R script performs the tidying work
dplyr package is required for the work
The analysis assumes that the folder "UCI HAR Datasets" is in the working directory

The tidy dataset contain the following variables:

ID - Id of the persons (1-30) participating in the experiment
Activity - 5 Different activity types
Mean and standard deviations of variables described in the 'features_info.txt'

