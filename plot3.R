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

png(filename="plot3.png", width=480, height=480)

par(bg=NA)

plot(data$TimeStamp, 
     data$Sub_metering_1,  
     type="l", 
     xlab="", 
     ylab="Energy sub metering")

lines(data$TimeStamp, 
     data$Sub_metering_2,  
     type="l",
     col="red")

lines(data$TimeStamp, 
     data$Sub_metering_3,  
     type="l",
     col="blue")

legend("topright", 
       lwd=c(2.5,2.5, 2.5), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()