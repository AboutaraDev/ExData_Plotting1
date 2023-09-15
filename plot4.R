
rm(list = ls())

# Load dataset

data <- read.table("household_power_consumption.txt", header=TRUE,
                   sep=";", na.strings = "?")

# convert the date variable to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset the dataset to data when Date between 2007-02-01 & 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# add variable datatime that contaons date & time both
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data$datetime <- as.POSIXct(data$datetime)

# plotting plot 4
par(mfrow = c(2, 2))

plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")

plot(data$Voltage ~ data$datetime, type = "l", xlab="datetime",ylab="Voltage")

plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(data$Sub_metering_2 ~ datetime, col = "Red")
lines(data$Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(data$Global_reactive_power ~ data$datetime, type = "l", xlab="datetime", ylab="Global_reactive_power")

# Save to plot4.png file

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
