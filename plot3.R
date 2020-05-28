
###Loading the dataset inta epc

epc<-read.table("household_power_consumption.txt", skip=1,sep=";")


#Names the 9 variables in the dataset epc

names(epc)<-c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )


##Selectec the dates 2007-02-01 and 2007-02-02

epc<-subset(epc,epc$Date=="1/2/2007"|epc$Date=="2/2/2007")
epc$Date<-as.Date(epc$Date,format="%d/%m/%Y")



##Convert the Time 
epc$Time<-strptime(epc$Time,format="%H:%M:%S")
epc[1:1440,"Time"]<-format(epc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
epc[1441:2880,"Time"]<-format(epc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Convect the dataset Global_active_power to numeric

epc$Global_active_power<-as.numeric(as.character(epc$Global_active_power))
epc$ub_metering_1<-as.numeric(as.character(epc$ub_metering_1))

##Make and save plot3.png 

png("plot3.png")

plot(epc$Time,epc$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
with(epc,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(epc,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_1"))

dev.off() 