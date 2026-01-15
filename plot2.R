## plot2.R
## Line plot of Global Active Power over datetime for Feb 1-2, 2007

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

png("plot2.png", width = 480, height = 480)

plot(dat_sub$datetime, dat_sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
