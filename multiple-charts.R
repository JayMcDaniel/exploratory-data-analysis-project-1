# 4 figures arranged in 2 rows and 2 columns
attach(mtcars)


setwd("exploratory-data-project-1")

#load data

power_use <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".")

#subset data
power_use_sub <- power_use %>%filter(Date == "1/2/2007" | Date == "2/2/2007" )

#set up time var
power_use_sub$time_date <- paste( power_use_sub$Time, power_use_sub$Date, sep = " ")
power_use_sub$time_date <- strptime(power_use_sub$time_date, format = "%H:%M:%S %d/%m/%Y")

#make vars numeric
power_use_sub$Global_active_power <- as.numeric(power_use_sub$Global_active_power)
power_use_sub$Voltage <- as.numeric(power_use_sub$Voltage)
power_use_sub$Sub_metering_1 <- as.numeric(power_use_sub$Sub_metering_1)
power_use_sub$Sub_metering_2 <- as.numeric(power_use_sub$Sub_metering_2)
power_use_sub$Sub_metering_3 <- as.numeric(power_use_sub$Sub_metering_3)


#2 by 2 charts
par(mfrow=c(2,2))
par(mar = c(2, 4, 2, 1))


#plot first chart
plot(x = power_use_sub$time_date, y = power_use_sub$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (killowatts)")

#plot second chart
plot(x = power_use_sub$time_date, y = power_use_sub$Voltage, type = "l", xlab="datetime", ylab = "Voltage")

#plot third chart

#plot first line
plot(x = power_use_sub$time_date, y = power_use_sub$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering", ylim=c(0,30))

#add more lines
lines(power_use_sub$time_date, power_use_sub$Sub_metering_2, col="red")
lines(power_use_sub$time_date, power_use_sub$Sub_metering_3, col="blue")

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#add 4th chart
plot(x = power_use_sub$time_date, y = power_use_sub$Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_reactive_power")

dev.copy(png,'plot4.png', height=480, width=480)
dev.off()
