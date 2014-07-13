# Read data
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),
			header=FALSE, sep=';',na.strings='?')
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
			"Sub_metering_1","Sub_metering_2","Sub_metering_3")
comb_time<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

# Create plot2.png
png("plot2.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1))

# Plot graph "Sub Metering No.1/2/3 VS Datetime"
plot(comb_time,data$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

dev.off()