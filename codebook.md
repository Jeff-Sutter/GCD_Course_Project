
# Notes on Original Dataset

See the `HARUS_data/README.txt` file for information about the original study purpose
More information is available on the data's website: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

License for usage/publication of work using this data requires citation of this publication:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

See the data's readme file for more information.


# Study Design for this Analysis

This analysis 

1. takes data collected for the UCI HARUS and aggregates X, y, and subjects files from the train and test sets and aggregates them
2. calculates the mean for all mean ("foo.mean()") and sd ("foo.sd()") variables contained in the original dataset (see `HARUS_data/features.txt`)
3. sorts the results by subject number and activity type (see `HARUS_data/README.txt` )
4. outputs this table as `mean_summary.txt`

# Codebook

The HARUS dataset summarizes measurements taken by the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ on a Samsung Galaxy S II. Detailed information on the measurements and processing of this data to produce the products is described in the `README.txt` and the `features_info.txt` files in the `HARUS_data` folder.

Variable names from the original dataset follow the format
`FEATURE-STATTYPE()-XYZ`
 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**Units**: Features of the original data set (and thus results of this analysis) are normalized and bounded within [-1,1].

This analysis only extracted STATTYPES mean and std.
The column names are altered slightly from the original feature list to reflect name limitations in R.
'-' and '()' have been replaced with '.'

The extracted stattypes were then averaged across each activity (6) for each subject (n = 30) such that there are 6 rows dedicated to each subject and 66 average variables recorded for each `subject, activity` combination (columns 3:68)

## Columns (Variable Names)  in mean_summary.txt
1. `SubjectID` - numeric id of subjects (1:30)
2. `Activity_name` - a string label indicating one of 6 activities recorded 
       `(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)`
3. `tBodyAcc.mean.X`
4. `tBodyAcc.mean.Y`
5. `tBodyAcc.mean.Z`
6. `tGravityAcc.mean.X`
7. `tGravityAcc.mean.Y`
8. `tGravityAcc.mean.Z`
9. `tBodyAccJerk.mean.X`
10. `tBodyAccJerk.mean.Y`
11. `tBodyAccJerk.mean.Z`
12. `tBodyGyro.mean.X`
13. `tBodyGyro.mean.Y`
14. `tBodyGyro.mean.Z`
15. `tBodyGyroJerk.mean.X`
16. `tBodyGyroJerk.mean.Y`
17. `tBodyGyroJerk.mean.Z`
18. `tBodyAccMag.mean.`
19. `tGravityAccMag.mean.`
20. `tBodyAccJerkMag.mean.`
21. `tBodyGyroMag.mean.`
22. `tBodyGyroJerkMag.mean.`
23. `fBodyAcc.mean.X`
24. `fBodyAcc.mean.Y`
25. `fBodyAcc.mean.Z`
26. `fBodyAccJerk.mean.X`
27. `fBodyAccJerk.mean.Y`
28. `fBodyAccJerk.mean.Z`
29. `fBodyGyro.mean.X`
30. `fBodyGyro.mean.Y`
31. `fBodyGyro.mean.Z`
32. `fBodyAccMag.mean.`
33. `fBodyBodyAccJerkMag.mean.`
34. `fBodyBodyGyroMag.mean.`
35. `fBodyBodyGyroJerkMag.mean.`
36. `tBodyAcc.std.X`
37. `tBodyAcc.std.Y`
38. `tBodyAcc.std.Z`
39. `tGravityAcc.std.X`
40. `tGravityAcc.std.Y`
41. `tGravityAcc.std.Z`
42. `tBodyAccJerk.std.X`
43. `tBodyAccJerk.std.Y`
44. `tBodyAccJerk.std.Z`
45. `tBodyGyro.std.X`
46. `tBodyGyro.std.Y`
47. `tBodyGyro.std.Z`
48. `tBodyGyroJerk.std.X`
49. `tBodyGyroJerk.std.Y`
50. `tBodyGyroJerk.std.Z`
51. `tBodyAccMag.std.`
52. `tGravityAccMag.std.`
53. `tBodyAccJerkMag.std.`
54. `tBodyGyroMag.std.`
55. `tBodyGyroJerkMag.std.`
56. `fBodyAcc.std.X`
57. `fBodyAcc.std.Y`
58. `fBodyAcc.std.Z`
59. `fBodyAccJerk.std.X`
60. `fBodyAccJerk.std.Y`
61. `fBodyAccJerk.std.Z`
62. `fBodyGyro.std.X`
63. `fBodyGyro.std.Y`
64. `fBodyGyro.std.Z`
65. `fBodyAccMag.std.`
66. `fBodyBodyAccJerkMag.std.`
67. `fBodyBodyGyroMag.std.`
68. `fBodyBodyGyroJerkMag.std.`


.
