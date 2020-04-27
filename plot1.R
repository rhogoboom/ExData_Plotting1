## Coursera Exploratory Data Analysis Course Project 1
## PNG 1

## Script Assumes Data has already been downloaded

powerdata <- read.table('./data/household_power_consumption.txt', 
                        sep = ';', 
                        na.strings = "?", 
                        header = TRUE)

## Convert Data to correct classes
powerdata$Date <- dmy(powerdata$Date)
powerdata <- powerdata[powerdata$Date == dmy('01-02-2007') | powerdata$Date == dmy('02-02-2007'), ]
datedata <- strptime(paste(powerdata$Date, powerdata$Time, sep = ' '), format = c('%Y-%m-%d %H:%M:%S'))

# Plot 1
if(!file.exists('./plots/plot1.png')){
  png('./plots/plot1.png')
  hist(powerdata$Global_active_power, 
       col = 'red', 
       main = 'Global Active Power', 
       xlab = 'Global Active Power (kilowatts)')
  dev.off()
} else {
  print('PNG 1 Already Exists')
}