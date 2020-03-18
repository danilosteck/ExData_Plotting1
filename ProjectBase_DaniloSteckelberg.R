#-------------------------
# SCRIPT TO RUN EXPLORATORY DATA ANALYSIS PROJECT
# Version: 1.0
# Created on: MARCH 17th 2020.
# Versiona date: MARCH 17th 2020.
# Created by: Danilo Steckelberg.
#-------------------------
# Objective: Week 1 peer-review course evaluation.


# Set the directory in which the file is stored in my computer
setwd("/home/danilo/Documents/Projects/Learning/R/Data Science/Exploratory Data Analysis/Project")

#Create a data frame from the Database TXT data
EnergyDatabase <- read.table("household_power_consumption.txt",sep = ";", header = TRUE,
                             na.strings=c("NA", "-", "?"), stringsAsFactors = TRUE)

#Convert date string to class date
EnergyDatabase$Date <- as.Date(EnergyDatabase$Date, "%d/%m/%Y")

#Subset the data to consider only the desired range
ReducedEnergyData <- subset(x = EnergyDatabase, Date >= "2007-02-01")
ReducedEnergyData <- subset(x = ReducedEnergyData, Date <= "2007-02-02")

#Create and saving the plots
png("Plot1.png", width = 480, height = 480)
hist(ReducedEnergyData$Global_active_power, col = "red"
     , xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()



DateAxis <- as.POSIXct(paste(ReducedEnergyData$Date," ", ReducedEnergyData$Time),
                       format = "%Y-%m-%d %H:%M:%OS")

png("Plot2.png", width = 480, height = 480)
plot(DateAxis, ReducedEnergyData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

png("Plot3.png", width = 480, height = 480)
plot(DateAxis, ReducedEnergyData$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(DateAxis, ReducedEnergyData$Sub_metering_2, col = "red")
lines(DateAxis, ReducedEnergyData$Sub_metering_3, col = "darkviolet")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","darkviolet"), lty = 1:2)
dev.off()


png("Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(DateAxis, ReducedEnergyData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(DateAxis, ReducedEnergyData$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(DateAxis, ReducedEnergyData$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(DateAxis, ReducedEnergyData$Sub_metering_2, col = "red")
lines(DateAxis, ReducedEnergyData$Sub_metering_3, col = "darkviolet")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","darkviolet"), lty = 1, cex = 0.7, box.col = "white")

plot(DateAxis, ReducedEnergyData$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "global_reactive_power")
dev.off()