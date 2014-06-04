# 2D plot with 4 sub plots on 1/2/2007 and 2/2/2007

# Reading data from file

data          <- read.table("./household_power_consumption.txt", header = TRUE, 
                            sep = ";", colClasses = "character")
data          <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data[,3:9]    <- lapply(data[,3:9],as.numeric)
data$datetime <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")

# setting graphic device to png
png(filename = "plot4.png")
par(mfcol = c(2,2))

# plot (1,1)
with(data,plot(datetime,Global_active_power,"l",
               xlab = "", ylab = "Global Active Power"))

# plot (2,1)
with(data,plot(datetime,Sub_metering_1,"l", xlab = "", ylab = "Energy sub metering"))
with(data,lines(datetime,Sub_metering_2,col = "red"))
with(data,lines(datetime,Sub_metering_3,col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = c(1,1),bty = "n")

# plot (1,2)
with(data,plot(datetime,Voltage,"l"))

# plot (2,2)
with(data,plot(datetime,Global_reactive_power,"l",lwd = "0.2"))

# Turn off graphic device
dev.off()