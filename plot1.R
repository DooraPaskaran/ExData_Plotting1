## Install and load required packages
install.packages("sqldf")
library(sqldf)

## Read and load required data
con <- file("C:/Users/dooratharsini/Desktop/Coursera/Course4/household_power_consumption.txt")
housholdpowerdata <- read.csv.sql(file="C:/Users/dooratharsini/Desktop/Coursera/Course4/household_power_consumption.txt", 
                                  sql = "select * from file where Date in ('1/2/2007','2/2/2007') ", sep=";")
close(con)


## Convert to Date/Time Class
library(lubridate)
housholdpowerdata$Date <- strptime(housholdpowerdata$Date, format = '%d/%m/%Y')
housholdpowerdata$Weekday <- weekdays(housholdpowerdata$Date)


## Plot
png(file="plot1.png", width = 480, height = 480, units = "px")
hist(housholdpowerdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

