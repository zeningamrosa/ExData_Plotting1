   # Read data
data<-read.table("household_power_consumption.txt",header=T,sep=";")
   # change first row as character
data[,1]<-as.character(data[,1])  # Date
   # find 2007-2-1 and 2007-2-2 and make subset
subData<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
   # remove data to save memory
rm(data)
   # transform twice to change factor to numeric
subData[,3]<-as.numeric(as.character(subData[,3]))  #Global_active_power
subData[,4]<-as.numeric(as.character(subData[,4]))  #Global_reactive_power
subData[,5]<-as.numeric(as.character(subData[,5]))  #Voltage
subData[,7]<-as.numeric(as.character(subData[,7]))  #Sub_metering_1
subData[,8]<-as.numeric(as.character(subData[,8]))  #Sub_metering_2
subData[,9]<-as.numeric(as.character(subData[,9]))  #Sub_metering_3

   # draw graph
png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(subData[,3],type="l",xlab="",ylab="Global Active Power",xaxt='n')
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
plot(subData[,5],type="l",xlab="datetime",ylab="Voltage",xaxt='n')
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
plot(subData[,7],type='l',xlab="",ylab="Energy sub metering",xaxt="n")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
lines(subData[,8],col='red')
lines(subData[,9],col='blue')
#legend(x=800,y=40,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n")
plot(subData[,4],type="l",xlab="datetime",ylab="Global_reactive_power",xaxt='n')
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
