##
## Project 1 - Exploratory Data Analysis
##   plot2.R - does the second requested plot
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

# second plot; a line plot
plot(d$DateTime, d$Global_active_power, type="l"
     , ylab="Global Active Power (kilowatts)"
     , xlab="")

# write out the png file
dev.copy(png, file="plot2.png")
dev.off()  # close the png device!


# write out the png file; it will default to the specified 480x480px size
dev.copy(png, file="plot2.png")
dev.off()  # close the png device!

# restore original par settings
par(op)

print("Done.")

## done.

