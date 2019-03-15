setwd("E:\\Labfiles\\Lab02")
flightDataSamplecsv<- "2000.csv"
flightDataSample<-rxImport(flightDataSamplecsv, numRows = 10)
rxGetVarInfo(flightDataSample)
flightDataColumns<-c("Year"="factor","DayofMonth"="factor","DayofWeek"="factor","UniqueCarrier"="factor","Origin"="factor","Dest"="factor","CancellationCode"="factor")
flightDataXdf<-"2000.xdf"
rxOptions(reportProgress = 1)
flightDataSampleXDF<-rxImport(inData=flightDataSamplecsv, outFile = flightDataXdf, overwrite = TRUE, append="none",colClasses = flightDataColumns)
rxGetVarInfo(flightDataXdf)

system.time(csvDelaySummary<-rxSummary(~.,flightDataSamplecsv))
system.time(xdfDelaySummary<-rxSummary(~.,flightDataSampleXDF))
print(csvDelaySummary)
print(xdfDelaySummary)
system.time(csvCrossTabInfo<-rxCrossTabs(~as.factor(Month):as.factor(Cancelled ==1), flightDataSamplecsv))
system.time(xdfCrossTabInfo<-rxCrossTabs(~as.factor(Month):as.factor(Cancelled ==1), flightDataSampleXDF))
system.time(csvCubeInfo<-rxCube(~as.factor(Month):as.factor(Cancelled ==1), flightDataSamplecsv))
system.time(xdfCubeInfo<-rxCube(~as.factor(Month):as.factor(Cancelled ==1), flightDataSampleXDF))
rm(flightDataSample, flightDataSampleXdf, csvDelaySummary, xdfDelaySummary, csvCrossTabInfo, xdfCrossTabInfo, xdfCubeInfo, csvCubeInfo)
