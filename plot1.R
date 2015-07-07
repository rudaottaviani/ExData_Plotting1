#source("loadData.R")

png(filename="plot1.png", width=480, height=480)

hist(data$Global_active_power,
     xlab="Global Active Power (Kilowatts)",
     main="Global Active Power",
     col="red")

dev.off()