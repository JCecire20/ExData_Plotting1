#Set working directory
setwd("~/Documents/GitHub/ExData_Plotting1")
#This part is the same for all 4 plots
dataFile <- "household_power_consumption.txt"
dataHPC <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#IMPORTANT NOTE: dates in this file are formated as dd/mm/yy, so 1/2/2007 = February 1st, 2007
subSetData <- dataHPC[dataHPC$Date %in% c("1/2/2007","2/2/2007") ,] 

## Plot 3: Energy Sub Metering (Colored) 
globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l" 
     , xlab=""
     , ylab="Energy sub metering"
     , cex.lab=.65
     , cex.axis=.75)
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1), lwd=c(1,1)
       , cex=.65)

dev.off()
