#EDA: Week 1 Programming Assignment
#Create Plot 4
setwd('C:/Users/Mitch/Desktop/JHU/EDA/Week 1')
library(reshape2)
consumption <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?')
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- consumption[consumption$Date == '2007-02-01' | consumption$Date == '2007-02-02',]
consumption$datetime <- paste0(consumption$Date,'-',consumption$Time)
consumption$Time <- strptime(consumption$datetime,"%Y-%m-%d-%H:%M:%S")

png("plot_4.png")

par(mfrow = c(2,2))
plot(consumption$Time, consumption$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
plot(consumption$Time, consumption$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
plot(consumption$Time, y = consumption$Sub_metering_1, col = 'black', type = 'l', ylab = 'Energy sub metering', 
     xlab = '') 
  lines(x = consumption$Time, y = consumption$Sub_metering_2, col = 'red')
  lines(x = consumption$Time, y = consumption$Sub_metering_3, col = 'blue')
  legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lwd = 1,
         bty = 'n')
plot(consumption$Time, consumption$Global_reactive_power, type = 'h', xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()
