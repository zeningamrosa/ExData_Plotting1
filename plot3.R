   # Read data
data<-read.table("household_power_consumption.txt",header=T,sep=";")
   # change first row as character
data[,1]<-as.character(data[,1])  # Date
   # find 2007-2-1 and 2007-2-2 and make subset
subData<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
   # remove data to save memory
rm(data)
   # 7,8,9th low are "factor". transform twice to change factor to numeric
subData[,7]<-as.numeric(as.character(subData[,7]))  #Sub_metering_1
subData[,8]<-as.numeric(as.character(subData[,8]))  #Sub_metering_2
subData[,9]<-as.numeric(as.character(subData[,9]))  #Sub_metering_3

   # draw graph
png("plot3.png",width=480,height=480)
plot(subData[,7],type='l',xlab="",ylab="Energy sub metering",xaxt="n")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
lines(subData[,8],col='red')
lines(subData[,9],col='blue')
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()
