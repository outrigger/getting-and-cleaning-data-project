# Creation of Tidy Dataset based on "Human Activity Recognition using Smartphones Dataset"
---
## Overview
There are a total of 4 main files in this GitHub Repository.

* run_analysis.R

	*This is the actual R script that contains all code for creating the final tidy dataset.*

* CodeBook.md

	*This file contains all information about the variables, data and transformation process used in the course of cleaning up the original dataset.*	

* README.md

	*This file gives an overview of the files within this repository and explains how the script works.*

* tidyDataset.txt

	*This file contains the final output of the `run_analysis.R` script (a tidy data set with the average of each variable for each activity and each subject).*

## Instructions
1. Set your preferred working directory in RStudio.
2. Run the code within the `run_analysis.R` script.

### Dependencies
*  This project makes use of the [`plyr`](http://cran.r-project.org/web/packages/plyr/index.html) library.

	*The `run_analysis.R` script will install this library automatically if the user does not have it installed previously.*

### Dataset

* This project uses the [Human Activity Recognition using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) ([download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)) from the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html).

	*The `run_analysis.R` script will automatically download and unzip the dataset if the user has not downloaded the dataset prior to running the script.*



