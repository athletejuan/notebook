rxOptions(reportProgress = 1)
flightDelayDataSubsetFile<-"\\\\LON-RSVR\\Data\\flightDelayDataSubset.xdf"
flightDelayDataSubset<-rxDataStep(inData=mergedFlightDelayData, outFile = flightDelayDataSubsetFile, overwrite = TRUE, rowSelection = rbinom(.rxNumRows, size = 1, prob = 0.005))

rxGetInfo(flightDelayDataSubset, getBlockSizes=TRUE)

install.packages("lubridate")

standardizeTimes<-function(dataList){if(.rxIsTestChunk){return(dataList)}
  departureTimeVarIndex<-length(dataList)+1
  dataList[[departureTimeVarIndex]]<-rep(as.numeric(NA),times=.rxNumRows)
  names(dataList)[departureTimeVarIndex]<-"StandardizedDepartureTime"
  arrivalTimeVarIndex<-length(dataList)+1
  dataList[[arrivalTimeVarIndex]]<-rep(as.numeric(NA),times=.rxNumRows)
  names(dataList)[arrivalTimeVarIndex]<-"StandardizedArrivalTime"
  departureYearVarIndex<-1
  departureMonthVarIndex<-2
  departureDayVarIndex<-3
  departureTimeVarIndex<-4
  elapsedTimeVarIndex<-5
  departureTimezoneVarIndex<-6
  for(i in 1:.rxNumRows){
    departureYear<-dataList[[departureYearVarIndex]][i]
    departureMonth<-dataList[[departureMonthVarIndex]][i]
    departureDay<-dataList[[departureDayVarIndex]][i]
    departureHour<-trunc(as.numeric(dataList[[departureTimeStringVarIndex]][i])/100)
    departureMinute<-as.numeric(dataList[[departureTimeStringVarIndex]][i] %%100)
    departureTimeZone<-dataList[[departureTimeZoneVarIndex]][i]
    departureDateTimeString<-paste(departureYear,"-",departureMonth,"-",departureDay," ",departureHour,":",departureMinute,sep="")
    departureDateTime<-as.POSIXct(departureDateTimeString,tz=departureTimeZone)
    standardizedDepartureDateTime<-format(departureDateTime,tz="UTC")
    dataList[[departureTimeVarIndex]][i]<-standardizedDepartureDateTime
    elapsedTime=dataList[[5]][i]
    standardizedArrivalDateTime<-format(as.POSIXct(standardizedDepartureDateTime)+minutes(elapsedTime))
    dataList[[arrivalTimeVarIndex]][i]<-standardizedArrivalDateTime}
  return(dataList)}

flightDelayDataTimeZoneFile<-"\\\\LON-RSVR\\Data\\flightDelayDataTimeZones.xdf"
flightDelayDataTimeZones<-rxDataStep(inData=flightDelayDataSubset, outFile=flightDelayDataTimeZonesFile, overwrite=TRUE,
                                     transformFunc=standardizeTimes, transformVars=c("Year","Month","DayofMonth","DepTime","ActualElapsedTime","OriginTimeZone"),transformPackages=c("lubridate"))

rxGetVarInfo(flightDelayDataTimeZones)
head(flightDelayDataTimeZones)
tail(flightDelayDataTimeZones)