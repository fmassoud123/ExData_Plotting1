library(dplyr)
library(tidyr)
library(lubridate)
library (ggplot2)
library("gridExtra")

#   Loading the dataless 
#   The dataset has 2,075,259 rows and 9 columns. 
#   We will only be using data from the dates 2007-02-01 and 2007-02-02.

data <- tbl_df(read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?" ,as.is = T))
power_consumption <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# convert the Date and Time variables to Date/Time classes 
datetime <- dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep = '/'))
mod_data <- power_consumption %>%
  mutate(datetime = datetime)
power_consumption$Date <- dmy(power_consumption$Date)

####   PLot 

# save it to a PNG file with a width of 480 pixels and a height of 480 pixels
#  plot 3

data_long <- gather(mod_data, key= Meter,value = Reading,Sub_metering_1:Sub_metering_3 )
  png( filename ='~/Data_Science/GitHub/ExData_Plotting1/figure/plot3.png', width = 480, height = 480 )
  p3 <- ggplot(data_long, aes(x= datetime, y= Reading, col= Meter)) + geom_line()
  p3
 dev.off()
 
 
 