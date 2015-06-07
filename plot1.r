setwd("C:/Users/Kaiwen Jiang/Documents/Academics/Self-Study/Coursera EDA")

hpc = read.table("household_power_consumption_save.txt", sep = "\t", header = T, stringsAsFactors = F, na.strings = "?")
hist(hpc$Global_active_power, breaks = 12, col = "orange", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
