**Please Note: CodeBook.md was created only on Monday, but all its content was previously available in README.md**


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

See the code books for more details.