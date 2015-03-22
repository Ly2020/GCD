Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Script: run_analysis.R 
Markdown: README.md 

Features.Info: Original data provides background on the key variables tracked including the following: 
tBodyAcc-XYZ 
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

CodeBook: run_analysis will gather the individual variables (X,Y,Z) and collapse them into a tidy set according to the above features.  Primary functions are Mean and Standard Deviation.  The independent data set contains 42 key variables.  

subject_Xy_all:          subject <br>
tBodyAccMean:            Mean of tBodyAcc <br>
tBodyAccSTD:             STD of tBodyAcc <br>
tBodyGravityMean:        Mean of tBodyGravity <br>
tBodyGravitySTD:         STD of tBodyGravity <br>
tBodyAccJerkMean:        Mean of tBodyAccJerk <br>
tBodyAccJerkSTD:         STD of tBodyAccJerk <br>
tBodyGyroMean:           Mean of tBodyGyro <br>
tBodyGyroSTD:            STD of tBodyGyro <br>
tBodyGyroJerkMean:       Mean of tBodyGyroJerk <br>
tBodyGyroJerkSTD:        STD of tBodyGyroJerk <br>
tBodyAccMagMean:         Mean of tBodyAccMag <br>
tBodyAccMagSTD:          STD of tBodyAccMag <br>
tGravityAccMagMean:      Mean of tGravityAccMag <br>
tGravityAccMagSTD:       STD of tGravityAccMag <br>
tBodyAccJerkMagMean:     Mean of tBodyAccJerkMag <br>
tBodyAccJerkMagSTD:      STD of tBodyAccJerkMag <br>
tBodyGyroMagMean:        Mean of tBodyGyroMag <br>
tBodyGyroMagSTD:         STD of tBodyGyroMag <br>
tBodyGyroJerkMagMean:    Mean of tBodyGyroJerkMag <br>
tBodyGyroJerkMagSTD:     STD of tBodyGyroJerkMag <br>
fBodyAccMean:            Mean of fBodyAcc <br>
fBodyAccMeanFreq:        MeanFreq of fBodyAcc <br>
fBodyAccSTD:             STD of fBodyAcc <br>
fBodyAccJerkMean:        Mean of fBodyAccJerk
fBodyAccJerkMeanFreq:    MeanFreq of fBodyAccJerk
fBodyAccJerkSTD:         STD of fBodyAccJerk
fBodyGyroMean:           Mean of fBodyGyro
fBodyGyroMeanFreq:       MeanFreq of fBodyGyro
fBodyGyroSTD:            STD of fBodyGyro
fBodyAccMagMean:         Mean of fBodyAccMag
fBodyAccMagMeanFreq:     MeanFreq of fBodyAccMag
fBodyAccMagSTD:          STD of fBodyAccMag
fBodyAccJerkMagMean:     Mean of fBodyAccJerkMag
fBodyAccJerkMagMeanFreq: MeanFreq of fBodyAccJerkMag
fBodyAccJerkMagSTD:      STD of fBodyAccJerkMag
fBodyGyroMagMean:        Mean of fBodyGyroMag
fBodyGyroMagMeanFreq:    MeanFreq of fBodyGyroMag
fBodyGyroMagSTD:         ST of fBodyGyroMag
fBodyGyroJerkMagMean:    Mean of fBodyGyroJerkMag 
fBodyGyroJerkMagMeanFreq:MeanFreq of fBodyGyroJerkMag 
fBodyGyroJerkMagSTD:     STD of fBodyGyroJerkMag 

