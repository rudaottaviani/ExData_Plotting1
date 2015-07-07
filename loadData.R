require(dplyr)
require(data.table)

data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   na.strings="?") %>%
        filter(grepl("(^1/2/2007$|^2/2/2007$)", Date)) %>%
        mutate(TimeStamp=as.POSIXct(
                strptime(paste(Date, " ", Time), "%m/%d/%Y %H:%M:%S"))) %>%
        select(-Date, -Time) %>%
        arrange(TimeStamp) 
