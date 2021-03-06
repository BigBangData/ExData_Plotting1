## provided the unzipped data for this project is in your working directory (directions to download data in README)

## reads in subsetted data, adds DateTime variable
hpc <- subset(read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

## creates plot 2
plot(hpc[, 10], hpc[, 3], type = "l", ylab =  "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()
