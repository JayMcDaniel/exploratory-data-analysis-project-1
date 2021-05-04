library(ggplot2)
library(tidyverse)

setwd("exploratory-data-project-1")

#read table
power_use <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".")

#filter
power_use_sub <- power_use %>%filter(Date == "1/2/2007" | Date == "2/2/2007" )

#make date/time
power_use_sub$time_date <- paste( power_use_sub$Time, power_use_sub$Date, sep = " ")
power_use_sub$time_date <- strptime(power_use_sub$time_date, format = "%H:%M:%S %d/%m/%Y")

#convert to numbers
power_use_sub$Sub_metering_1 <- as.numeric(power_use_sub$Sub_metering_1)
power_use_sub$Sub_metering_2 <- as.numeric(power_use_sub$Sub_metering_2)
power_use_sub$Sub_metering_3 <- as.numeric(power_use_sub$Sub_metering_3)

glimpse(power_use_sub)

png("plot3.png", height=480, width=480)

#plot first line
plot(x = power_use_sub$time_date, y = power_use_sub$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering", ylim=c(0,30))

#add more lines
lines(power_use_sub$time_date, power_use_sub$Sub_metering_2, col="red")
lines(power_use_sub$time_date, power_use_sub$Sub_metering_3, col="blue")

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
