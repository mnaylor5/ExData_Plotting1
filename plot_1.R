#EDA: Week 1 Programming Assignment
#Create Plot 1
setwd('C:/Users/Mitch/Desktop/JHU/EDA/Week 1')
consumption <- read.table('household_power_consumption.txt', header = T, sep = ';', 
                          na.strings = '?')
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- consumption[consumption$Date == '2007-02-01' | consumption$Date == '2007-02-02',]

hist(consumption$Global_active_power, xlab = 'Global Active Power', main = 'Global Active Power', col = 'red')
png("plot1.png")
