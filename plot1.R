# Read data
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),
			header=FALSE, sep=';',na.strings='?')
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
			"Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Create plot2.png
png("plot1.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1))

# Plot graph "Sub Metering No.1/2/3 VS Datetime"
hist(data$Global_active_power, xlab = 'Global Active Power (kilowatts)', col = 'red', main = 'Global Active Power')

dev.off()