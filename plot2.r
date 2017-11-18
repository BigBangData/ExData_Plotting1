## reads in subsetted data, adds DateTime variable
hpc <- subset(read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc <- hpc[, 3:10]

## creates plot 2
plot(hpc[, 8], hpc[, 1], type = "l", ylab =  "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()
