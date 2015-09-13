power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
powerd_subset <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007") ,]
gactive_power <- as.numeric(powerd_subset$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(gactive_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()