run_analysis <- function()
{
        features <- read.table("features.txt", col.names   = c("feature_id","feature_name"))
        activity_labels <- read.table("activity_labels.txt", col.names   = c("activity_id","activity_name"))
        
        
        load_data <- function(type)
        {
                data = read.table(paste0(type,"/X_",type,".txt"))
                colnames(data) = features$feature_name
                data =  data[ grepl("-mean|-std",colnames(data))]
                labels <- read.table(paste0(type, "/y_",type,".txt"))
                labels$activity_name = factor(labels$V1, labels=activity_labels$activity_name)
                subject <- read.table(paste0(type, "/subject_",type,".txt"))
                data$subject = subject$V1
                data$activity = labels$activity_name
                data
        }
        
        train = load_data("train")
        test = load_data("test")
        
        data = rbind(train,test)
        
        agg_cols = list(data$subject,data$activity)
        data = data[!(colnames(data) %in% c( "subject", "activity"))]
        
        data  = setNames( aggregate(data , by = agg_cols, mean), c("subject", "activity", colnames(data)))
        
        write.table(data, "tidy_data.txt", row.name=FALSE)
}
