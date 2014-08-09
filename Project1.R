##
## Project 1 - Exploratory Data Analysis
##

# download the file...
print("Downloading file...")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="./household_power_consumption.zip")

# unzip the file
print("Unzipping file...")
unzip("./household_power_consumption.zip")


# read in the data file
print("Reading file...")
x <- read.table("./household_power_consumption.txt", 
                sep=";",      # this is the separator used in the file
                header=TRUE,  # column names are in the first row
                as.is=c(1:9), # read in numbers as numbers, if possible
                na.strings="?", # this is how NAs are coded
                nrows=100000  # we are only interested in Feb 1/2 2007, and those are in this range somewhere
                )



# create a column with the DateTime value in it, from the original values
x$DateTime <- strptime(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S")

# we will need this library to work with date/times easily
library(lubridate)

# extract out just the dates of interest
a <- x[year(x$DateTime) == 2007 & month(x$DateTime) == 2 & day(x$DateTime) == 1,]
b <- x[year(x$DateTime) == 2007 & month(x$DateTime) == 2 & day(x$DateTime) == 2,]
d <- rbind(a, b)

# remove x from memory, no longer needed
rm(x)


# these need to be numeric for the hist/plot functions to work on them
d$Global_active_power <- as.numeric(d$Global_active_power)
d$Global_reactive_power <- as.numeric(d$Global_reactive_power)
d$Voltage <- as.numeric(d$Voltage)
d$Global_intensity <- as.numeric(d$Global_intensity)
d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)

# save off original par settings so script can be rerunnable
op <- par(no.readonly=TRUE)

print("Creating plots...")

# first plot; a histogram
hist(d$Global_active_power, col="red"
     , xlab="Global Active Power (kilowatts)" 
     , main="Global Active Power")

# write out the png file; it will default to the specified 480x480px size
dev.copy(png, file="plot1.png")
dev.off()  # close the png device!


# second plot; a line plot
plot(d$DateTime, d$Global_active_power, type="l"
     , ylab="Global Active Power (kilowatts)"
     , xlab="")

# write out the png file
dev.copy(png, file="plot2.png")
dev.off()  # close the png device!


# third plot; three series on one plot
#  note, pch=151 is the long dash character asked for by the assignment
plot(d$DateTime, d$Sub_metering_1, type="l", 
    xlab= "", ylab="Energy sub metering")
lines(d$DateTime, d$Sub_metering_2, type="l", col="red") 
lines(d$DateTime, d$Sub_metering_3, type="l", col="blue")
legend("topright", pch=151, col=c("black","red","blue"),legend=c(colnames(d)[7:9]))

# write out the png file
dev.copy(png, file="plot3.png")
dev.off()  # close the png device!


# fourth plot; four plots on one panel
# similar plots, but not exactly, so we couldn't use functions.

# set up panel
par(mfrow = c(2,2), mar=c(4,4,2,1))

# plot 1
plot(d$DateTime, d$Global_active_power, type="l"
     , ylab="Global Active Power"
     , xlab="")

# plot 2
plot(d$DateTime, d$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(d$DateTime, d$Sub_metering_1, type="l", 
     xlab= "", ylab="Energy sub metering")
lines(d$DateTime, d$Sub_metering_2, type="l", col="red") 
lines(d$DateTime, d$Sub_metering_3, type="l", col="blue")
legend("topright", pch=151, col=c("black","red","blue"),
       legend=c(colnames(d)[7:9])
       , bty="n")

# plot 4
plot(d$DateTime, d$Global_reactive_power, type="l"
      , ylab="Global_reactive_power"
      , xlab="datetime")

# write out the png file
dev.copy(png, file="plot4.png")
dev.off()  # close the png device!

# restore original par settings
par(op)

print("Done.")

## done.

