## provided the unzipped data for this project is in your working directory (directions to download data in README)

## reads in subsetted data, adds DateTime variable
hpc <- subset(read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

## creates plot 4
plot3 <- function() {
	plot(hpc[, 10], hpc[, 7], ylab =  "Energy sub metering", xlab = "", type = "n")
	lines(hpc[, 10], hpc[, 7])
	lines(hpc[, 10], hpc[, 8], col="red")
	lines(hpc[, 10], hpc[, 9], col="blue")
	legend("topright",  lty = 1 , col = c("black", "red", "blue"), legend = c(names(hpc[7:9])))
}
par(mfrow = c(2, 2))
with(hpc, {
    plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot3()
	plot(DateTime,  Global_reactive_power, type = "l", xlab = "datetime")
})
dev.copy(png, file = "plot4.png", width = 480, height = 480) 
dev.off()
