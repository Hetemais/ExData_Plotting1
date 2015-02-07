# Script for creating plot1 of Course Project 1 for Exploratory Data Analysis

library(dplyr)

# Read data from txt-file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings="?")

# Convert dates from factor to character, in order to filter out dates
data[,1] <- as.character(data[,1])
data[,2] <- as.character(data[,2])

# Select only data from required dates
data2<-filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# Plot histogram as PNG
png(filename = "plot1.png")

hist(data2$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
