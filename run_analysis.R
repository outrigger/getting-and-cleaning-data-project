##################################################################################################
## Preparation: Download dataset and Unzip to working directory
##################################################################################################

## Function to download dataset and unzip it to working directory
downloadDataset <- function() {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  if(!file.exists("./data")) {
    dir.create("./data")
  }
  
  downloadDirectory <- "data"
  
  zippedDataset <- file.path(downloadDirectory, paste("getdata-projectfiles-UCI HAR Dataset.zip", sep = "/"))
  
  if (!file.exists(zippedDataset)) {
    download.file(url, zippedDataset)
  }
  
  dataDirectory <- "UCI HAR Dataset"
  
  if(!file.exists(dataDirectory)) {
    unzip(zippedDataset, exdir = ".")
  }
  
  dataDirectory
}

## Download the dataset and unzip it to the working directory
dataDirectory <- downloadDataset()


##################################################################################################
## 1. Merge the training and the test sets to create one data set
##################################################################################################

## Function to read dataset in table format and create data frame
readDataset <- function(path) {
  read.table(file.path(dataDirectory, paste(path, sep = "/")))
}

## Read in both X_train & X_test datasets
xTrain <<- readDataset("train/X_train.txt")
xTest <<- readDataset("test/X_test.txt")

## Merge both datasets
xMergedDataset <- rbind(xTrain, xTest)

## Get feature tags from features.txt and assign to merged dataset
featureTags <- readDataset("features.txt")[,2]
names(xMergedDataset) <- featureTags


##################################################################################################
## 2. Extract only the measurements on the mean and standard deviation for each measurement
##################################################################################################

## Get columns with feature tags matching mean() or std()
matchedColumns <- grep("(mean|std)\\(\\)", names(xMergedDataset))
subDataset <- xMergedDataset[,matchedColumns]


##################################################################################################
## 3. Use descriptive activity names to name the activities in the data set
##################################################################################################

## Read in both y_train & y_test datasets
yTrain <<- readDataset("train/y_train.txt")
yTest <<- readDataset("test/y_test.txt")

## Merge both datasets
yMergedDataset <- rbind(yTrain, yTest)[,1]

## Map to friendlier names with reference from activity_labels.txt
activityTags <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
activities <- activityTags[yMergedDataset]


##################################################################################################
## 4. Appropriately label the data set with descriptive variable names
##################################################################################################

names(subDataset) <- gsub("^t", "Time", names(subDataset))
names(subDataset) <- gsub("^f", "Frequency", names(subDataset))
names(subDataset) <- gsub("mean\\(\\)", "Mean", names(subDataset))
names(subDataset) <- gsub("std\\(\\)", "StdDev", names(subDataset))
names(subDataset) <- gsub("BodyBody", "Body", names(subDataset))

## Read in both subject_train & subject_test datasets
subjectTrain <<- readDataset("train/subject_train.txt")
subjectTest <<- readDataset("test/subject_test.txt")

## Merge both datasets
subjectMerged <- rbind(subjectTrain, subjectTest)[,1]

## Generate the tidy dataset in wide format
tidyDataset <- cbind(Subject = subjectMerged, Activity = activities, subDataset)


##################################################################################################
## 5. Create a second, independent tidy data set with the average of each variable for each 
##    activity and each subject
##################################################################################################

## Check if user has the plyr package installed
package <- c("plyr")
if(!package %in% installed.packages()) {
  install.packages(package)
}

## Load the plyr package
library(plyr)

## Function to get the means of each column except for the first (Subject) and second (Activity) 
## columns
subDatasetColumnMeans <- function(data) {
  colMeans(data[,-c(1,2)])
}

## Split the tidy dataset data frame, apply the function and return the results in a data frame
tidyColumnMeans <- ddply(tidyDataset, .(Subject, Activity), subDatasetColumnMeans)

## Re-label dataset appropriately
names(tidyColumnMeans)[-c(1,2)] <- paste0("Average-", names(tidyColumnMeans)[-c(1,2)])

## Write to a text file
write.table(tidyColumnMeans, "tidyDataset.txt", row.names = FALSE)

## Check to ensure that tidyDataset.txt can be read properly
read.table("tidyDataset.txt", header = TRUE)