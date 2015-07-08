require(dplyr)
require(data.table)

data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   na.strings="?") %>%
        filter(grepl("(^1/2/2007$|^2/2/2007$)", Date)) %>%
        mutate(TimeStamp=as.POSIXct(
                strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"))) %>%
        select(-Date, -Time) %>%
        arrange(TimeStamp) 

png(filename="plot1.png", width=480, height=480)

par(bg=NA)

hist(data$Global_active_power,
     xlab="Global Active Power (Kilowatts)",
     main="Global Active Power",
     col="red")

dev.off()