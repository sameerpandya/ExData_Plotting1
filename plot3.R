download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
utils::unzip("data.zip")

allData <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?")
allData["filterDate"] <- as.Date(allData$Date, format="%d/%m/%Y")
allData["dateTime"] <- with(allData, as.POSIXct(paste(filterDate, Time), format="%Y-%m-%d %H:%M:%S"))
data <- subset(allData, allData$filterDate == as.Date("02/01/2007", format="%m/%d/%Y") | allData$filterDate == as.Date("02/02/2007", format="%m/%d/%Y"))
good_data <- data[complete.cases(data), ]


png(filename = "plot3.png")
plot (good_data$Sub_metering_1 ~ good_data$dateTime, type = "l",  ylab = "Energy sub metering", xlab="")
lines(good_data$Sub_metering_2 ~ good_data$dateTime, col="red")
lines(good_data$Sub_metering_3 ~ good_data$dateTime, col="blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, good_data$filterDate, format(good_data$filterDate, "%a"))
dev.off()