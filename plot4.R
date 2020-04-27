## Coursera Exploratory Data Analysis Course Project 1
## PNG 4

## Script Assumes Data has already been downloaded

powerdata <- read.table('./data/household_power_consumption.txt', 
                        sep = ';', 
                        na.strings = "?", 
                        header = TRUE)

## Convert Data to correct classes
powerdata$Date <- dmy(powerdata$Date)
powerdata <- powerdata[powerdata$Date == dmy('01-02-2007') | powerdata$Date == dmy('02-02-2007'), ]
datedata <- strptime(paste(powerdata$Date, powerdata$Time, sep = ' '), format = c('%Y-%m-%d %H:%M:%S'))

##Plot 4
if(!file.exists('./plots/plot4.png')){
  png('./plots/plot4.png')
  current.pars <- par()
  par(mfrow = c(2,2))
  plot(datedata, powerdata$Global_active_power, 
       type = 'l',
       ylab = 'Global Active Power',
       xlab = "")
  plot(datedata, powerdata$Voltage,
       type = 'l',
       ylab = 'Voltage',
       xlab = 'datetime')
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
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         bty = 'n')
  plot(datedata, powerdata$Global_reactive_power,
       type ='l',
       ylab = 'Global_reactive_power',
       xlab = 'datetime')
  dev.off()
} else {
  print('PNG 4 Already Exists')
}