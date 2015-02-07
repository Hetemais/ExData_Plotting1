# Script for creating plot2 of Course Project 1 for Exploratory Data Analysis

library(dplyr)

# Read data from txt-file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings="?")

# Convert dates from factor to character, in order to filter out dates
data[,1] <- as.character(data[,1])
data[,2] <- as.character(data[,2])

# Select only data from required dates
data2<-filter(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime<-strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")
data2<-cbind(datetime,data2)

# Plot graph as PNG
png(filename = "plot2.png")

with(data2, plot(datetime,Global_active_power, type = "l", xlab = "", 
                 ylab = "Global Active Power (kilowatts)"))

dev.off()