## Install and load required packages
install.packages("sqldf")
library(sqldf)


## Read and load required data
con <- file("C:/Users/dooratharsini/Desktop/Coursera/Course4/household_power_consumption.txt")
housholdpowerdata <- read.csv.sql(file="C:/Users/dooratharsini/Desktop/Coursera/Course4/household_power_consumption.txt", 
                                  sql = "select * from file where Date in ('1/2/2007','2/2/2007') ", sep=";")
close(con)

## Check for missing values
housholdpowerdata[housholdpowerdata==""]
housholdpowerdata[housholdpowerdata=="?"]
housholdpowerdata[housholdpowerdata=="NA"]


## Merge Date and Time Columns and covert to Date/Time classes 
library(lubridate)
housholdpowerdata$DateTime <- paste0(housholdpowerdata$Date," ",housholdpowerdata$Time)
housholdpowerdata$DateTime <- strptime(housholdpowerdata$DateTime, format = '%d/%m/%Y %H:%M:%S')


## Plot
png(file="plot2.png", width = 480, height = 480, units = "px")
plot(housholdpowerdata$DateTime, housholdpowerdata$Global_active_power, type = "l", xlab = "",ylab ="Global Active Power (kilowatts)" )
dev.off()

