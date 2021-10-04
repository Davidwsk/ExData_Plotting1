#Load Data
loaddata <- read.csv("household_power_consumption.txt", sep=";")
loaddata$DateTime <- strptime(paste(loaddata$Date, loaddata$Time), "%d/%m/%Y %H:%M:%S")
loaddata$DateOnly <- as.Date(loaddata$DateTime)

##Subset Data
usedata <- subset(loaddata, loaddata$DateOnly >= "2007-02-01" & loaddata$DateOnly <= "2007-02-02")

## Convert to as.numeric
usedata$Global_active_power <- as.numeric(usedata$Global_active_power)

## Plot
png("plot1.png")

hist(usedata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
