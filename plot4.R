## plot4.R
## 2x2 panel plot for Feb 1-2, 2007:
## 1) Global Active Power
## 2) Voltage
## 3) Sub metering 1/2/3
## 4) Global Reactive Power

data_file <- "household_power_consumption.txt"

dat <- read.table(
  file = data_file,
  header = TRUE,
  sep = ";",
  stringsAsFactors = FALSE,
  na.strings = "?"
)

dat_sub <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

dat_sub$datetime <- as.POSIXct(
  paste(dat_sub$Date, dat_sub$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

dat_sub$Global_active_power <- as.numeric(dat_sub$Global_active_power)
dat_sub$Global_reactive_power <- as.numeric(dat_sub$Global_reactive_power)
dat_sub$Voltage <- as.numeric(dat_sub$Voltage)
dat_sub$Sub_metering_1 <- as.numeric(dat_sub$Sub_metering_1)
dat_sub$Sub_metering_2 <- as.numeric(dat_sub$Sub_metering_2)
dat_sub$Sub_metering_3 <- as.numeric(dat_sub$Sub_metering_3)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Top-left
plot(dat_sub$datetime, dat_sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Top-right
plot(dat_sub$datetime, dat_sub$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom-left
plot(dat_sub$datetime, dat_sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(dat_sub$datetime, dat_sub$Sub_metering_2, col = "red")
lines(dat_sub$datetime, dat_sub$Sub_metering_3, col = "blue")
legend("topright",
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

# Bottom-right
plot(dat_sub$datetime, dat_sub$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
