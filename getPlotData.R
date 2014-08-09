##
##  getPlotData -- gets the data to be plotted for Project 1
##   in the Exploratory Data Analysis course
##

# set up some variables

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "./household_power_consumption.zip"
localFile <- "./household_power_consumption.txt"

# see if we need to download the data

print("Checking for data file...")

if (file.exists(localFile)) {
  
  print("Data file exists.")
  
} else {
  
  # download the file...
  print("Data file does not exist; downloading file...")
  
  download.file(fileURL, destfile=zipFile)
  
  # unzip the file
  print("Unzipping file...")
  unzip(zipFile)
  
}


# read in the data file
print("Reading file...")
x <- read.table(localFile, 
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

# done
