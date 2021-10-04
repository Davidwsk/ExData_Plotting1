#Load Data
loaddata <- read.csv("household_power_consumption.txt", sep=";")
loaddata$DateTime <- strptime(paste(loaddata$Date, loaddata$Time), "%d/%m/%Y %H:%M:%S")
loaddata$DateOnly <- as.Date(loaddata$DateTime)

##Subset Data
usedata <- subset(loaddata, loaddata$DateOnly >= "2007-02-01" & loaddata$DateOnly <= "2007-02-02")

## Convert to as.numeric
usedata$Global_active_power <- as.numeric(usedata$Global_active_power)
usedata$Sub_metering_1 <- as.numeric(usedata$Sub_metering_1)
usedata$Sub_metering_2 <- as.numeric(usedata$Sub_metering_2)
usedata$Sub_metering_3 <- as.numeric(usedata$Sub_metering_3)
usedata$Voltage <- as.numeric(usedata$Voltage)
usedata$Global_reactive_power <- as.numeric(usedata$Global_reactive_power)

## Plot
png("plot4.png")

par(mfcol=c(2,2))

### Plot 1,1
plot(usedata$DateTime, usedata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(usedata$DateTime, usedata$Global_active_power)

### Plot 2,1
plot(usedata$DateTime, usedata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(usedata$DateTime, usedata$Sub_metering_1, col="black")
lines(usedata$DateTime, usedata$Sub_metering_2, col="red")
lines(usedata$DateTime, usedata$Sub_metering_3, col="blue")
legend("topright", lty = c(1,1,1),  col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

### Plot 1,2
plot(usedata$DateTime, usedata$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(usedata$DateTime, usedata$Voltage, col="black")

### Plot 2,2
plot(usedata$DateTime, usedata$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(usedata$DateTime, usedata$Global_reactive_power, col="black")

dev.off()

