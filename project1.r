# get the data

Data<-read.table("household_power_consumption.txt", head=TRUE, sep=";", na.strings="?")
                
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

small_Data<-subset(Data, Date=="2007-2-1"|Date=="2007-2-2")

small_Data$Timestamp = strptime(paste(small_Data$Date, small_Data$Time), 
                                format = "%Y-%m-%d %H:%M:%S")

#small_Data$Global_active_power <- as.character(small_Data$Global_active_power)

#small_Data$Global_active_power <- as.numeric(small_Data$Global_active_power)

#plot1
png("plot1.png", width = 480, height = 480)
hist(small_Data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", col="red")
dev.off()

#############plot2####################

png("plot2.png", width = 480, height = 480)

plot(small_Data$Timestamp, small_Data$Global_active_power,  main=NULL, xlab="", type="l",
     ylab="Global Active Power (Kilowatts)")
dev.off()

#############plot3#####################

png("plot3.png", width = 480, height = 480)

plot(small_Data$Timestamp, small_Data$Sub_metering_1,  main=NULL, xlab="", type="l",
     ylab="Energy Sub metering")


lines(small_Data$Timestamp, small_Data$Sub_metering_2, type = "l", col = "red")

lines(small_Data$Timestamp, small_Data$Sub_metering_3, type = "l", col = "blue")

legend("topright", c('Sub_metering_1 ','Sub_metering_2 ','Sub_metering_3 '), 
       lty=1, col=c('black','orangered','blue'))
dev.off()
#############plot4#####################

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(small_Data$Timestamp, small_Data$Global_active_power,  main=NULL, xlab="", type="l",
     ylab="Global Active Power (Kilowatts)")

plot(small_Data$Timestamp, small_Data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(small_Data$Timestamp, small_Data$Sub_metering_1,  main=NULL, xlab="", type="l",
     ylab="Energy Sub metering")


lines(small_Data$Timestamp, small_Data$Sub_metering_2, type = "l", col = "red")

lines(small_Data$Timestamp, small_Data$Sub_metering_3, type = "l", col = "blue")

legend("topright", c('Sub_metering_1 ','Sub_metering_2 ','Sub_metering_3 '), 
       lty=1, bty='n', col=c('black','orangered','blue'))

plot(small_Data$Timestamp, small_Data$Global_reactive_power,  main=NULL, 
     xlab="datetime", ylab="global_reactive_power", type="l")



dev.off()
