library(magrittr)
library(dplyr)
#new_df=airquality;
#new_df$Ozone=ifelse(is.na(new_df$Ozone),median(new_df$Ozone,na.rm=TRUE),new_df$Ozone);
#print(new_df$Ozone);
#print(airquality$Ozone);
#new_df$Solar.R=ifelse(is.na(new_df$Solar.R),median(new_df$Solar.R,na.rm=TRUE),new_df$Solar.R);
#print(new_df$Solar.R);
#print(airquality$Solar.R);
#head(new_df);


# creation of example data
data = data.frame(
  x1=c(1:4, 99999, 1, NA, 1, 1, NA),
  x1=c(1:5, 1, "NA", 1, 1, "NA"),
  x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
  x4 = "",
  x5 = NA
);

colnames(data);

#changing the name of the column
colnames(data)=paste0("col",1:ncol(data));

# removing empty rows
data <- data[rowSums(is.na(data)) != ncol(data), ]
# removing empty columns
data <- data[,colSums(is.na(data)) != nrow(data) ]
# removing rows with one or more than one 
data <- na.omit(data);
#removing duplicates
data=unique(data);

#modifying the class of the column
print(sapply(data,class));#here we print the class of each column
data=type.convert(data,as.is=TRUE);

#Detect and remove outliers
data$col1[data$col1 %in% boxplot.stats(data$col1)$out];#detect
data=data[!data$col1 %in% boxplot.stats(data$col1)$out,];#remove rows with outliers

#removing the spaces in the character string
data$col3=gsub(" ","",data$col3);

#combine categories
data$col3=gsub("c","a",data$col3);

#Assignment 5
#ques-1
url <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/daily-show-guests/daily_show_guests.csv";
data2 <- read.csv(url);
head(data2,10);
#ques2
data2=data2 %>%
  rename(year=YEAR,job=GoogleKnowlege_Occupation,date=Show,category=Group,guest_name=Raw_Guest_List);
data2$guest_name
colnames(data2)
#ques3
report=select(data2,year,date,job);

#ques4
print(select(data2,job,date,category,guest_name))

#ques5
filter_data=filter(data2,category=="Acting",guest_name == "ABC")

#ques6
data2=arrange(data2,date)

#ques7
data2=mutate(data2,Experience="Some Value");
