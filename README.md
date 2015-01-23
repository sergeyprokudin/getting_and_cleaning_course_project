# getting_and_cleaning_course_project


script run_analysis.R  :

1. Loads measurements on the mean and standard deviation for each measurement  for train and test data
2. Loads labels for train  and test data, merges it with data loaded at step 1
3. Loads features and activity names, merges it with data
4. Merges train and test data
5. Aggregates data by subject and activity
6. Writes result to file "tidy_data.txt"


Output file tidy_data.txt contains following features : 

subject - subject id 
activity - activity name (WALKING, SITTING, etc.)
tBodyAcc-mean()-X, tBodyAcc-std()-Z, ... - mean and std features  from the original  feature set


