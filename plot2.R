download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
utils::unzip("data.zip")

allData <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?")
allData["filterDate"] <- as.Date(allData$Date, format="%d/%m/%Y")
allData["dateTime"] <- with(allData, as.POSIXct(paste(filterDate, Time), format="%Y-%m-%d %H:%M:%S"))
data <- subset(allData, allData$filterDate == as.Date("02/01/2007", format="%m/%d/%Y") | allData$filterDate == as.Date("02/02/2007", format="%m/%d/%Y"))
good_data <- data[complete.cases(data), ]


png(filename = "plot2.png")
plot (good_data$Global_active_power ~ good_data$dateTime, type = "l",  ylab = "Global Active Power (kilowatts)", xlab="")
axis(1, good_data$filterDate, format(good_data$filterDate, "%a"))
dev.off()