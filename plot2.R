
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

png("plot2.png",480,480)

plot(Date,Global_active_power,type="n",
     xlab="",
     ylab="Global Active Power (kilowatts)")

lines(Date,Global_active_power)


dev.off()