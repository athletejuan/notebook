install.packages("dplyr")

library(dplyr)
library(RevoPemaR)

PemaFlightDelays<-setPemaClass(
  Class="PemaFlightDelays", contains="PemaBaseClass",
  fields = list(totalFlights = "numeric", totalDelays="numeric", origin="character",
              dest="character",airline="character",delayTimes="vector",results="list"),
  methods=list(initialize=function(originCode="",destinationCode="",airlineCode="", ...){
  'initialize fields'
    callSuper(...) 
    usingMethods(.pemaMethods) 
    totalFlights<<-0
    totalDelays<<-0 
    delayTimes<<-vector(mode="numeric",length=0)
    origin<<-originCode 
    dest<<-destinationCode 
    airline<<-airlineCode
    },
  processData=function(dataList){
    'Generates a vector of delay times for specified variables in the current chunk of data.'
    data <- as.data.frame(dataList)
    if (origin==""){origin<<-as.character(as.character(data$Origin[1]))}
    if (dest==""){dest<<-as.character(as.character(data$Dest[1]))}
    if (airline==""){airline<<-as.character(as.character(data$UniqueCarrier[1]))}
    data%>%
      filter(Origin==origin, Dest==dest, UniqueCarrier==airline) %T>%
      {totalFlights<<-totalFlights + length(.$Origin)} %>%
      select(ifelse(is.na(Delay),0,Delay)) %>%
      filter(Delay>0)->temp
    delayTimes<<-c(delayTimes, as.vector(temp[,1]))
    totalDelays<<-length(delayTimes)
    invisible(NULL)
  },
  updateResults=function(pemaFlightDelaysObj){
    'Updates total observations and delayTimes vector from another PemaFlightDelays object object.'
    totalFlights<<-totalFlights + pemaFlightDelaysObj$totalFlights
    totalDelays<<-totalDelays + pemaFlightDelaysObj$totalDelays
    delayTimes<<-c(delayTimes, pemaFlightDelaysObj$delayTimes) 
    invisible(NULL)
  },
  processResults=function(){
    'Generates a list containing the results:'
    'The first element is the number of flights made by the airline'
    'The second element is the number of delayed flights'
    'The third element is the list of delay times'
    results<<-list("NumberOfFlights"=totalFlights,"NumberOfDelays"=totalDelays,"DelayTimes"=delayTimes)
    return(results)
  }))

pemaFlightDelaysObj <- PemaFlightDelays()
remoteLogin("http://LON-RSVR.ADATUM.COM:12800", session=TRUE, diff=TRUE, commandline = TRUE)
pause()
putLocalObject("pemaFlightDelaysObj")
resume()

install.packages("dplyr")
library(dplyr)
library(RevoPemaR)

flightDelayDataFile<-("\\\\LON-RSVR\\Data\\FlightDelayData.xdf")
flightDelayData<-RxXdfData(flightDelayDataFile)
testData<-rxDataStep(flightDelayData, numRows = 50000)

result <- pemaCompute(pemaObj = pemaFlightDelaysObj, data=testData, originCode="ABE", destinationCode="PIT", airlineCode="US")
print(result)

print(pemaFlightDelaysObj$delayTimes)
print(pemaFlightDelaysObj$totalDelays)
print(pemaFlightDelaysObj$totalFlights)
print(pemaFlightDelaysObj$origin)
print(pemaFlightDelaysObj$dest)
print(pemaFlightDelaysObj$airline)

flightDelayDataSubsetFile<-("\\\\LON-RSVR\\Data\\FlightDelayDataSubset.xdf")
testData2<-rxDataStep(flightDelayData, flightDelayDataSubsetFile, overwrite = TRUE, numRows = 50000, rowsPerRead = 5000)

result <- pemaCompute(pemaObj = pemaFlightDelaysObj, data=testData2, originCode="ABE", destinationCode="PIT", airlineCode = "US")
print(result)

reslut <- pemaCompute(pemaObj = pemaFlightDelaysObj, data=flightDelayData, originCode="LAX",destinationCode="JFK",airlineCode="DL")
print(result)
