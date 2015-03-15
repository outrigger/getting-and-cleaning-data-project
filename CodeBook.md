# Code Book

## Transformation Process
The process of creating the final tidy dataset involves several steps:

1. Read in both `X_train` and `X_test` datasets

2. Merge both `X_train` and `X_test` datasets

3. Read in feature tags

4. Assign feature tags to merged dataset

5. Keep only the columns with feature tags corresponding to `mean()` and `std()`

6. Read in both `y_train` and `y_test` datasets

7. Merge both `y_train` and `y_test` datasets

8. Translate activity identifiers into descriptive variable names with reference from the `activity_labels.txt` file

9. Translate feature tags into more understandable descriptors

10. Read in both `subject_train` and `subject_test` datasets

11. Merge both `subject_train` and `subject_test` datasets

12. Generate a tidy dataset based on the wide format
 
	*(Each variable is in one column and each different observation of that variable is in a different row.)*

13. Calculate the average of each variable for each activity and each subject

14. Generate a second tidy dataset, also based on the wide format

14. Re-label feature tags to make them more understandable

15. Output tidied dataset to text file

## Data
### Files Used

* `train/X_train.txt`: Training set.

* `test/X_test.txt`: Test set.

* `features.txt`: List of all features.

* `train/y_train.txt`: Training labels.

* `test/y_test.txt`: Test labels.

* `activity_labels.txt`: Links the class labels with their activity name.

* `train/subject_train.txt` & `test/subject_test.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Variables
### Feature Tags

There are a total of 68 columns present in the tidied dataset:

* `Subject`                                 
* `Activity`                               
* `Average-TimeBodyAcc-Mean-X`              
* `Average-TimeBodyAcc-Mean-Y`             
* `Average-TimeBodyAcc-Mean-Z`              
* `Average-TimeBodyAcc-StdDev-X`           
* `Average-TimeBodyAcc-StdDev-Y`            
* `Average-TimeBodyAcc-StdDev-Z`           
* `Average-TimeGravityAcc-Mean-X`           
* `Average-TimeGravityAcc-Mean-Y`          
* `Average-TimeGravityAcc-Mean-Z`           
* `Average-TimeGravityAcc-StdDev-X`        
* `Average-TimeGravityAcc-StdDev-Y`         
* `Average-TimeGravityAcc-StdDev-Z`        
* `Average-TimeBodyAccJerk-Mean-X`          
* `Average-TimeBodyAccJerk-Mean-Y`         
* `Average-TimeBodyAccJerk-Mean-Z`          
* `Average-TimeBodyAccJerk-StdDev-X`       
* `Average-TimeBodyAccJerk-StdDev-Y`        
* `Average-TimeBodyAccJerk-StdDev-Z`       
* `Average-TimeBodyGyro-Mean-X`             
* `Average-TimeBodyGyro-Mean-Y`            
* `Average-TimeBodyGyro-Mean-Z`             
* `Average-TimeBodyGyro-StdDev-X`          
* `Average-TimeBodyGyro-StdDev-Y`           
* `Average-TimeBodyGyro-StdDev-Z`          
* `Average-TimeBodyGyroJerk-Mean-X`         
* `Average-TimeBodyGyroJerk-Mean-Y`        
* `Average-TimeBodyGyroJerk-Mean-Z`         
* `Average-TimeBodyGyroJerk-StdDev-X`      
* `Average-TimeBodyGyroJerk-StdDev-Y`       
* `Average-TimeBodyGyroJerk-StdDev-Z`      
* `Average-TimeBodyAccMag-Mean`             
* `Average-TimeBodyAccMag-StdDev`          
* `Average-TimeGravityAccMag-Mean`          
* `Average-TimeGravityAccMag-StdDev`       
* `Average-TimeBodyAccJerkMag-Mean`         
* `Average-TimeBodyAccJerkMag-StdDev`      
* `Average-TimeBodyGyroMag-Mean`            
* `Average-TimeBodyGyroMag-StdDev`         
* `Average-TimeBodyGyroJerkMag-Mean`        
* `Average-TimeBodyGyroJerkMag-StdDev`     
* `Average-FrequencyBodyAcc-Mean-X`         
* `Average-FrequencyBodyAcc-Mean-Y`        
* `Average-FrequencyBodyAcc-Mean-Z`         
* `Average-FrequencyBodyAcc-StdDev-X`      
* `Average-FrequencyBodyAcc-StdDev-Y`       
* `Average-FrequencyBodyAcc-StdDev-Z`      
* `Average-FrequencyBodyAccJerk-Mean-X`     
* `Average-FrequencyBodyAccJerk-Mean-Y`    
* `Average-FrequencyBodyAccJerk-Mean-Z`     
* `Average-FrequencyBodyAccJerk-StdDev-X`  
* `Average-FrequencyBodyAccJerk-StdDev-Y`   
* `Average-FrequencyBodyAccJerk-StdDev-Z`  
* `Average-FrequencyBodyGyro-Mean-X`        
* `Average-FrequencyBodyGyro-Mean-Y`       
* `Average-FrequencyBodyGyro-Mean-Z`        
* `Average-FrequencyBodyGyro-StdDev-X`     
* `Average-FrequencyBodyGyro-StdDev-Y`      
* `Average-FrequencyBodyGyro-StdDev-Z`     
* `Average-FrequencyBodyAccMag-Mean`        
* `Average-FrequencyBodyAccMag-StdDev`     
* `Average-FrequencyBodyAccJerkMag-Mean`    
* `Average-FrequencyBodyAccJerkMag-StdDev` 
* `Average-FrequencyBodyGyroMag-Mean`       
* `Average-FrequencyBodyGyroMag-StdDev`    
* `Average-FrequencyBodyGyroJerkMag-Mean`   
* `Average-FrequencyBodyGyroJerkMag-StdDev`
 
### Subject Labels
These labels refer to the subjects who performed the activity for each window sample. It ranges from 1 to 30.

### Activity Labels
These labels refer to the activity names. There are a total of 6 different types of activities:

* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying