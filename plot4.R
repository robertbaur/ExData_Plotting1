#Exploratory data analysis, Project1, Plot1 script
data <- read.csv('household_power_consumption.txt', sep=';', quote = '', dec = '.', na.strings = '?' )
sub_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
png(file='plot4.png', units = 'px', width = 480, height = 480, bg = 'transparent')
lct <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
sub_data$DateTime <- strptime(paste(sub_data$Date, sub_data$Time), '%d/%m/%Y %H:%M:%S')

par(mfcol=c(2,2))

plot(sub_data$DateTime, sub_data$Global_active_power, 'l', ylab = 'Global Active Power', xlab = '')

plot(sub_data$DateTime, sub_data$Sub_metering_1, type = 'n', ylab = 'Energy sub metering', xlab = '')
lines(sub_data$DateTime, sub_data$Sub_metering_1, col= 'black')
lines(sub_data$DateTime, sub_data$Sub_metering_2, col= 'red')
lines(sub_data$DateTime, sub_data$Sub_metering_3, col= 'blue')
legend('topright', lwd = 1, box.lwd = 0, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'))

plot(sub_data$DateTime, sub_data$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')

plot(sub_data$DateTime, sub_data$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime')

Sys.setlocale("LC_TIME", lct)
dev.off()