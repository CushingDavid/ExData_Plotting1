### Plot 2:

library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

## Convert 'Date' column to Date format
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

## Extract the data for 1st and 2nd Feb 2007
febdata <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02", ]
## extract the day from the date:

febdata$day <- weekdays(febdata$Date)
febdata$DateTime <- as.POSIXct(paste(febdata$Date, febdata$Time), format="%Y-%m-%d %H:%M:%S")

## Open the png file:
png("plot2.png", width = 480, height = 480)
## Plot the Avtive Power:
plot(febdata$DateTime, febdata$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power(kW)", 
     xlab = "" )
dev.off()
