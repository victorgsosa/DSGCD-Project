Codebook
========
Setup, Process wearable computing data in order to transform it into tidy data

Raw data is: Train and test data for measurements (X files), Activities predicted (Y files) and subjects (Subject files).

The project assigment requires to make the following steps in order to process raw data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Codebook:

- Load files
- Name Subject columns.
- Use descriptive activity names to name the activities in the data set by merging activity data with the activity labels
- Change names of the activity data
- Merges the training and the test sets to create one data set for measurements, activities and subjects using rbind function.
- Extracts only the measurements on the mean and standard deviation for each measurement using grepl function to look for the patterns "mean" and "std" into the features names.
- Merge all data (measurements, activities and subjects) usign cbind function
- Create the tidy data set by melting the data using the columns "Activities" and "Subject" and the measures taken from the names of the measurements data frame (previosly filtered)
- Write the data into file result.txt

