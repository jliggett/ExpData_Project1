setwd("/home/jason/Code/ExData_Plotting1")

library(lubridate)
library(sqldf)

# read in electric power consumption data
edp <- read.csv.sql("../household_power_consumption.txt", sep=";", sql = "select * from file where Date in ('1/2/2007','2/2/2007')")

# convert Date Time columns to one column dateTime
edp$dateTime <- dmy_hms(paste(edp$Date,edp$Time))


# plot the data
plot.new()
with(edp, plot(dateTime,Sub_metering_1, type="l",main="",xlab="",ylab="Energy sub metering",col="black"))
with(edp, lines(dateTime,Sub_metering_2, type="l",col="red"))
with(edp, lines(dateTime,Sub_metering_3, type="l",col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)

dev.copy(png,file="plot3.png")
dev.off()
