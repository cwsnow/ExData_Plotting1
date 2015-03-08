data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = T )
data$DateTime <- paste(data$Date, data$Time, sep = " ")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S") #converts Date from factor to class Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
startdate <- as.Date("1/2/2007", format = "%d/%m/%Y")
enddate <- as.Date("2/2/2007", format = "%d/%m/%Y")
data <- subset(data, Date >= startdate & Date <= enddate)

png(file = "Plot2.png")
plot2 <- plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off()