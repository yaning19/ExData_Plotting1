library(data.table)
library(dplyr)

##getting data needed
fulldata<-fread("household_power_consumption.txt")
data<-fulldata[Date%in%c("1/2/2017","2/2/2007"),]

##set column needed as numeric
data$Global_active_power<-as.numeric(data$Global_active_power)

##plot in png format
png("plot1.png", 480, 480)
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col = "red")


dev.off()