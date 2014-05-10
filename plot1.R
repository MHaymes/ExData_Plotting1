
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


#Creates Plot1.png (takes dataframe created from function grabData as an argument)

createPlot1<-function(DF){
        png(filename="plot1.png", width=480, height=480, units="px")
        hist(DF$Global_active_power,col="red", ylim=c(0,1300), main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
}
