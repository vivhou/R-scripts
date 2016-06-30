cls_data.15 <- read.csv("H:/data viz personal/R code/data/cls_language_count_2015.csv", sep=",")
cls_data_14 <- read.csv("H:/data viz personal/R code/data/cls_language_count_2014.csv", sep=",")
cls_data_13 <- read.csv("H:/data viz personal/R code/data/cls_language_count_2013.csv", sep=",")
cls.df.15 <- data.frame(cls_data.15)
cls.df.14 <- data.frame(cls_data_14)
cls.df.13 <- data.frame(cls_data_13)
cls.df.13
names(cls.df.15) <- c("language", "count")
names(cls.df.14) <- c("language", "count")
names(cls.df.13) <- c("language", "count")

library(plyr)
sum.cls.15 <- ddply(cls.df.15, "language", numcolwise(sum))
sum.cls.14 <-ddply(cls.df.14, "language", numcolwise(sum))
sum.cls.13 <-ddply(cls.df.13, "language", numcolwise(sum))

new_df_15 <- sum.cls.15[with(sum.cls.15, order(language)), ]
new_df_14 <- sum.cls.14[with(sum.cls.14, order(language)), ]
new_df_13 <- sum.cls.13[with(sum.cls.13, order(language)), ]

write.csv(new_df_15, file="H:/data viz personal/R code/data/new_cls_language_stats_15.csv", row.names=FALSE)
write.csv(new_df_14, file="H:/data viz personal/R code/data/new_cls_language_stats_14.csv", row.names=FALSE)
write.csv(new_df_13, file="H:/data viz personal/R code/data/new_cls_language_stats_13.csv", row.names=FALSE)
