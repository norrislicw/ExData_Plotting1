# Read data
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),
			header=FALSE, sep=';',na.strings='?')
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
			"Sub_metering_1","Sub_metering_2","Sub_metering_3")
comb_time<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

# Create plot4.png
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

# Plot graph "Global Active Power VS Datetime"
plot(comb_time,data$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

# Plot graph "Global Voltage Power VS Datetime"
plot(comb_time,data$Voltage, type='l', xlab='datetime', ylab='Voltage')

# Plot graph "Sub Metering No.1/2/3 VS Datetime"
plot(comb_time,data$Sub_metering_1, type='l',xlab='',ylab='Energy sub metering')
lines (x=comb_time, y=data$Sub_metering_2, col ="red")
lines (x=comb_time, y=data$Sub_metering_3, col ="blue")
legend("topright",lty = 1, bty="n", col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot graph "Global Reactive Power VS Datetime"
plot(comb_time,data$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()