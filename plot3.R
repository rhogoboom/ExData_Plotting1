## Coursera Exploratory Data Analysis Course Project 1
## PNG 3

## Script Assumes Data has already been downloaded

powerdata <- read.table('./data/household_power_consumption.txt', 
                        sep = ';', 
                        na.strings = "?", 
                        header = TRUE)

## Convert Data to correct classes
powerdata$Date <- dmy(powerdata$Date)
powerdata <- powerdata[powerdata$Date == dmy('01-02-2007') | powerdata$Date == dmy('02-02-2007'), ]
datedata <- strptime(paste(powerdata$Date, powerdata$Time, sep = ' '), format = c('%Y-%m-%d %H:%M:%S'))

##Plot 3
if(!file.exists('./plots/plot3.png')){
  png('./plots/plot3.png')
  plot(datedata, powerdata$Sub_metering_1, 
       type = 'n', 
       ylab = 'Energy sub metering', 
       xlab = '')
  lines(datedata, powerdata$Sub_metering_1, col = 'black')
  lines(datedata, powerdata$Sub_metering_2, col = 'red')
  lines(datedata, powerdata$Sub_metering_3, col = 'blue')
  legend('topright', 
         lty = 1, 
         col = c('black','red','blue'), 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  dev.off()
} else {
  print('PNG 3 Already exists')
}