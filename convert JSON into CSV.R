setwd("C:/Users/reema.chhatbar/Desktop/Reema")
library(taskscheduleR)

URL="http://srvmanager.tmsys.in:81/ServerManagerTmspl/dashboardtm/getDataApi"


#download JSON file from API
json_file=download.file(URL, quiet = FALSE,"finalfile.json", mode = "w" )


#Convert JSON to Dataframe
library(jsonlite)

json_data= fromJSON("finalfile.json",simplifyVector = TRUE) 
df_data=as.data.frame(json_data)
typeof(df_data)
View(df_data)

# Renaming Column names

colClean <- function(x){ colnames(x) <- sub("server_data.", "", colnames(x)); x }
df_data=colClean(df_data) #overwriting the dataframe
View(df_data)

# Dataframe to CSV

write.csv(df_data,file="serverdata.csv")
str(df_data)

# df_data=data.frame(id= as.numeric())
# df_data
summary(df_data)

#Character to date and time
library(chron)
as.Date(df_data$last_update_date_time)
as.POSIXct(df_data$last_update_date_time)
as.chron(df_data$last_update_date_time)

new_last_update_date_time= as.POSIXlt(df_data$last_update_date_time)

# Replacing h,m,s to column
remaining_time_new=gsub(" ", ":", df_data$remaining_time)
new_remaining_time=gsub("[[:alpha:](/\\w/)]", "", remaining_time_new)

new_remaining_time
#charatcter to time
new_remaining_time= chron(times=df_data$remaining_time)



#character to number
new_id=as.numeric(df_data$id)

# New data frame

new_df=data.frame(new_id,new_last_update_date_time)

#new converted CSV
write.csv(new_df,file = "newserverdata.csv")
