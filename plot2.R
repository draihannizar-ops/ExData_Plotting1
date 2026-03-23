data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   na.strings="?", 
                   stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- subset(data, Date == as.Date("2007-02-01") 
                   | Date == as.Date("2007-02-02"))
data_sub$Datetime <- as.POSIXct(strptime(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S"))
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
png("plot2.png", width=480, height=480)
plot(data_sub$Datetime, 
     data_sub$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()