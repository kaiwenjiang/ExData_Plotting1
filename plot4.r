datelower = as.Date("2007-02-01")
dateupper = as.Date("2007-02-02")
format = "%d/%m/%Y"

hpc = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F, na.strings = "?")
hpc = hpc[datelower <= as.Date(hpc$Date, format = format) & as.Date(hpc$Date, format = format) <= dateupper,]

png(filename="plot4.png", width=480, height=480)

par(mfrow = c(2,2))
plot(hpc$Global_active_power, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(1,labels = c("Thu","Fri","Sat"), at = c(0,min(which(hpc$Date == "2/2/2007")),nrow(hpc)))
plot(hpc$Voltage, type = 'l',xaxt = 'n',xlab = 'datetime', ylab = 'Voltage')
axis(1,labels = c("Thu","Fri","Sat"), at = c(0,min(which(hpc$Date == "2/2/2007")),nrow(hpc)))
plot(hpc$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering', xaxt = 'n')
axis(1,labels = c("Thu","Fri","Sat"), at = c(0,min(which(hpc$Date == "2/2/2007")),nrow(hpc)))
lines(hpc$Sub_metering_2, col = "red")
lines(hpc$Sub_metering_3, col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black","red","blue"))
plot(hpc$Global_reactive_power, type = 'l',xaxt = 'n',xlab = 'datetime', ylab = 'Global_reactive_power')
axis(1,labels = c("Thu","Fri","Sat"), at = c(0,min(which(hpc$Date == "2/2/2007")),nrow(hpc)))

dev.off()