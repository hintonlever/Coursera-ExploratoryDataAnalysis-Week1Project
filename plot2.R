

#### Read data
# Estimated size = 2M * 9 * 32 bytes ~ 576 MB

setwd("C:/Users/bhint_000/Desktop/Coursera")
d <- read.csv("household_power_consumption.csv"
              ,header=TRUE
              ,sep=";"
              ,stringsAsFactors = FALSE) 

#### Subsetting the data for the 2 days we are interested in
d <- subset(d,Date=="1/2/2007"|Date=="2/2/2007")

#### Data clean up
head(as.Date(d$Date,format="%d/%m/%Y"))
d$Date <-as.Date(d$Date,format="%d/%m/%Y")

head(d$Global_active_power)
d$Global_active_power <-as.numeric(d$Global_active_power)

head(paste(d$Date,d$Time))
head(strptime(paste(d$Date,d$Time),format="%Y-%m-%d %T"))

d$DateTime <- strptime(paste(d$Date,d$Time),format="%Y-%m-%d %T")

#### Opening the PNG output
png(filename="plot2.png"
    ,width = 480, height = 480, units = "px"
    ,bg = "transparent"
    ,pointsize = 8
    ,res=100
)

#### Creating the plot
# The default colurs and sizes seem to much the example output
plot(y=d.clean$Global_active_power
     ,x=d.clean$DateTime
     ,type="l"
     ,ylab="Global Active Power (kilowatts)"
     ,xlab="")

#### Closing the file
dev.off()
