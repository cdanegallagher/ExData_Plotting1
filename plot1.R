
df=read.table("household_power_consumption.txt",
              na.strings="?",sep=";",header = TRUE)

df$Date=as.Date(df$Date,"%d/%m/%Y")


df=df[df$Date %in% 
      as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y") 
      & !is.na(df$Date),]


attach(df)

png("plot1.png",480,480)

hist(Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

 
dev.off()