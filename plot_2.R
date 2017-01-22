#EDA: Week 1 Programming Assignment
#Create Plot 2
library(lubridate)
setwd('C:/Users/Mitch/Desktop/JHU/EDA/Week 1')
consumption <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?')
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- consumption[consumption$Date == '2007-02-01' | consumption$Date == '2007-02-02',]
consumption$datetime <- paste0(consumption$Date,'-',consumption$Time)
consumption$Time <- strptime(consumption$datetime,"%Y-%m-%d-%H:%M:%S")
png("plot_2.png")
plot(consumption$Time, consumption$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
