

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

# plotting plot 2
plot(data$Global_active_power ~ data$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
# Save plot2
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

