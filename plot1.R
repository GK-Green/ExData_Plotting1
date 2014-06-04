# hist plot Global Active Power on 1/2/2007 and 2/2/2007

# Reading data from file

data          <- read.table("./household_power_consumption.txt", header = TRUE, 
                         sep = ";", colClasses = "character")
data          <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data[,3:9]    <- lapply(data[,3:9],as.numeric)
data$datetime <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")

# open a 480x480 window, 6.4 inch x 6.4 inch
windows(6.4,6.4, bg = "white")

# plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# copy to .png file
dev.copy(png, file = "plot1.png")
dev.off()