# Merges the training and the test sets to create one data set
trainingXSetPath <- "./X_train.txt"
testXSetPath <- "./X_test.txt"

trainingYSetPath <- "./Y_train.txt"
testYSetPath <- "./Y_test.txt"

trainingSubjectSetPath <- "./subject_train.txt"
testSubjectSetPath <- "./subject_test.txt"
# Load files
trainingX <- read.table(trainingXSetPath)
testX <- read.table(testXSetPath)

trainingY <- read.table(trainingYSetPath)
testY <- read.table(testYSetPath)

trainingSubject <- read.table(trainingSubjectSetPath)
testSubject <- read.table(testSubjectSetPath)

# Name Subject columns 
names(trainingSubject) <- c("Subject")
names(testSubject) <- c("Subject")

# Uses descriptive activity names to name the activities in the data set
activitiesFile <- "./activity_labels.txt"
activities <- read.table(activitiesFile)
# merge Y data with the activity labels
trainingY <- merge(trainingY, activities, all=TRUE, sort=FALSE)
testY <- merge(testY, activities, all=TRUE, sort=FALSE)

#Change names of Y data
names(trainingY) <- c("Activiy.Code","Activity")
names(testY) <- c("Activiy.Code","Activity")

# Merge measurements
measurements <- rbind(trainingX, testX)

# Merge Activity Data
activity <- rbind(trainingY, testY)

#Merge Subject data
subject <- rbind(trainingSubject, testSubject)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Get features data
featuresFile = "./features.txt"

features <- read.table(featuresFile)

# Name the measurements based on the features file
names(measurements) <- features[,2]

# Extract mean and std columns by usign function grepl to match the words "mean" and "std" into
# the features data frame
measurements <- cbind(measurements[,which(grepl("mean",features[,2]))],measurements[,which(grepl("std",features[,2]))])

# Merge all data
data <- cbind(measurements, activity, subject)

# Create the tidy data set
meltedData <- melt(data, id.vars=c("Activity", "Subject"), measure.vars=names(measurements))
tidyData <- dcast(meltedData, Activity + Subject ~ variable, mean)
write.table(tidyData, "./result.txt", row.name=FALSE)
