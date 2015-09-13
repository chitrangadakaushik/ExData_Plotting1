power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerd_subset <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007") ,]

gactive_power <- as.numeric(powerd_subset$Global_active_power)
datetime <- strptime(paste(powerd_subset$Date, powerd_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, gactive_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()