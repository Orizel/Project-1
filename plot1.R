
###Loading the dataset inta epc

epc<-read.table("household_power_consumption.txt", skip=1,sep=";")


#Names the 9 variables in the dataset epc

names(epc)<-c("Date", "Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )


##Selectec the dates 2007-02-01 and 2007-02-02

epc<-subset(epc,epc$Date=="1/2/2007"|epc$Date=="2/2/2007")
epc$Date<-as.Date(epc$Date)


##Convect the dataset to numeric

epc$Global_active_power<-as.numeric(as.character(epc$Global_active_power))

##Making and saving plot1.png 
png("plot1.png")
hist(epc$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power(kilowatts")
dev.off()     