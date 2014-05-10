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

#Creates Plot2.png (takes dataframe created from function grabData as an argument)

createPlot2<-function(DF){
        
        png(filename="plot2.png", width=480, height=480, units="px")
        
        plot(DF$pTime,DF$Global_active_power,type="l", ylab="Global Active Power(kilowatts)", xlab="")        
        dev.off()
}
