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

plot(data$date_time, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$date_time, data$Global_active_power, type = "l")