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

png(filename = "plot2.png",
    width = 480, height = 480)

plot(datasubset$DateTime, datasubset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()