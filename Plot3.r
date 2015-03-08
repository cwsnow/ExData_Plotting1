data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = T )
data$DateTime <- paste(data$Date, data$Time, sep = " ")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S") #converts Date from factor to class Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
startdate <- as.Date("1/2/2007", format = "%d/%m/%Y")
enddate <- as.Date("2/2/2007", format = "%d/%m/%Y")
data <- subset(data, Date >= startdate & Date <= enddate)

png(file = "Plot3.png")
plot(data$DateTime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering" , xlab = "")
points(data$DateTime, data$Sub_metering_1, type = "l")
points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1 )

dev.off()