##getting data needed
fulldata<-fread("household_power_consumption.txt")
data<-fulldata[Date%in%c("1/2/2007","2/2/2007"),]

##change to numeric 
DateTime<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
png("plot4.png",480,480)
par(mfrow=c(2,2))
plot(DateTime,data$Global_active_power,type="l",
     xlab=NA,ylab="Global Active Power(kilowatts)")

plot(DateTime,data$Voltage,type="l",
     xlab="datetime",ylab="Voltage")

plot(DateTime,data$Sub_metering_1,type="l",
     xlab=NA,ylab = "Engergy sub metering")
lines(DateTime,data$Sub_metering_2,type="l",col="red")
lines(DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1)

plot(DateTime,data$Global_reactive_power,type="l",
     xlab="datetime")
dev.off()