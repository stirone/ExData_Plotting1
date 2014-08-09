##
## Project 1 - Exploratory Data Analysis
##   plot3.R - does the third requested plot
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


# restore original par settings
par(op)

print("Done.")

## done.

