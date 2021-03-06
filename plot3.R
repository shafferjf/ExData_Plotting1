##The command below reads in power data only for Feb 1 and 2 2007. I determined the number of rows to skip and read (nrows) from assessing the entire data file and searhing for "2007-02-01" and "2007-02-02" using grep.

power <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), skip = 66637, nrows = 2880)

## These commands convert the date and time data to POSIX types.

x <- paste(power$Date,power$Time)
y <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

plot(y, power$Sub_metering_1, type ="n", ylab = "Energy sub metering", xlab = "")
lines(y, power$Sub_metering_1, col="black")
lines(y, power$Sub_metering_2, col="red")
lines(y, power$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, cex=0.6)

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()