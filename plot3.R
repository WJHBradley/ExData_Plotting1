#the code to create the third plot

#set working directory and read in data

#will need to adjust WD to wherever cloned directory is
setwd("C:/Users/wbradley/Desktop/datasciencecoursera/ExData_Plotting1")

#decided to read in only relevant rows, and relabel columns
plotdata <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880, 
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage",
                                     "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings = "?")


plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time), format = "%d/%m/%Y %H:%M:%S")


png(filename = "plot3.png")

with(plotdata, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

with(plotdata, lines(DateTime, Sub_metering_2, col = "Red"))
with(plotdata, lines(DateTime, Sub_metering_3, col = "Blue"))
legend("topright", lty = 1,lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"))

dev.off()
