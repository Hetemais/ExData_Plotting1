# Script for creating plot4 of Course Project 1 for Exploratory Data Analysis

library(dplyr)

# Read data from txt-file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Convert dates from factor to character, in order to filter out dates
data[,1] <- as.character(data[,1])
data[,2] <- as.character(data[,2])

# Select only data from required dates
data2<-filter(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime<-strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")
data2<-cbind(datetime,data2)

# Plot graphs in PNG device
png(filename = "plot4.png")

par(mfcol = c(2,2))

# First plot
with(data2, plot(datetime,Global_active_power, type = "l", xlab = "", 
                 ylab = "Global Active Power"))

# Second plot
with(data2, plot(datetime,Sub_metering_1, type = "l", xlab = "", 
                 ylab = "Energy sub metering"))
with(data2, lines(datetime,Sub_metering_2, col = "red"))
with(data2, lines(datetime,Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black","red","blue"), 
       legend=grep("^Sub",names(data2), value=TRUE), bty = "n")

# Third plot
with(data2, plot(datetime, Voltage, type = "l"))          

# Fourth plot
with(data2, plot(datetime, Global_reactive_power, type = "l"))  

dev.off()