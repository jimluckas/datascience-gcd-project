# set the working directory
setwd("~/R/coursera/wk3/UCI HAR Dataset")

# Read the data files in
training       = read.csv("train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("train/subject_train.txt", sep="", header=FALSE)
testing        = read.csv("test/X_test.txt", sep="", header=FALSE)
testing[,562]  = read.csv("test/Y_test.txt", sep="", header=FALSE)
testing[,563]  = read.csv("test/subject_test.txt", sep="", header=FALSE)
activityLabels = read.csv("activity_labels.txt", sep="", header=FALSE)
features = read.csv("features.txt", sep="", header=FALSE)

# Cleanup the feature names
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Combine the data files
allData = rbind(training, testing)

# Get the mean and std dev data
mean_std <- grep(".*Mean.*|.*Std.*", features[,2])

# Reduce the features table to mean and std dev
features <- features[mean_std,]

# Add columns for subject and activity
mean_std <- c(mean_std, 562, 563)

# Remove the unwanted columns from allData
allData <- allData[,mean_std]

# Add the column names to allData
colnames(allData) <- c(features$V2, "activity", "subject")

# create activity labels
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
  currentActivity <- currentActivity + 1
}

# get the factors
allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

# aggregate on the factors and pass function mean
tidy_data = aggregate(allData[,names(allData) != c('activity','subject')], by=list(activity =allData$activity, subject=allData$subject), mean)

# write the data to disc
write.table(tidy_data, "tidy_movement_data.txt", sep="\t")
