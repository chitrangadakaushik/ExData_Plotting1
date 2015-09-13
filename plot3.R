power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerd_subset <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007") ,]

datetime <- strptime(paste(powerd_subset$Date, powerd_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_meter_1 <- as.numeric(powerd_subset$Sub_metering_1)
sub_meter_2 <- as.numeric(powerd_subset$Sub_metering_2)
sub_meter_3 <- as.numeric(powerd_subset$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, sub_meter_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_meter_2, type="l", col="red")
lines(datetime, sub_meter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()