library(dplyr)
#combining columns from two csv files
nsli_y <- read.csv("H:/data viz personal/DATA/nsli-y_2016.csv", sep=",",head=TRUE)  
nsli_y_lang <- read.csv("H:/data viz personal/DATA/nsli-y_2016_language.csv", sep=",",head=TRUE)
df_nsli_y <-as.data.frame(nsli_y)
df_nsli_y_lang <- as.data.frame(nsli_y_lang)
head(df_nsli_y)
head(df_nsli_y_lang)
df <- merge(nsli_y, nsli_y_lang, by= "ais_id")
head(df)
write.csv(df, file = "H:/data viz personal/DATA/nsli-y_2016_combined.csv")
#combining columns within one csv file
nsli_y_2 <- read.csv("H:/data viz personal/DATA/nsli-y_2016-2.csv", sep=",",head=TRUE) 
df_nsli_y_2 <- as.data.frame(nsli_y_2)
head(df_nsli_y_2)
df_nsli_y_2$eca <- paste(df_nsli_y_2$eca1,df_nsli_y_2$eca2,df_nsli_y_2$eca3)
df_nsli_y_2$international_experience <- paste(df_nsli_y_2$international_experience1,df_nsli_y_2$international_experience2,df_nsli_y_2$international_experience3)
df_nsli_y_2$race <- paste(df_nsli_y_2$race1,df_nsli_y_2$race2,df_nsli_y_2$race3)
df_nsli_y_2$income <- paste(df_nsli_y_2$income1,df_nsli_y_2$income2,df_nsli_y_2$income3)
df_nsli_y_2$schooltype <- paste(df_nsli_y_2$schooltype1,df_nsli_y_2$schooltype2,df_nsli_y_2$schooltype3)
head(df_nsli_y_2)
#drop old columns
df_new <- df_nsli_y_2[-c(3:17)]
head(df_new)
#combine with "df"
final_df <- merge(df, df_new, by.x = c("ais_id"), by.y=c("AIS.Student.Number"))
head(final_df)
write.csv(final_df, file = "H:/data viz personal/DATA/nsli-y_2016_combined_2.csv")
