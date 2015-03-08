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

png(filename = "plot3.png", width = 480, height = 480)


# Plot 3
plot(c(data$unixTime,data$unixTime,data$unixTime), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(data$unixTime, data$Sub_metering_1, col="black")
lines(data$unixTime, data$Sub_metering_2, col="red")
lines(data$unixTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

dev.off()