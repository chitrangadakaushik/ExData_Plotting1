power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerd_subset <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007") ,]

datetime <- strptime(paste(powerd_subset$Date, powerd_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gactive_power <- as.numeric(powerd_subset$Global_active_power)
gractive_power <- as.numeric(powerd_subset$Global_reactive_power)
voltage <- as.numeric(powerd_subset$Voltage)
sub_meter_1 <- as.numeric(powerd_subset$Sub_metering_1)
sub_meter_2 <- as.numeric(powerd_subset$Sub_metering_2)
sub_meter_3 <- as.numeric(powerd_subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, gactive_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_meter_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_meter_2, type="l", col="red")
lines(datetime, sub_meter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(datetime, gractive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()