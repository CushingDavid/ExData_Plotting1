## Plot 3:
library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

## Convert 'Date' column to Date format
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

## Extract the data for 1st and 2nd Feb 2007
febdata <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02", ]

## extract the day from the date:
febdata$day <- weekdays(febdata$Date)
febdata$DateTime <- as.POSIXct(paste(febdata$Date, febdata$Time), format="%Y-%m-%d %H:%M:%S")

##  Open the png file:
png("plot3.png", width = 480, height = 480)

## plot the 3 lines on the same plot:
plot(febdata$DateTime, febdata$Sub_metering_1, 
     type = "l",
     ylab = "Energy Sub Metering",
     xlab = "")
lines(febdata$DateTime, febdata$Sub_metering_2, col="red")
lines(febdata$DateTime, febdata$Sub_metering_3, col="blue")
## Add a legend - top right corner
legend("topright", 
       legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lty=1:1, 
       cex=0.8)
dev.off()

