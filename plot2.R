#Exploratory data analysis, Project1, Plot1 script
data <- read.csv('household_power_consumption.txt', sep=';', quote = '', dec = '.', na.strings = '?' )
sub_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
png(file='plot2.png', units = 'px', width = 480, height = 480, bg = 'transparent')
lct <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
sub_data$DateTime <- strptime(paste(sub_data$Date, sub_data$Time), '%d/%m/%Y %H:%M:%S')
plot(sub_data$DateTime, sub_data$Global_active_power, 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
Sys.setlocale("LC_TIME", lct)
dev.off()