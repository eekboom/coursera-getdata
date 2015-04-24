# Tidies up the raw data in "UCI HAR Dataset" folder:
# - Merges training and test data sets
# - keeps only columns that measure a mean or standard deviation
# - adds columns for subject and activity
# - groups by subject and activity and calculates mean of each column in each group
# - outputs tidy data to "tidy-data.txt"

# top level directory name of the raw data files
dataRootDir <- "UCI HAR Dataset"

# If main data directory not found in current working directory,
# then set the working directory to the directory this script itself is in
setWorkingDir <- function () {
    dir <- dirname(sys.frame(1)$ofile)
    setwd(dir)
}
if(!(dataRootDir %in% dir())) {
    setWorkingDir()
}

# Load dplyr, install first if needed
if(!require(dplyr)) {
    print("Installing dplyr package")
    install.packages("dplyr")
}
library(dplyr)


# read all column names of main data files
features <- read.table(paste0(dataRootDir, "/features.txt"))
columnNames <- features[, 2]
# We are only interested in columns that end with -mean() and -std()
columnPattern <- "-mean\\(\\)|-std\\(\\)"
# the original column names contain duplicates, so first read the data
# without column names, then select relevant columns by index,
# then set the correct column names for the remaining columns
relevantColumnIndices <- grep(columnPattern, columnNames, value=FALSE)

# read table that contain codes and labels for activities
activityLabelsFile <- paste0(dataRootDir, "/activity_labels.txt")
activityLabels <- read.table(activityLabelsFile, col.names=c("code", "activityLabel"))

# reads either training data (name == "train") or test data (name == "test")
# and returns the tidied (but yet ungrouped) data.
readDataSet <- function (name) {
    dataSetDir <- paste0(dataRootDir, "/", name, "/")

    # read in main data file
    dataFile <- paste0(dataSetDir, "X_", name, ".txt")
    # unfortunately data.table's fread() function fails on this data set, so use the slower read.table()
    data <- read.table(dataFile)
    
    # wrap the data in a dpylr table to make manipulation easier
    data <- tbl_df(data)
    
    # keep only relevant columns
    data <- select(data, relevantColumnIndices)
    # and assign names
    colnames(data) <- columnNames[relevantColumnIndices]
    
    # for each observation this variable contains the activity code
    activityCodes <- read.table(paste0(dataSetDir, "y_", name, ".txt"), col.names="code")
    # add activity label for each code and select only label column
    activityLabelsColumn <- left_join(activityCodes, activityLabels, by="code")$activityLabel
    
    # read in subject numbers
    subjectFile <- paste0(dataSetDir, "subject_", name, ".txt")
    subjectsColumn <- read.table(subjectFile, col.names="subject")$subject

    # add columns for subject and activity to the main data set
    data <- mutate(data, subject=subjectsColumn, activity=activityLabelsColumn)
    # move subject and activity columns to the beginning
    colCount <- ncol(data)
    data <- data[, c(colCount - 1, colCount, 1:(colCount-2))]
    
    return(data)
}

print("Loading training data")
trainData <- readDataSet("train")
print("Loading test data")
testData <- readDataSet("test")

# merge training and test data set
allData <- rbind(trainData, testData)

# group by subject and activity columns and calculate mean value for all other columns
tidyData <-
    allData %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

print("Writing tidy data to tidy-data.txt")
write.table(tidyData, "tidy-data.txt", row.name=FALSE)
