# 1 reading, subsetting & converting file
classes <- c("character",
             "character",
             "numeric",
             "numeric",
             "numeric",
             "numeric",
             "numeric",
             "numeric",
             "numeric")

datatable <- read.csv("household_power_consumption.txt",
                      sep = ";",
                      na.strings = c("?"),
                      colClasses = classes)

datasubset <- subset(datatable, Date=="1/2/2007" | Date=="2/2/2007")
datasubset$DateTime <- strptime(paste(datasubset$Date, datasubset$Time),
                                "%d/%m/%Y %H:%M:%S")

# 2 save PNG plot

png(filename = "plot3.png",
    width = 480, height = 480)

plot(datasubset$DateTime, datasubset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datasubset$DateTime, datasubset$Sub_metering_2, col="red")
lines(datasubset$DateTime, datasubset$Sub_metering_3, col="blue")
legend("topright", pch = "-", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()