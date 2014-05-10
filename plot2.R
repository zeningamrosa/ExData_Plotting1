   # Read data
data<-read.table("household_power_consumption.txt",header=T,sep=";")
   # change first row as character
data[,1]<-as.character(data[,1])  # Date
   # find 2007-2-1 and 2007-2-2 and make subset
subData<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
   # remove data to save memory
rm(data)
   # third low is "factor". transform twice to change factor to numeric
subData[,3]<-as.numeric(as.character(subData[,3]))  #Global_active_power

   # draw graph
png("plot2.png",width=480,height=480)
plot(subData[,3],type="l",xlab="",ylab="Global Active Power (killowatts)",xaxt='n')
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
