#-------------------------
# SCRIPT TO RUN EXPLORATORY DATA ANALYSIS PROJECT (PLOT 2)
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
ReducedEnergyData <- subset(x = EnergyDatabase, Date >= "2007-02-01" & Date <= "2007-02-02")


#Create and saving the plots

DateAxis <- as.POSIXct(paste(ReducedEnergyData$Date," ", ReducedEnergyData$Time),
                       format = "%Y-%m-%d %H:%M:%OS")

png("Plot2.png", width = 480, height = 480)
plot(DateAxis, ReducedEnergyData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
