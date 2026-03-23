data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   na.strings="?", 
                   stringsAsFactors=FALSE) 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
+data_sub <- subset(data, Date == as.Date("2007-02-01") 
                    | Date == as.Date("2007-02-02"))
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data_sub$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()