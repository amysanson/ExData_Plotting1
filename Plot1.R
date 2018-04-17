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

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()