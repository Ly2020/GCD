##Human Activity Recognition Using Smartphones Data Set 
##Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

WD <- "/Users/Ly2020/RProgramming"              #Working Directory
if(!identical(getwd(), WD)) setwd(WD)           ##Check WD
getwd()                                         ##print WD

if(!file.exists("data")){                       ##Check for a data subfolder
        dir.create("data")                      ##Create data subfolder if necessary 
}                              

##Read Files: Activity, Feature, Test (set), Train (set)
list.files("./data")
activity_labels <- read.table("./data/activity_labels.txt", sep = "")
features <- read.table("./data/features.txt", sep = "")
X_test <- read.table("./data/X_test.txt")
y_test <- read.table("./data/y_test.txt")
subject_test <- read.table("./data/subject_test.txt")
X_train <- read.table("./data/X_train.txt")
y_train <- read.table("./data/y_train.txt")
subject_train <- read.table("./data/subject_train.txt")
View(features); View(activity_labels); 
View(X_test); View(y_test); View(subject_test);
View(X_train); View(y_train); View(subject_train); 

##Merges the training and the test sets to create one data set
subject_all <- rbind(subject_test, subject_train)       ##Row Bind the subject data sets test + train
names(subject_all) <- "Subject_ID"

X_all <- rbind(X_test, X_train)                         ##Row Bind the X data sets test + train
colnames(X_all) <- features[,2]                         ##Name column headers using the features file
View(X_all)

y_all <- rbind(y_test, y_train)                         ##Row Bind the y data sets test + train

##Uses descriptive activity names to name the activities in the data set
y_all$V1 <- as.factor(y_all$V1)
levels(y_all) <- activity_labels
y_all$V1 <- factor(y_all$V1, labels = activity_labels$V2)
names(y_all) <- "Activities"
View(y_all)

Xy_all <- cbind(y_all, X_all)                           ##Column Bind the X and y datasets
View(Xy_all)
subject_Xy_all <- cbind(subject_all, Xy_all)            ##Column Bind the subject and Xy datasets
View(subject_Xy_all)

##Extracts only the measurements on the mean and standard deviation for each measurement 
if(!"dplyr" %in% installed.packages()) install.packages("dplyr")          ##check if package exist, if not then install
if(!"tidyr" %in% installed.packages()) install.packages("tidyr")
if(!"reshape" %in% installed.packages()) install.packages("reshape")
if(!"plyr" %in% installed.packages()) install.packages("plyr")

library(dplyr); library(tidyr); library(reshape); library(plyr); 

var <- names(subject_Xy_all)
meanIndex <- grep("*mean", var)
stdIndex <- grep("*std", var)

mean_std_Table <- cbind(subject_Xy_all[1:2], subject_Xy_all[meanIndex], subject_Xy_all[stdIndex])
var2 <- names(mean_std_Table); 

##List of index for mean and std performance measures
tBodyAccMeanIndex <- grep("*tBodyAcc-mean", var2)                       ##Index Acc Mean
tBodyAccSTDIndex <- grep("*tBodyAcc-std", var2)                         ##Index Acc STD
tBodyGravityMeanIndex <- grep("*tGravityAcc-mean", var2)                ##Index Gravity Mean
tBodyGravitySTDIndex <- grep("*tGravityAcc-std", var2)                  ##Index Gravity STD
tBodyAccJerkMeanIndex <- grep("tBodyAccJerk-mean", var2)                ##Index ACCJerk Mean 
tBodyAccJerkSTDIndex <- grep("tBodyAccJerk-std", var2)                  ##Index ACCJerk STD
tBodyGyroMeanIndex <- grep("tBodyGyro-mean", var2)                      ##Index Gyro Mean
tBodyGyroSTDIndex <- grep("tBodyGyro-std", var2)                        ##Index Gyro STD
tBodyGyroJerkMeanIndex <- grep("tBodyGyroJerk-mean", var2)              ##Index Gyro Mean
tBodyGyroJerkSTDIndex <- grep("tBodyGyroJerk-std", var2)                ##Index Gyro STD
tBodyAccMagMeanIndex <- grep("tBodyAccMag-mean", var2)                  ##Index AccMag Mean
tBodyAccMagSTDIndex <- grep("tBodyAccMag-std", var2)                    ##Index Acc STD Mean
tGravityAccMagMeanIndex <- grep("tGravityAccMag-mean", var2)            ##Index Gravity Acc Mag Mean
tGravityAccMagSTDIndex <- grep("tGravityAccMag-std", var2)              ##Index Gravity Acc Mag STD
tBodyAccJerkMagMeanIndex <- grep("tBodyAccJerkMag-mean", var2)          ##Index Acc Jerk Mag Mean
tBodyAccJerkMagSTDIndex <- grep("tBodyAccJerkMag-std", var2)            ##Index Acc Jerk Mag STD
tBodyGyroMagMeanIndex <- grep("tBodyGyroMag-mean", var2)                ##Index Gyro Mag Mean
tBodyGyroMagSTDIndex <- grep("tBodyGyroMag-std", var2)                  ##Index Gyro Mag STD
tBodyGyroJerkMagMeanIndex <- grep("tBodyGyroJerkMag-mean", var2)        ##Index Gyro Jerk Mag Mean
tBodyGyroJerkMagSTDIndex <- grep("tBodyGyroJerkMag-std", var2)          ##Index Gyro Jerk Mag STD
fBodyAccMeanIndex <- var2[23:25]                                        ##Index f Acc Mean
fBodyAccMeanFreqIndex <- var2[26:28]                                    ##Index f Acc MeanFreq
fBodyAccSTDIndex <- grep("fBodyAcc-std", var2)                          ##Index f Acc STD
fBodyAccJerkMeanIndex <- var2[29:31]                                    ##Index f Acc Jerk Mean
fBodyAccJerkMeanFreqIndex <- var2[32:34]                                ##Index f Acc Jerk MeanFreq
fBodyAccJerkSTDIndex <- grep("fBodyAccJerk-std", var2)                  ##Index f Acc Jerk STD
fBodyGyroMeanIndex <- var2[35:37]                                       ##Index f Gyro Mean
fBodyGyroMeanFreqIndex <- var2[38:40]                                   ##Index f Gyro MeanFreq
fBodyGyroSTDIndex <- grep("fBodyGyro-std", var2)                        ##Index f Gyro STD
fBodyAccMagMeanIndex <- var2[41]                                        ##Index f Acc Mag Mean
fBodyAccMagMeanFreqIndex <- var2[42]                                    ##Index f Acc Mag MeanFreq
fBodyAccMagSTDIndex <- grep("fBodyAccMag-std", var2)                    ##Index f Acc Mag STD
fBodyAccJerkMagMeanIndex <- var2[43]                                    ##Index f Acc Jerk Mag Mean
fBodyAccJerkMagMeanFreqIndex <- var2[44]                                    ##Index f Acc Jerk Mag MeanFreq
fBodyAccJerkMagSTDIndex <- grep("fBodyBodyAccJerkMag-std", var2)        ##Index f Acc Jerk Mag STD
fBodyGyroMagMeanIndex <- var2[45]                                       ##Index f Gyro Mag Mean
fBodyGyroMagMeanFreqIndex <- var2[46]                                   ##Index f Gyro Mag MeanFreq
fBodyGyroMagSTDIndex <- grep("fBodyBodyGyroMag-std", var2)              ##Index f Gyro Mag STD
fBodyGyroJerkMagMeanIndex <- var2[47]                                   ##Index f Gyro Jerk Mag Mean
fBodyGyroJerkMagMeanFreqIndex <- var2[48]                                   ##Index f Gyro Jerk Mag MeanFreq
fBodyGyroJerkMagSTDIndex <- grep("fBodyBodyGyroJerkMag-std", var2)      ##Index f Gyro Jerk Mag STD

##Melt XYZ data for each performance measure into tidy format for analysis
##Appropriately labels the data set with descriptive variable names
tBodyAccMean <- melt(mean_std_Table[,tBodyAccMeanIndex])
names(tBodyAccMean) <- c("tBodyAcc-mean","tBodyAcc-meanValue")
tBodyAccSTD <- melt(mean_std_Table[,tBodyAccSTDIndex])
names(tBodyAccSTD) <- c("tBodyAccSTD", "tBodyAccSTDValue")
tBodyGravityMean <- melt(mean_std_Table[,tBodyGravityMeanIndex])
names(tBodyGravityMean) <- c("tBodyGravityMean","tBodyGravityMeanValue")
tBodyGravitySTD <- melt(mean_std_Table[,tBodyGravitySTDIndex])
names(tBodyGravitySTD) <- c("tBodyGravitySTD", "tBodyGravitySTDValue")
tBodyAccJerkMean <- melt(mean_std_Table[,tBodyAccJerkMeanIndex])
names(tBodyAccJerkMean) <- c("tBodyAccJerkMean","tBodyAccJerkMeanValue")
tBodyAccJerkSTD <- melt(mean_std_Table[,tBodyAccJerkSTDIndex])
names(tBodyAccJerkSTD) <- c("tBodyAccJerkSTD", "tBodyAccJerkSTDValue")
tBodyGyroMean <- melt(mean_std_Table[,tBodyGyroMeanIndex])
names(tBodyGyroMean) <- c("tBodyGyroMean", "tBodyGyroMeanValue")
tBodyGyroSTD <- melt(mean_std_Table[,tBodyGyroSTDIndex])
names(tBodyGyroSTD) <- c("tBodyGyroSTD", "tBodyGyroSTDValue")
tBodyGyroJerkMean <- melt(mean_std_Table[,tBodyGyroJerkMeanIndex])
names(tBodyGyroJerkMean) <- c("tBodyGyroJerkMean","tBodyGyroJerkMeanValue")
tBodyGyroJerkSTD <- melt(mean_std_Table[,tBodyGyroJerkSTDIndex])
names(tBodyGyroJerkSTD) <- c("tBodyGyroJerkSTD","tBodyGyroJerkSTDValue")
tBodyAccMagMean <- melt(mean_std_Table[,tBodyAccMagMeanIndex])
names(tBodyAccMagMean) <- "tBodyAccMagMeanValue"
tBodyAccMagSTD <- melt(mean_std_Table[,tBodyAccMagSTDIndex])
names(tBodyAccMagSTD) <- "tBodyAccMagSTDValue"
tGravityAccMagMean <- melt(mean_std_Table[,tGravityAccMagMeanIndex])
names(tGravityAccMagMean) <- "tGravityAccMagMeanValue"
tGravityAccMagSTD <- melt(mean_std_Table[,tGravityAccMagSTDIndex])
names(tGravityAccMagSTD) <- "tGravityAccMagSTDValue"
tBodyAccJerkMagMean <- melt(mean_std_Table[,tBodyAccJerkMagMeanIndex])
names(tBodyAccJerkMagMean) <- "tBodyAccJerkMagMeanValue"
tBodyAccJerkMagSTD <- melt(mean_std_Table[,tBodyAccJerkMagSTDIndex])
names(tBodyAccJerkMagSTD) <- "tBodyAccJerkMagSTDValue"
tBodyGyroMagMean <- melt(mean_std_Table[,tBodyGyroMagMeanIndex])
names(tBodyGyroMagMean) <- "tBodyGyroMagMeanValue"
tBodyGyroMagSTD <- melt(mean_std_Table[,tBodyGyroMagSTDIndex])
names(tBodyGyroMagSTD) <- "tBodyGyroMagSTDValue"
tBodyGyroJerkMagMean <- melt(mean_std_Table[,tBodyGyroJerkMagMeanIndex])
names(tBodyGyroJerkMagMean) <- "tBodyGyroJerkMagMeanValue"
tBodyGyroJerkMagSTD <- melt(mean_std_Table[,tBodyGyroJerkMagSTDIndex])
names(tBodyGyroJerkMagSTD) <- "tBodyGyroJerkMagSTDValue"
fBodyAccMean <- melt(mean_std_Table[,fBodyAccMeanIndex])
names(fBodyAccMean) <- c("fBodyAccMean","fBodyAccMeanValue")
fBodyAccMeanFreq <- melt(mean_std_Table[,fBodyAccMeanFreqIndex])
names(fBodyAccMeanFreq) <- c("fBodyAccMeanFreq","fBodyAccMeanFreqValue")
fBodyAccSTD <- melt(mean_std_Table[,fBodyAccSTDIndex])
names(fBodyAccSTD) <- c("fBodyAccSTD", "fBodyAccSTDValue")
fBodyAccJerkMean <- melt(mean_std_Table[,fBodyAccJerkMeanIndex])
names(fBodyAccJerkMean) <- c("fBodyAccJerkMean", "fBodyAccJerkMeanValue")
fBodyAccJerkMeanFreq <- melt(mean_std_Table[,fBodyAccJerkMeanFreqIndex])
names(fBodyAccJerkMeanFreq) <- c("fBodyAccJerkMeanFreq", "fBodyAccJerkMeanFreqValue")
fBodyAccJerkSTD <- melt(mean_std_Table[,fBodyAccJerkSTDIndex])
names(fBodyAccJerkSTD) <- c("fBodyAccJerkSTD", "fBodyAccJerkSTDValue")
fBodyGyroMean <- melt(mean_std_Table[,fBodyGyroMeanIndex])
names(fBodyGyroMean) <- c("fBodyGyroMean", "fBodyGyroMeanValue")
fBodyGyroMeanFreq <- melt(mean_std_Table[,fBodyGyroMeanFreqIndex])
names(fBodyGyroMeanFreq) <- c("fBodyGyroMeanFreq", "fBodyGyroMeanFreqValue")
fBodyGyroSTD <- melt(mean_std_Table[,fBodyGyroSTDIndex])
names(fBodyGyroSTD) <- c("fBodyGyroSTD", "fBodyGyroSTDValue")
fBodyAccMagMean <- melt(mean_std_Table[,fBodyAccMagMeanIndex])
names(fBodyAccMagMean) <- "fBodyAccMagMeanValue"
fBodyAccMagMeanFreq <- melt(mean_std_Table[,fBodyAccMagMeanFreqIndex])
names(fBodyAccMagMeanFreq) <- "fBodyAccMagMeanFreqValue"
fBodyAccMagSTD <- melt(mean_std_Table[,fBodyAccMagSTDIndex])
names(fBodyAccMagSTD) <- "fBodyAccMagSTDValue"
fBodyAccJerkMagMean <- melt(mean_std_Table[,fBodyAccJerkMagMeanIndex])
names(fBodyAccJerkMagMean) <- "fBodyAccJerkMagMeanValue"
fBodyAccJerkMagMeanFreq <- melt(mean_std_Table[,fBodyAccJerkMagMeanFreqIndex])
names(fBodyAccJerkMagMeanFreq) <- "fBodyAccJerkMagMeanFreqValue"
fBodyAccJerkMagSTD <- melt(mean_std_Table[,fBodyAccJerkMagSTDIndex])
names(fBodyAccJerkMagSTD) <- "fBodyAccJerkMagSTDValue"
fBodyGyroMagMean <- melt(mean_std_Table[,fBodyGyroMagMeanIndex])
names(fBodyGyroMagMean) <- "fBodyGyroMagMeanValue"
fBodyGyroMagMeanFreq <- melt(mean_std_Table[,fBodyGyroMagMeanFreqIndex])
names(fBodyGyroMagMeanFreq) <- "fBodyGyroMagMeanFreqValue"
fBodyGyroMagSTD <- melt(mean_std_Table[,fBodyGyroMagSTDIndex])
names(fBodyGyroMagSTD) <- "fBodyGyroMagSTDValue"
fBodyGyroJerkMagMean <- melt(mean_std_Table[,fBodyGyroJerkMagMeanIndex])
names(fBodyGyroJerkMagMean) <- "fBodyGyroJerkMagMeanValue"
fBodyGyroJerkMagMeanFreq <- melt(mean_std_Table[,fBodyGyroJerkMagMeanFreqIndex])
names(fBodyGyroJerkMagMeanFreq) <- "fBodyGyroJerkMagMeanFreqValue"
fBodyGyroJerkMagSTD <- melt(mean_std_Table[,fBodyGyroJerkMagSTDIndex])
names(fBodyGyroJerkMagSTD) <- "fBodyGyroJerkMagSTDValue"

##1st Data Set with Appropriately Labels (variable names)
Tidy1 <- cbind(subject_Xy_all[1:2],tBodyAccMean, tBodyAccSTD, tBodyGravityMean, tBodyGravitySTD, 
               tBodyAccJerkMean, tBodyAccJerkSTD, tBodyGyroMean, tBodyGyroSTD, tBodyGyroJerkMean, tBodyGyroJerkSTD, 
               tBodyAccMagMean, tBodyAccMagSTD, tGravityAccMagMean, tGravityAccMagSTD, tBodyAccJerkMagMean, tBodyAccJerkMagSTD, 
               tBodyGyroMagMean, tBodyGyroMagSTD, tBodyGyroJerkMagMean, tBodyGyroJerkMagSTD, fBodyAccMean, fBodyAccMeanFreq, 
               fBodyAccSTD, fBodyAccJerkMean, fBodyAccJerkMeanFreq, fBodyAccJerkSTD, fBodyGyroMean, fBodyGyroMeanFreq, 
               fBodyGyroSTD, fBodyAccMagMean, fBodyAccMagMeanFreq, 
               fBodyAccMagSTD, fBodyAccJerkMagMean, fBodyAccJerkMagMeanFreq, fBodyAccJerkMagSTD, fBodyGyroMagMean, fBodyGyroMagMeanFreq, fBodyGyroMagSTD, fBodyGyroJerkMagMean, 
               fBodyGyroJerkMagMeanFreq, fBodyGyroJerkMagSTD)

##2nd Data Set with the Average for each activity and each subject
Tidy2 <- cbind(subject_Xy_all[1],tBodyAccMean[2], tBodyAccSTD[2], tBodyGravityMean[2], tBodyGravitySTD[2], 
               tBodyAccJerkMean[2], tBodyAccJerkSTD[2], tBodyGyroMean[2], tBodyGyroSTD[2], tBodyGyroJerkMean[2], tBodyGyroJerkSTD[2], 
               tBodyAccMagMean[1], tBodyAccMagSTD[1], tGravityAccMagMean[1], tGravityAccMagSTD[1], tBodyAccJerkMagMean[1], tBodyAccJerkMagSTD[1], 
               tBodyGyroMagMean[1], tBodyGyroMagSTD[1], tBodyGyroJerkMagMean[1], tBodyGyroJerkMagSTD[1], fBodyAccMean[2], fBodyAccMeanFreq[2], 
               fBodyAccSTD[2], fBodyAccJerkMean[2], fBodyAccJerkMeanFreq[2], fBodyAccJerkSTD[2], fBodyGyroMean[2], fBodyGyroMeanFreq[2], 
               fBodyGyroSTD[2], fBodyAccMagMean[1], fBodyAccMagMeanFreq[1], fBodyAccMagSTD[1], fBodyAccJerkMagMean[1], fBodyAccJerkMagMeanFreq[1], 
               fBodyAccJerkMagSTD[1], fBodyGyroMagMean[1], fBodyGyroMagMeanFreq[1], fBodyGyroMagSTD[1], fBodyGyroJerkMagMean[1], 
               fBodyGyroJerkMagMeanFreq[1], fBodyGyroJerkMagSTD[1])

IndependentTable <- Tidy2 %>% group_by(Subject_ID) %>% summarise_each(funs(mean))

##Upload the independent tidy data set. 
##Upload data set as a txt file created with write.table() using row.name=FALSE

write.table(IndependentTable, file = "./data/TidyData2")
