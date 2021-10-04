#Load Data
loaddata <- read.csv("household_power_consumption.txt", sep=";")
loaddata$DateTime <- strptime(paste(loaddata$Date, loaddata$Time), "%d/%m/%Y %H:%M:%S")
loaddata$DateOnly <- as.Date(loaddata$DateTime)

##Subset Data
usedata <- subset(loaddata, loaddata$DateOnly >= "2007-02-01" & loaddata$DateOnly <= "2007-02-02")

## Convert to as.numeric
usedata$Global_active_power <- as.numeric(usedata$Global_active_power)

## Plot
png("plot2.png")

plot(usedata$DateTime, usedata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(usedata$DateTime, usedata$Global_active_power)

dev.off()
