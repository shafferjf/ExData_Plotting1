##The command below reads in power data only for Feb 1 and 2 2007. I determined the number of rows to skip and read (nrows) from assessing the entire data file and searhing for "2007-02-01" and "2007-02-02" using grep.

power <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), skip = 66637, nrows = 2880)

## These commands convert the date and time data to POSIX types.

x <- paste(power$Date,power$Time)
y <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

plot(y,power$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "", type = "n")
lines(y,power$Global_active_power)

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
