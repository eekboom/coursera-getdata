
# Human Activity Recognition Using Smartphones: Data Cleanup
This is my solution of the
[course project](https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions)
of Coursera's [Getting and Cleaning Data](https://www.coursera.org/course/getdata).

It uses the raw data described here:
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
and processes it into a clean and aggregated data set.

##Study design and data processing

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing 
a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial 
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to
label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which
has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 
0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the
time and frequency domain. 

###Collection of the raw data
The data was downloaded from the
 [download link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
at the 
 [course project page](https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions)
and then unzipped at the project root.

See directory "UCI HAR Dataset". 

See the file README.txt in that directory for more info on the raw data.
 
##Creating the tidy datafile
 
Check out the github repository.

Run the file "run_analysis.R" to recreate the tidy data "tidy-data.txt".

Alternatively just download "run_analysis.R" and run it whith the raw data being present in the working directory.
 
##Cleaning of the data

The raw data contains information in several files.

* Training data and test data is separated.
* The subject that each observation belongs to is contained in a separate file.
* Activities are only given as a code number . The mapping between activity code and readable label is again only
  given in a separate table.

The clean up code

* merges all those parts into one file
* selects only measurements of mean and standard deviation columns
* groups the data by subject and activity and calculates the mean of each column for each group.

See the documented code in "run_analysis.R" for details.
 
##Description of the variables in the tidy-data.txt file

The tidy data contains 181 observations with 68 variables.

The first two columns indicate the subject index (a particular human, who participated in the test) and the action
that the subject was executing while the data was measured.

The rest of the columns are mean values of measured sensor data.


To avoid very long column names some abbreviations are used in the names.
The column names are made up of these parts:
* time: this measurement was take at a constant rate of 50 Hz
* frequency: values in the frequency domain obtained using a Fast Fourier Transformation on the time domain data
* Acc: Acceleration  obtained from tzhe device's built-in accelerometer
* Body: The body acceleration part of the total acceleration
* Grav: The gravity acceleration part of the total acceleration
* Gyro: Data obtained from the device's built-in gyrometer
* Mag: Magnitude
* Jerk: Velocity derived in time to obtain jerk signals
* _mean: Mean value
* _std: Standard Deviation
* _X, _Y, _Z: Acceleration along one specific axis

See the file from the raw data set for more specific information: "UCI HAR Dataset/features_info.txt". 

All columns in the tidy data set:
  
1. subject
2. activity
3. timeBodyAcc_mean_X
4. timeBodyAcc_mean_Y
5. timeBodyAcc_mean_Z
6. timeBodyAcc_std_X
7. timeBodyAcc_std_Y
8. timeBodyAcc_std_Z
9. timeGravityAcc_mean_X
10. timeGravityAcc_mean_Y
11. timeGravityAcc_mean_Z
12. timeGravityAcc_std_X
13. timeGravityAcc_std_Y
14. timeGravityAcc_std_Z
15. timeBodyAccJerk_mean_X
16. timeBodyAccJerk_mean_Y
17. timeBodyAccJerk_mean_Z
18. timeBodyAccJerk_std_X
19. timeBodyAccJerk_std_Y
20. timeBodyAccJerk_std_Z
21. timeBodyGyro_mean_X
22. timeBodyGyro_mean_Y
23. timeBodyGyro_mean_Z
24. timeBodyGyro_std_X
25. timeBodyGyro_std_Y
26. timeBodyGyro_std_Z
27. timeBodyGyroJerk_mean_X
28. timeBodyGyroJerk_mean_Y
29. timeBodyGyroJerk_mean_Z
30. timeBodyGyroJerk_std_X
31. timeBodyGyroJerk_std_Y
32. timeBodyGyroJerk_std_Z
33. timeBodyAccMag_mean
34. timeBodyAccMag_std
35. timeGravityAccMag_mean
36. timeGravityAccMag_std
37. timeBodyAccJerkMag_mean
38. timeBodyAccJerkMag_std
39. timeBodyGyroMag_mean
40. timeBodyGyroMag_std
41. timeBodyGyroJerkMag_mean
42. timeBodyGyroJerkMag_std
43. frequencyBodyAcc_mean_X
44. frequencyBodyAcc_mean_Y
45. frequencyBodyAcc_mean_Z
46. frequencyBodyAcc_std_X
47. frequencyBodyAcc_std_Y
48. frequencyBodyAcc_std_Z
49. frequencyBodyAccJerk_mean_X
50. frequencyBodyAccJerk_mean_Y
51. frequencyBodyAccJerk_mean_Z
52. frequencyBodyAccJerk_std_X
53. frequencyBodyAccJerk_std_Y
54. frequencyBodyAccJerk_std_Z
55. frequencyBodyGyro_mean_X
56. frequencyBodyGyro_mean_Y
57. frequencyBodyGyro_mean_Z
58. frequencyBodyGyro_std_X
59. frequencyBodyGyro_std_Y
60. frequencyBodyGyro_std_Z
61. frequencyBodyAccMag_mean
62. frequencyBodyAccMag_std
63. frequencyBodyAccJerkMag_mean
64. frequencyBodyAccJerkMag_std
65. frequencyBodyGyroMag_mean
66. frequencyBodyGyroMag_std
67. frequencyBodyGyroJerkMag_mean
68. frequencyBodyGyroJerkMag_std
