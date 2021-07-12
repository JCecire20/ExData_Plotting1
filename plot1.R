#Set working directory
setwd("~/Documents/GitHub/ExData_Plotting1")
#This part is the same for all 4 plots
dataFile <- "household_power_consumption.txt"
dataHPC <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#IMPORTANT NOTE: dates in this file are formated as dd/mm/yy, so 1/2/2007 = February 1st, 2007
subSetData <- dataHPC[dataHPC$Date %in% c("1/2/2007","2/2/2007") ,] 

## Plot 1: Global Active Power Histogram
globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power"
     , ylab="Frequency"
     , xlab="Global Active Power (kilowatts)"
     , cex.main=.75
     , cex.lab=.75
     , cex.axis=.75)

dev.off()