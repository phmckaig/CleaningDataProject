
subject.train   <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject.test    <- read.table("./UCI HAR Dataset/test/subject_test.txt")

activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses="character")
features        <- read.table("./UCI HAR Dataset/features.txt", colClasses="character")

x.train         <- read.table("./UCI HAR Dataset/train/X_train.txt")
x.test          <- read.table("./UCI HAR Dataset/test/X_test.txt")
y.train         <- read.table("./UCI HAR Dataset/train/y_train.txt")
y.test          <- read.table("./UCI HAR Dataset/test/y_test.txt")


x.merged <- rbind(x.train, x.test)
sanitizedNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})

colnames(x.merged) <- sanitizedNames


meanstd <- grep("mean()|std()", colnames(x.merged))
x.meanstd <- x.merged[,c(meanstd)]


y.merged <- rbind(y.train, y.test)
colnames(y.merged) <- c('activityId')
meanstd.merged <- cbind(y.merged, x.meanstd)


activity <- c()
for(i in 1:length(meanstd.merged[,1])){
  activity<-c(activity,activity.labels[meanstd.merged[i,1],2])
}
meanstd.merged <- cbind(meanstd.merged, activity)


subject.merged <- rbind(subject.train, subject.test)
colnames(subject.merged) <- c('subjectId')
consolidatedSet <- cbind(subject.merged, meanstd.merged)


tidy_data <- aggregate(consolidatedSet[,3] ~ subjectId+activity, data=consolidatedSet, FUN="mean")
for(i in 4:(ncol(consolidatedSet)-1)){
  tidy_data[,i] <- aggregate( consolidatedSet[,i] ~ subjectId+activity, data=consolidatedSet, FUN="mean")[,3]
}
colnames(tidy_data)[3:ncol(tidy_data)] <- colnames(x.meanstd)


write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)