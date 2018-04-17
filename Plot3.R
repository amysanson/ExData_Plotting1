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

plot(data$date_time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_1, type = "l", col = "black")
lines(data$date_time, data$Sub_metering_2, type = "l", col = "red")
lines(data$date_time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
