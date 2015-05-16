Summary
========

This folder contains files that comprise the course project assignment from the Coursera course "Getting and Cleaning Data." The goal of this project was to create a script that would take data from a relatively raw form and produce a "tidy data set" that met specific criteria.

# Description of Files

* `README.md` - this file which includes a description of the assignment and analysis in `run_analysis.R`
* `HARUS_data` - a folder containing the UCI HARUS project datafiles used for this analysis -- not the complete data. See codebook for source info, links to complete dataset and citation.
* `run_analysis.R` - an R script that processes data to produce the "mean_summary" file
* `mean_summary.txt` - the file produced by the R script.
  it can be loaded in r using this command:
  data <- read.table(file_path, header = TRUE) 
* `codebook.md` - a codebook that describes the contents/purpose of `mean_summary.txt`

# Description of the Assignment (from Coursera)
*You should create one R script called run_analysis.R that does the following.*

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Description of the Analysis
1.Merge the test and train files into a single dataset
  
--    a. load the test/train initial files (6 total).

--    b. combine each of the test/train data tables (3 total)

--    b2. apply names to columns (modifying non-R compliant names, where needed)

--    d. create a single dataframe

2.Extract only the measurements on the mean and standard deviation for each measurement

--     a. determine which columns to include in this subset 

--    a2. select the ids from features of data colnames `*-mean()*` 

--    a3. select the ids from features of data colnames `*-std()*`

--    b. create a dataframe that only contains the 68 columns of interest  -- SubjectID, Activity Code, and mean and std vars

3.Use descriptive activity names to name the activities in the data set

--    a.read in activity label names from file; V1 == activity id, V2 == long name
--    b. assign an activity name to each entry based on the activity numbered label
--    c. convert to factors
  
4.Appropriately labels the data set with descriptive variable names.
    (This was accomplished within step 1b -- but is #4 in the assignment)

5.Create a second, independent tidy data set with the average of each variable for each activity and each subject.
 --    a. put the data in a nice tidy order (by each subject, then by activity)

--    b. remove the numbered activity code (superflous, due to named factors)
 
--    c. write the table to file
