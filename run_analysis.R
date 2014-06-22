#Download the dataset from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#Unzip the dataset and navigate into the UCI HAR Dataset folder and set it as your working directory

#Merges the training and the test sets to create one data set.
    test<-read.table("test/X_test.txt")
    train<-read.table("train/X_train.txt")
    data<-rbind(train,test)

#Appropriately labels the columns of our data set with descriptive measurement names. 
    variable.names<-read.table("features.txt")
    colnames(data)<-as.character(variable.names$V2)

#Extracts only the mean and standard deviation measurement.
    col<-c(grep("std()",colnames(data),fixed=T,value=T),
           grep("mean()",colnames(data),fixed=T,value=T))
    data<-data[col]

#Labels our data with the activity performed when the data was measured and the subject performing the activity.
    test.activity<-read.table("test/y_test.txt")
    train.activity<-read.table("train/y_train.txt")
    data.activity<-rbind(train.activity,test.activity)

    test.subject<-read.table("test/subject_test.txt")
    train.subject<-read.table("train/subject_train.txt")
    data.subject<-rbind(train.subject,test.subject)

    data<-cbind(data.subject,data.activity,data)
    colnames(data)[1]=c("subject")
    
    activity.names<-read.table("activity_labels.txt")
    data<-merge(activity.names,data)
    data$V1=NULL
    colnames(data)[1]=c("activity")

#Creates a tidy data set containing the averages of each measurement for each subject and each activity
    tidydata<-aggregate(data[,3:68],by=list(data$subject,data$activity),FUN=mean)
    colnames(tidydata)[c(1,2)]=c("subject","activity")
    
#Writes the tidy data set into a file
    write.table(tidydata,"TidyData.txt")