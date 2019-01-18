
setwd("~/4. Exploratory Data Analysis/exdata_data_household_power_consumption")

## Plot 1 

library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

## Convert 'Date' column to Date format
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

## Extract the data for 1st and 2nd Feb 2007
febdata <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02", ]

## open ping file for plot1
png("plot1.png", width = 480, height = 480)
##Histogram of the Global Active Power variable
hist(febdata$Global_active_power, col = 'red', xlab = 'Global Active Power (kW)', main = 'Global Active Power')
dev.off()
