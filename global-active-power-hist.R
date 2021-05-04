library(ggplot2)
library(tidyverse)

setwd("exploratory-data-project-1")
power_use <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".")

power_use_sub <- power_use %>%filter(Date == "1/2/2007" | Date == "2/2/2007" )

power_use_sub$Global_active_power <- as.numeric(power_use_sub$Global_active_power)


png("plot1.png", height=480, width=480)
hist(power_use_sub$Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (Kilowatts)", breaks=18)
dev.off()
