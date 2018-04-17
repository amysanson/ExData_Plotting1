setwd("/Users/amysanson/Documents/Coursera/Assignment1")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-02-02 +08" | data$Date == "2007-02-01 +08", ]

date_time <- paste(data$Date, data$Time)
date_time <- strptime(date_time, format = "%Y-%m-%d %H:%M:%S")
data <- cbind(date_time, data)

for (i in 4:10) {
    data[,i] <- as.numeric(data[,i])
}

par(mfrow = c(2,2), mar = c(5,5,0.5,0.5))

plot(data$date_time, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(data$date_time, data$Global_active_power, type = "l")

plot(data$date_time, data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data$date_time, data$Voltage, type = "l")

plot(data$date_time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_1, type = "l", col = "black")
lines(data$date_time, data$Sub_metering_2, type = "l", col = "red")
lines(data$date_time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, box.lty = c(0,0,1,1), cex = 0.8)

plot(data$date_time, data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(data$date_time, data$Global_reactive_power, type = "l")
