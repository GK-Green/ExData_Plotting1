# 2D plot sub metering vs Time on 1/2/2007 and 2/2/2007

# Reading data from file

data          <- read.table("./household_power_consumption.txt", header = TRUE, 
                            sep = ";", colClasses = "character")
data          <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data[,3:9]    <- lapply(data[,3:9],as.numeric)
data$datetime <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")

# setting graphic device to png
png(filename = "plot4.png")

# plot
with(data,plot(datetime,Sub_metering_1,"l", xlab = "", ylab = "Energy sub metering"))
with(data,lines(datetime,Sub_metering_2,col = "red"))
with(data,lines(datetime,Sub_metering_3,col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=c(1,1))

# Turn off graphic device
dev.off()