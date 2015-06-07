datelower = as.Date("2007-02-01")
dateupper = as.Date("2007-02-02")
format = "%d/%m/%Y"

hpc = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F, na.strings = "?")
hpc = hpc[datelower <= as.Date(hpc$Date, format = format) & as.Date(hpc$Date, format = format) <= dateupper,]

plot(hpc$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering', xaxt = 'n')
axis(1,labels = c("Thu","Fri","Sat"), at = c(0,min(which(hpc$Date == "2/2/2007")),nrow(hpc)))
lines(hpc$Sub_metering_2, col = "red")
lines(hpc$Sub_metering_3, col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black","red","blue"))

dev.copy(png, file = "plot3.png")
dev.off()