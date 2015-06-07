datelower = as.Date("2007-02-01")
dateupper = as.Date("2007-02-02")
format = "%d/%m/%Y"

hpc = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F, na.strings = "?")
hpc = hpc[datelower <= as.Date(hpc$Date, format = format) & as.Date(hpc$Date, format = format) <= dateupper,]

png(filename="plot1.png", width=480, height=480)

hist(hpc$Global_active_power, breaks = 12, col = "orange", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
