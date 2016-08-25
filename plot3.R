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
png("plot3.png")
plot(EntradaFiltrada$DateTime,EntradaFiltrada$Sub_metering_1, col="black", 
     type = "lines", main = "", xlab = "", ylab = "")
lines(EntradaFiltrada$DateTime,EntradaFiltrada$Sub_metering_2, col="red", 
      type = "lines", main = "", xlab = "", ylab = "")
lines(EntradaFiltrada$DateTime,EntradaFiltrada$Sub_metering_3, col="blue", 
      type = "lines", main = "", xlab = "", ylab = "")
title(main = "", xlab = "", ylab = "Energy sub metering")
legend("topright", lty="solid", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()