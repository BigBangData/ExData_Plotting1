## provided the unzipped data for this project is in your working directory (directions to download data in README)

## reads in subsetted data, adds DateTime variable
hpc <- subset(read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

## creates plot 1 
hist(hpc[, 1], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") 
dev.copy(png, file = "plot1.png", width = 480, height = 480) 
dev.off()
