## plot1.R
## Histogram of Global Active Power for Feb 1-2, 2007

data_file <- "household_power_consumption.txt"

dat <- read.table(
  file = data_file,
  header = TRUE,
  sep = ";",
  stringsAsFactors = FALSE,
  na.strings = "?"
)

dat_sub <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

dat_sub$Global_active_power <- as.numeric(dat_sub$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(dat_sub$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
