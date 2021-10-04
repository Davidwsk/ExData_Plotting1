#Load Data
loaddata <- read.csv("household_power_consumption.txt", sep=";")
loaddata$DateTime <- strptime(paste(loaddata$Date, loaddata$Time), "%d/%m/%Y %H:%M:%S")
loaddata$DateOnly <- as.Date(loaddata$DateTime)

##Subset Data
usedata <- subset(loaddata, loaddata$DateOnly >= "2007-02-01" & loaddata$DateOnly <= "2007-02-02")

## Convert to as.numeric
usedata$Sub_metering_1 <- as.numeric(usedata$Sub_metering_1)
usedata$Sub_metering_2 <- as.numeric(usedata$Sub_metering_2)
usedata$Sub_metering_3 <- as.numeric(usedata$Sub_metering_3)

## Plot
png("plot3.png")

plot(usedata$DateTime, usedata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(usedata$DateTime, usedata$Sub_metering_1, col="black")
lines(usedata$DateTime, usedata$Sub_metering_2, col="red")
lines(usedata$DateTime, usedata$Sub_metering_3, col="blue")
legend("topright", lty = c(1,1,1),  col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
