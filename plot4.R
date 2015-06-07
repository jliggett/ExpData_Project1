setwd("/home/jason/Code/ExData_Plotting1")

library(lubridate)
library(sqldf)

# read in electric power consumption data located in parent folder
edp <- read.csv.sql("../household_power_consumption.txt", sep=";", sql = "select * from file where Date in ('1/2/2007','2/2/2007')")

# convert Date Time columns to one column dateTime
edp$dateTime <- dmy_hms(paste(edp$Date,edp$Time))

# plot the data
attach(edp)
par(mfrow=c(2,2))
plot(dateTime,Global_active_power, type="l",main="",xlab="",ylab="Global Active Power")
plot(dateTime,Voltage, type="l",main="",xlab="datetime",ylab="Voltage")
plot(dateTime,Sub_metering_1, type="l",main="",xlab="",ylab="Energy sub metering",col="black")
lines(dateTime,Sub_metering_2, type="l",col="red")
lines(dateTime,Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1, bty="n")
plot(dateTime,Global_reactive_power, type="l")

dev.copy(png,file="plot4.png")
dev.off()
