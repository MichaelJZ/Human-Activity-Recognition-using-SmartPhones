Human-Activity-Recognition-using-SmartPhones
============================================
To run run_analysis.R, first:<br />
Download the dataset from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br />
Unzip the dataset and navigate into the UCI HAR Dataset folder and set it as your working directory

Step by step look at what run_analysis.R does:
<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Labels the columns of our data set with descriptive measurement names listed in the "features" document.</li>
<li>Extracts only the mean and standard deviation measurements from our data set.</li>
<li>Labels our data with the activity performed when the data was measured, using "y_test" and "y_train" and the "activity_labels" documents.</li>
<li>Labels our data with the subject performing the activity, using the "subject_test" and subject_train" documents.</li>
<li>Creates a tidy data set containing the averages of each measurement for each subject and each activity.</li>
<li>Writes the tidy data set into a text file titled "TidyData".</li>
</ol>
