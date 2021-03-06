plot1 <- function(){

        f <- file("household_power_consumption.txt")
        dt <- read.table(text = grep("^[1,2]/2/2007",readLines(f), value = TRUE), sep =";" , header = TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
        dput(dt,"dt.R")
        newDate <- paste(dt$Date,dt$Time,sep = " ")
        newDate <- strptime(newDate, format = "%d/%m/%Y %H:%M:%S")
        
        png(filename = "plot1.png", width = 480, height = 480)
        hist(dt$Global_active_power, col="red", xlab = "Global Active Power(kilowatts)", main =  "Global Active Power")
        close(f)
        dev.off()

        
}