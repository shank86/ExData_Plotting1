dataRaw <- read.csv(
  "household_power_consumption.txt",
  sep=";",
  dec=".",
  na.strings = "?",
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- dataRaw[(dataRaw$Date == "1/2/2007" | dataRaw$Date == "2/2/2007"), ]
data$unixTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","en_US.UTF-8")     # Depends on the system, works for me on my OS

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot 1
plot(data$unixTime, data$Global_active_power, type = "n", ylab = "Global Active Power", xlab="")
lines(data$unixTime, data$Global_active_power)

# Plot 2
plot(data$unixTime, data$Voltage, type = "n", ylab = "Voltage", xlab="datetime")
lines(data$unixTime, data$Voltage)

# Plot 3
plot(c(data$unixTime,data$unixTime,data$unixTime), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(data$unixTime, data$Sub_metering_1, col="black")
lines(data$unixTime, data$Sub_metering_2, col="red")
lines(data$unixTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

# Plot 4
plot(data$unixTime, data$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab="datetime")
lines(data$unixTime, data$Global_reactive_power)

dev.off()