
  #load data
  if (!file.info("UCI HAR Dataset")$isdir) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
    unzip("dataset.zip")
  }
  
  #1 Merges the training and the test sets to create one data set.
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = )
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  x <- rbind(x_test,x_train)
  features <- read.table("UCI HAR Dataset/features.txt")
  colnames(x) <- features[,2]
  
  #2 Extracts only the measurements on the mean and standard deviation for each measurement.
  x_mean_std <- x[,grep("mean|std",features[,2])]
  
  #3 Uses descriptive activity names to name the activities in the data set
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  y <- rbind(y_test,y_train)
  
  labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  
  func <- function(i){labels[i,2]}
  y <- as.data.frame(sapply(y,func))
  
  #4 Appropriately labels the data set with descriptive variable names.
  colnames(y) <- "activity"
  dataset <- cbind(x_mean_std,y)

  #5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
  subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
  subject <- rbind(subject_test,subject_train)
  colnames(subject) <- "subject" 
  dataset <- cbind(dataset,subject)
  tidy <- aggregate(dataset, by = list(activity = y[,1], subject = subject[,1]), mean)
  write.table(tidy,"result.txt", row.names = FALSE)
  
  

  