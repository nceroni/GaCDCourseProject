

#Read features names and convert into a vector

features <- read.table("UCI HAR Dataset/features.txt")
features <- features[,2]

#Read test data and add activity id and subject
X_Test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=features)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
X_Test$Activity <- y_test[,1]
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_Test$Subject <- subject_test[,1]

#Read train data and add activity id and subject
X_Train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names=features)
y_Train <- read.table("UCI HAR Dataset/train/y_train.txt")
X_Train$Activity <- y_Train[,1]
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_Train$Subject <- subject_train[,1]

#merge two dataset and select only the columsn with the mean and te std, the activity and the subject

Data <- rbind(X_Test,X_Train)
measures <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543,562,563)
Data <- Data[,measures]

# Read the activity labels and join to the dataset

act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(act_labels) <-c("Activity","Activity_Name")
Data <- merge(Data,act_labels)


# Create the Tidy dataset (using reshape2 library)

ids <- names(Data[,c(1,68,69)])
meas <- names(Data[,-c(1,68,69)])
tidy <- melt(Data,id=ids,measure.vars=meas,value.name="values")
aggdata <-aggregate(tidy, by=list(tidy$Activity,tidy$Activity_Name,tidy$Subject,tidy$variable),FUN=mean, na.rm=TRUE)
tidy <- aggdata[,c(1,2,3,4,9)]
names(tidy) <- c("Activity.id","Activity.Name","Subject","Feature","Feature.Mean")
write.table(tidy,file="tidy_data.txt",row.name=FALSE)
