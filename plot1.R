

rm(list=ls())
# Load Dataset
data <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", na.strings = "?")

# convert the date variable to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset the dataset to data when Date between 2007-02-01 & 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# add variable datatime that contaons date & time both
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# potting plot 1
par(mfrow=c(1,1))
hist(data$Global_active_power, col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Save plot to png file plot1.png with width & height equal 480px
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
