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

# 2 save PNG plot

png(filename = "plot1.png",
    width = 480, height = 480)

with(datasubset, hist(Global_active_power,
                      main = "Global Active Power",
                      xlab = "Global Active Power (kilowatts)",
                      col = "red"))

dev.off()