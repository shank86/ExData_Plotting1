## read file to table
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Converting dates:
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

## Subsetting the data to the desired dates:
data <- subset(d, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(d)


## plot the histogram of global_active_power:
par(mar=c(4.7, 4.7, 0.7, 0.7))
## Plot 1
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Save data to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()