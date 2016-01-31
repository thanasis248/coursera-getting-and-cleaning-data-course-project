
##STEP 1
## Get X, Y, SUBJECT train and test datasets and Merge them
training_set_X <- read.table("train/X_train.txt")
test_set_X <- read.table("test/X_test.txt")
training_set_Y <- read.table("train/y_train.txt")
test_set_Y <- read.table("test/y_test.txt")
training_set_SUBJECT <- read.table("train/subject_train.txt")
test_set_SUBJECT <- read.table("test/subject_test.txt")


merged_X <- rbind(training_set_X, test_set_X)
merged_Y <- rbind(training_set_Y, test_set_Y)
merged_SUBJECT <- rbind(training_set_SUBJECT, test_set_SUBJECT)

##STEP 2
##Extract only measurments on mean and std(standard deviation)
features <- read.table("features.txt")
selectedFeaturesX <- grep("mean\\(\\)|std\\(\\)", features[, 2])
merged_X <- merged_X[,selectedFeaturesX] 
names(merged_X) <- features[selectedFeaturesX, 2]

##STEP 3
##Use descriptive names for Activity instead of values
activitiesLabelsForY <- read.table("activity_labels.txt")
activitiesLabelsForY[,2]
merged_Y <- factor(merged_Y$V1,levels =activitiesLabelsForY[,1] ,labels = activitiesLabelsForY[,2])

##STEP 4
##Appropriately labels the data set with descriptive variable names. 
names(merged_SUBJECT) <- "Subject"
finalData <- cbind(merged_X, merged_Y, merged_SUBJECT)
colnames(finalData)[67] <- "Activity"

##STEP 5
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
finaData2Melt <- melt(finalData, id = c("Subject", "Activity"))
finalData2 <- dcast(finaData2Melt, Subject + Activity ~ variable, mean)

write.table(finalData2, file = "tidy_data.txt")
