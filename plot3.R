
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

# plotting plot 3
plot(data$Sub_metering_1 ~ data$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot3
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()