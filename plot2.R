## Coursera Exploratory Data Analysis Course Project 1
## PNG 2

## Script Assumes Data has already been downloaded

powerdata <- read.table('./data/household_power_consumption.txt', 
                        sep = ';', 
                        na.strings = "?", 
                        header = TRUE)

## Convert Data to correct classes
powerdata$Date <- dmy(powerdata$Date)
powerdata <- powerdata[powerdata$Date == dmy('01-02-2007') | powerdata$Date == dmy('02-02-2007'), ]
datedata <- strptime(paste(powerdata$Date, powerdata$Time, sep = ' '), format = c('%Y-%m-%d %H:%M:%S'))

##Plot 2
if(!file.exists('./plots/plot2.png')){
  png('./plots/plot2.png')
  plot(datedata, powerdata$Global_active_power, 
       type = 'l',
       ylab = 'Global Active Power (kilowatts)',
       xlab = "")
  dev.off()
} else {
  print('PNG 2 Already Exists')
}