library(data.table)
library(dplyr)

##getting data needed
fulldata<-fread("household_power_consumption.txt")
data<-fulldata[Date%in%c("1/2/2007","2/2/2007"),]

##set column to correct class
DateTime<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")

data$Global_active_power<-as.numeric(data$Global_active_power) 



##plot in png format

png("plot2.png",480,480)
plot(DateTime,data$Global_active_power,type="S",xlab=NA,ylab="Global Active Power(kilowatts)")

dev.off()
