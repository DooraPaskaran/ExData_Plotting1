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
png(file="plot3.png", width = 480, height = 480, units = "px")
plot(housholdpowerdata$DateTime, housholdpowerdata$Sub_metering_1, type = "l", xlab = "",ylab ="Energy sub metering" )
lines(housholdpowerdata$DateTime,housholdpowerdata$Sub_metering_2, type = "l", col="red")
lines(housholdpowerdata$DateTime,housholdpowerdata$Sub_metering_3, type = "l", col="blue")
legend("topright",lty= 1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()