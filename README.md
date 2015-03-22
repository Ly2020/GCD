# GCD
Coursera: Getting and Cleaning Data

Background: 
The purpose of this project is to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis. 

Data Source:
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Raw Data:
The original data set can be downloaded directly from the below site: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Script:
An run_analysis.R script is uploaded to the Github repository. In order to run this script, the zip file above must be downloaded and estracted.  

R script works as follows: 
1. Sets working directory
2. Reads in tables for activity label, features, train sets, and test sets
3. Merges Data into one Table
4. Label all column names with descriptive variable
5. Extracts table with only mean and standard deviation on performance measures
6. Creates index of all mean and std performance measures 
7. Defines performance measures - mean and std
8. Creates 1st Tidy Data Set 
9. Creates 2nd Tidy Set, which averages across all mean and std measures by the 30 subjects 
10. Write a final table with a summary grouped by all 30 participants showing average for each of the key performance measures 

Code Book:
A Code Book is uploaded to the Github repository describing the final variables