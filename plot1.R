download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
utils::unzip("data.zip")

allData <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")
data <- subset(allData, allData$Date == as.Date("02/01/2007", format="%m/%d/%Y") | allData$Date == as.Date("02/02/2007", format="%m/%d/%Y"))
good_data <- data[complete.cases(data), ]

png(filename = "plot1.png")
hist(good_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()