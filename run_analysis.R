# ACR1 - Peer Assessment Course Project for "Getting and Cleaning Data"
# Coursera Class, due May 24 2015
# ============================================
# Assignment spec: 
# You should create one R script called run_analysis that
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.
# ============================================

# --------------------------------------------
# 1 - Merge the test and train files into a single dataset

# a. load the test/train initial files.

subject_train <- read.table("HARUS_data/train/subject_train.txt", quote="\"")
X_train <- read.table("HARUS_data/train/X_train.txt", quote="\"")
y_train <- read.table("HARUS_data/train/y_train.txt", quote="\"")

subject_test <- read.table("HARUS_data/test/subject_test.txt", quote="\"")
X_test <- read.table("HARUS_data/test/X_test.txt", quote="\"")
y_test <- read.table("HARUS_data/test/y_test.txt", quote="\"")

# b. combine each of the test/train data tables
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subjects <- rbind(subject_train, subject_test)

# make life easier by labeling these columns.
colnames(y)[1] = "Activ_Num_label"
colnames(subjects)[1] = "SubjectID"

# get the variable names for the activity measurements in X
# V1 is corresponds to the COL in X, V2 is the long name
x_names <- read.table("HARUS_data/features.txt", quote="\"", stringsAsFactors=FALSE)
# make the feature names appropriate R "names" i.e.: legal column names
x_names$V2 <- make.names(x_names$V2, unique = FALSE, allow_ = TRUE)
# make.names adds an absurd number of '.' -- clean up the worst of it.
x_names$V2 <- sub('...', '.', x_names$V2, fixed=TRUE)
x_names$V2 <- sub('..', '.', x_names$V2, fixed=TRUE)


# name all the columns.
colnames(X)[x_names$V1] = x_names$V2

# c. create single df  
data <- cbind(X,y, subjects) # REQUIRED SINGLE DATA FRAME 


# --------------------------------------------
# 2. Extracts only the measurements on the mean and standard 
#    deviation for each measurement

# a. determine which columns to include in this subset
# id index from x_names for data colnames '*-mean()' in features.txt)
mean_name_index <-  grep('mean.', x_names$V2, ignore.case = FALSE, fixed = TRUE)
# id index from x_names for data colnames '*-std()' in features.txt)
std_name_index <-  grep('std.', x_names$V2, ignore.case = FALSE, fixed = TRUE)

# b. create the subset of data
mean_std_var_names <-c(x_names$V2[mean_name_index], x_names$V2[std_name_index])
vars_to_extract <-  c('Activ_Num_label','SubjectID', mean_std_var_names )

# make subset with 68 columns -- SubjectID, Activity Code, and mean and std vars
dataSubset <- data[,vars_to_extract]


# --------------------------------------------
# 3. Use descriptive activity names to name the activities in the data set
# read in activity label names from file; V1 == activity id, V2 == long name
activity_labels <- read.table("HARUS_data/activity_labels.txt", quote="\"", 
                              stringsAsFactors=FALSE)
# assign an activity name to each entry based on the activity numbered label
dataSubset$Activity_name <- activity_labels$V2[dataSubset$Activ_Num_label]
# these variable names for activities are useful as factors
dataSubset$Activity_name <- as.factor(dataSubset$Activity_name)


# --------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names.
#    (This was accomplished within step 1b (look above! line 24 - 34)


# --------------------------------------------
# 5. Create a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
library(plyr)
mean_summary <- ddply(dataSubset, c("SubjectID", "Activity_name"), 
                      numcolwise(mean))
# get rid of useless stuff
mean_summary$Activ_Num_label = NULL
# put the data in a nice tidy order (by each subject, then by activity)
mean_summary = mean_summary[with(mean_summary, order(SubjectID, 
                                                     Activity_name)),]

# write the table to file
write.table(mean_summary, file = "mean_summary.txt", append = FALSE, 
            quote = TRUE, sep = " ", eol = "\n", na = "NA", dec = ".", 
            row.names = FALSE, col.names = TRUE, 
            qmethod = c("escape", "double"), fileEncoding = "")
