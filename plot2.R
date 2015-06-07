setwd("C:/Users/Kaiwen Jiang/Documents/Academics/Self-Study/Coursera EDA")

hpc = read.table("household_power_consumption_save.txt", sep = "\t", header = T, stringsAsFactors = F, na.strings = "?")
plot(hpc$Global_active_power, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(1,labels = c("Thu","Fri","Sat"), at = c(0,min(which(hpc$Date == "2/2/2007")),nrow(hpc)))

dev.copy(png, file = "plot2.png")
dev.off()