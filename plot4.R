##
## Project 1 - Exploratory Data Analysis
##   plot4.R - does the fourth requested plot
##

# First, get the data.  The code for getting the data is the same for all four
# plots, so rather than copying it into four R files, I put it into one R file
# and just source() it here. 

# This was allowed by community TA Adrian Cuyugan in posting
# https://class.coursera.org/exdata-005/forum/thread?thread_id=45 

# "You have the option to include a 5th R script where you used R to download,
# unzip, load the data and filter the dates selected, where the rest of the R
# scripts are just to produce the plots. This is actually a great idea because
# it just means that you applied what you have learned in R Programming and
# Getting and Cleaning Data."
# 
source("./getPlotData.R")

# save off original par settings so script can be rerunnable
op <- par(no.readonly=TRUE)

print("Creating plot...")

# fourth plot; four plots on one panel

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

