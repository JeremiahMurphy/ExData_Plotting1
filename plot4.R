install.packages("dplyr")
library(dplyr)
my_data <- read.csv2("household_power_consumption.txt")
days <- filter(my_data, Date == "1/2/2007" | Date == "2/2/2007")
DateTime <- strptime(paste(days$Date, days$Time), "%d/%m/%Y %H:%M:%S")
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(DateTime,as.numeric(days$Global_active_power)/1000, type = "l", ylab= "Global Active Power", xlab="")
plot(DateTime,as.numeric(days$Voltage),type = "l", ylab= "Voltage")
plot(DateTime,as.numeric(days$Sub_metering_1), type = "l", ylab= "Energy sub metering", xlab="", col="black")
lines(DateTime,as.numeric(days$Sub_metering_2), type = "l", ylab= "Energy sub metering", xlab="", col="red")
lines(DateTime,as.numeric(days$Sub_metering_3), type = "l", ylab= "Energy sub metering", xlab="",col="blue")
legend("topright",cex=0.4,lty="solid",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"))
plot(DateTime,as.numeric(days$Global_reactive_power)/100,type = "l",ylab= "Global_reactive_power")
dev.off()
