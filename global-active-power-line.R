library(tidyverse)
par(mfrow=c(1,1))
setwd("exploratory-data-project-1")
power_use <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".")

power_use_sub <- power_use %>%filter(Date == "1/2/2007" | Date == "2/2/2007" )

power_use_sub$time_date <- paste( power_use_sub$Time, power_use_sub$Date, sep = " ")

power_use_sub$time_date <- strptime(power_use_sub$time_date, format = "%H:%M:%S %d/%m/%Y")

power_use_sub$Global_active_power <- as.numeric(power_use_sub$Global_active_power)

png("plot2.png", height=480, width=480)
plot(x = power_use_sub$time_date, y = power_use_sub$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (killowatts)")
dev.off()
