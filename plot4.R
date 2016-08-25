## Create a plot from a Power Consumption Dataset
##
## In this case we will create a Line plot that puts Global Active Power for 
## each DateTime

## Read entire file
EntradaDatos <- read.table("household_power_consumption.txt",header=TRUE,
                           sep=";",na.strings="?",stringsAsFactors = FALSE)

## Convert dates in strings to dates class
EntradaDatos$DateTime <- paste(EntradaDatos$Date,EntradaDatos$Time)
EntradaDatos$DateTime <- strptime(EntradaDatos$DateTime, 
                                  format = "%d/%m/%Y %H:%M:%S")

## Filter only data for the dates demanded and remove original dataset
EntradaFiltrada <- subset(EntradaDatos, 
                          EntradaDatos$DateTime >= as.POSIXlt("2007-02-01") & 
                              EntradaDatos$DateTime < as.POSIXlt("2007-02-03"))
remove(EntradaDatos)

## Open PNG device and create plot
png("plot4.png")
    
    ## Define a 2x2 plot grid 
    par(mfrow = c(2, 2))

    ## First plot
    plot(EntradaFiltrada$DateTime,EntradaFiltrada$Global_active_power,
         type = "lines", ylab = "Global Active Power", xlab ="")
    
    ## Second plot
    plot(EntradaFiltrada$DateTime,EntradaFiltrada$Voltage,
         type = "lines", ylab = "Voltage", xlab ="datetime")
    
    ## Third plot
    plot(EntradaFiltrada$DateTime,EntradaFiltrada$Sub_metering_1, col="black", 
         type = "lines", main = "", xlab = "", ylab = "")
    lines(EntradaFiltrada$DateTime,EntradaFiltrada$Sub_metering_2, col="red", 
          type = "lines", main = "", xlab = "", ylab = "")
    lines(EntradaFiltrada$DateTime,EntradaFiltrada$Sub_metering_3, col="blue", 
          type = "lines", main = "", xlab = "", ylab = "")
    title(main = "", xlab = "", ylab = "Energy sub metering")
    legend("topright", lty="solid", lwd = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    
    ## Fourth plot
    plot(EntradaFiltrada$DateTime,EntradaFiltrada$Global_reactive_power,
         type = "lines", ylab = "Global_reactive_power", xlab ="datetime")
dev.off()