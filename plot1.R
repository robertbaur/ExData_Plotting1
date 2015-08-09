#Exploratory data analysis, Project1, Plot1 script
data <- read.csv('household_power_consumption.txt', sep=';', quote = '', dec = '.', na.strings = '?' )
sub_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
png(file='plot1.png', units = 'px', width = 480, height = 480, bg = 'transparent')
hist(sub_data$Global_active_power, col="red", xlab = 'Global Active Power (kilowatts)', main = "Global Active Power")
dev.off()
