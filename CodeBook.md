# Code Book

## Input 
# Data
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

# Data records
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

## Steps performed:
* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measuremen. 
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive activity names. 
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.

### tidy_data
* body_acc_xy_mean: The average body acceleration signal obtained by subtracting the gravity from the total acceleration

* body_acc_xy_sd: The std deviation of the body acceleration signal obtained by subtracting the gravity from the total acceleration.

* body_gyro_xy_mean: The average angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

* body_gyro_xy_sd: The std deviation of the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

* total_acc_xy_mean: The average acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.

* total_acc_xy_sd: The std deviation of the acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.
