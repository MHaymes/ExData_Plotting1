
#read the data, reformat the dates and times into a new variable pTime, and return just the subset of interest. 
grabData<-function(){        
        data<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
        data$Date<-as.Date(data$Date,"%d/%m/%Y")
        a<-as.Date("1/2/2007","%d/%m/%Y")
        b<-as.Date("2/2/2007","%d/%m/%Y")
        DF<-data[data$Date<=b & data$Date>=a,]
        
        #Append a posixlt formatted time variable, labeled pTime
        DF$pTime<-as.POSIXlt(paste(DF$Date,DF$Time))
        return(DF)
}


#Creates Plot4.png (takes dataframe created from function grabData as an argument)
createPlot4<-function(DF){
        png(filename="plot4.png", width=480, height=480, units="px")
        par(mfcol=c(2,2))
        plot(DF$pTime,DF$Global_active_power,type="l", ylab="Global Active Power", xlab="")        
        plot(DF$pTime,DF$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
        lines(DF$pTime,DF$Sub_metering_2, type="l", col="red")
        lines(DF$pTime,DF$Sub_metering_3, type="l", col="blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1,bty="n")
        plot(DF$pTime,DF$Voltage,type="l", ylab="Voltage", xlab="datetime")        
        plot(DF$pTime,DF$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime", lwd=1)
        dev.off()        
}
