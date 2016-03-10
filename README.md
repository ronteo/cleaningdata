run_analysis.R

The script does the following

0)Downloads the data and unzips it in the working folder if the the file does not already exit

1) Merges the training and the test sets to create one data set.
	-Uses rbind

2 Extracts only the measurements on the mean and standard deviation for each measurement.
	-Uses grep an subsetting via '[]'

3) Uses descriptive activity names to name the activities in the data set
	-Uses sapply on a function that extracts the correct label from the labels activity_labels file

4) Appropriately labels the data set with descriptive variable names.
	-uses colnames

5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 	-Uses aggreagrate function
