df=read.table("household_power_consumption.txt",
              na.strings="?",sep=";",header = TRUE)

df$Date=as.Date(df$Date,"%d/%m/%Y")


df=df[df$Date %in% 
        as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y") 
      & !is.na(df$Date),]


#concatenate date and time

df$Date=paste(df$Date,df$Time,sep=" ")

df$Date=as.POSIXlt(df$Date)

attach(df)

png("plot3.png",480,480)

plot(Date,Sub_metering_1,type="n",
     xlab="",
     ylab="Energy sub metering")

lines(Date,Sub_metering_1,col="black")
lines(Date,Sub_metering_2,col="red")
lines(Date,Sub_metering_3,col="blue")

legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



dev.off()
