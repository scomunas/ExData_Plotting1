## Create a plot from a Power Consumption Dataset
##
## In this case we will create an Histogram plot that puts Frequency for each
## Global Active Power

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
png("plot1.png")
hist(EntradaFiltrada$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()