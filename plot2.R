datelower = as.Date("2007-02-01")
dateupper = as.Date("2007-02-02")
format = "%d/%m/%Y"

hpc = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F, na.strings = "?")
hpc = hpc[datelower <= as.Date(hpc$Date, format = format) & as.Date(hpc$Date, format = format) <= dateupper,]

plot(hpc$Global_active_power, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(1,labels = c("Thu","Fri","Sat"), at = c(0,min(which(hpc$Date == "2/2/2007")),nrow(hpc)))

dev.copy(png, file = "plot2.png")
dev.off()