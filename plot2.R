#Set working directory
setwd("~/Documents/GitHub/ExData_Plotting1")
#This part is the same for all 4 plots
dataFile <- "household_power_consumption.txt"
dataHPC <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#IMPORTANT NOTE: dates in this file are formated as dd/mm/yy, so 1/2/2007 = February 1st, 2007
subSetData <- dataHPC[dataHPC$Date %in% c("1/2/2007","2/2/2007") ,] 

## PLot 2: Global Active Power
globalActivePower <- as.numeric(subSetData$Global_active_power)
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(dateTime, globalActivePower, type="l"
     , xlab=""
     , ylab="Global Active Power (kilowatts)"
     , cex.lab=.65
     , cex.axis=.75)

dev.off()