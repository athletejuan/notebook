remoteLogin("http://LON-RSVR.ADATUM.COM:12800", session=TRUE, diff = TRUE, commandline=TRUE)
pause()
putLocalObject(c("flightDataColumns"))
resume()
ls()
flightDataSampleXDF <- rxImport(inData="\\\\LON-RSVR\\Data\\2000.csv", outFile="\\\\LON-RSVR\\Data\\Sample.xdf", overwrite=TRUE, append="none", colClasses=flightDataColumns, 
                              transforms=list(Delay=ArrDelay+DepDelay+ifelse(is.na(CarrierDelay),0, CarrierDelay) + ifelse(is.na(WeatherDelay), 0, WeatherDelay)+ifelse(is.na(NASDelay),0,NASDelay)+ifelse(is.na(SecurityDelay),0, SecurityDelay)+ifelse(is.na(LateAircraftDelay),0,LateAircraftDelay), MonthName=factor(month.name[as.numeric(Month)], levels=month.name)), 
                                              rowSelection = (Cancelled==0), varsToDrop=c("FlightNum","TailNum","CancellationCode"),numRows=1000)
head(flightDataSampleXDF, 100)
rxOptions(reportProgress = 1)
delayXdf <- "\\\\LON-RSVR\\Data\\FlightDelayData.xdf"
flightDataCsvFolder <- "\\\\LON-RSVR\\Data\\"
flightDataXDF <- rxImport(inData=flightDataCsvFolder, outFile = delayXdf, overwrite = TRUE, append = ifelse(file.exists(delayXdf),"rows","none"), colClasses = flightDataColumns, transforms = list(
  Delay=ArrDelay+DepDelay+ifelse(is.na(CarrierDelay),0,CarrierDelay)+ifelse(is.na(WeatherDelay),0,WeatherDelay)+ifelse(is.na(NASDelay),0,NASDelay)+ifelse(is.na(SecurityDelay),0,SecurityDelay) + ifelse(is.na(LateAircraftDelay),0,LateAircraftDelay),
  MonthName=factor(month.name[as.numeric(Month)],levels=month.name)),rowSelection = (Cancelled==0),varsToDrop = c("FlightNum","TailNum","CancellationCode"),rowsPerRead = 500000)
exit