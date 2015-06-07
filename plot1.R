setwd("/home/jason/Code/ExData_Plotting1")

library(lubridate)
library(sqldf)
# read in electric power consumption data
edp <- read.csv.sql("../household_power_consumption.txt", sep=";", sql = "select * from file where Date in ('1/2/2007','2/2/2007')")

# convert Date Time columns to one column dateTime
edp$dateTime <- dmy_hms(paste(edp$Date,edp$Time))

# plot the data
plot.new()
hist.gap <- with(edp, hist(Global_active_power))
plot(hist.gap,col="red",main="Global Active Power",xlab="Global Active Power (killowatts)")

dev.copy(png,file="plot1.png")
dev.off()