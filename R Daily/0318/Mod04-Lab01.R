remoteLogin(deployr_endpoint = "http://LON-RSVR.ADATUM.COM:12800", session = TRUE, diff = TRUE, commandline = TRUE, username = "admin", password = "Pa55w.rd")

airportData=RxXdfData("\\\\LON-RSVR\\Data\\airportData.xdf")
flightDelayData = RxXdfData("\\\\LON-RSVR\\Data\\flightDelayData.xdf")
iataFactor<-rxGetVarInfo(airportData, varsToKeep = c("iata"))
print(iataFactor)
originFactor<-rxGetVarInfo(flightDelayData, varsToKeep = c("Origin"))
print(originFactor)
destFactor<-rxGetVarInfo(flightDelayData, varsToKeep = c("Dest"))
print(destFactor)

refactorLevels<-unique(c(iataFactor$iata[["levels"]], originFactor$Origin[["levels"]],destFactor$Dest[["levels"]]))

rxOptions(reportProgress = 2)
refactoredAirportDataFile<-"\\\\LON-RSVR\\Data\\RefactoredAirportData.xdf"
refactoredAirportData<-rxFactors(inData=airportData, outFile = refactoredAirportDataFile, overwrite = TRUE, factorInfo = list(iata=list(newLevels=refactorLevels)))

refactoredFlightDelayDataFile<-"\\\\LON-RSVR\\Data\\RefactoredFlightDelayData.xdf"
refactoredFlightDelayData<-rxFactors(inData=flightDelayData, outFile = refactoredFlightDelayDataFile, overwrite = TRUE, factorInfo = list(Origin=list(newLevels=refactorLevels),Dest=list(newLevels=refactorLevels)))

iataFactor<-rxGetVarInfo(refactoredAirportData, varsToKeep=c("iata"))
print(iataFactor)
originFactor<-rxGetVarInfo(refactoredFlightDelayData, varsToKeep = c("Origin"))
print(originFactor)
destFactor<-rxGetVarInfo(refactoredFlightDelayData, varsToKeep = c("Dest"))
print(destFactor)

names(refactoredAirportData)[[1]]<-"Origin"

reblockedAirportDataFile<-"\\\\LON-RSVR\\Data\\reblockedAirportData.xdf"
reblockedAirportData<-rxDataStep(refactoredAirportData, reblockedAirportDataFile, overwrite = TRUE)

mergedFlightDelayDataFile<-"\\\\LON-RSVR\\Data\\mergedFlightDelayData.xdf"
mergedFlightDelayData<-rxMerge(inData1 = refactoredFlightDelayData, inData2 = reblockedAirportData, outFile = mergedFlightDelayDataFile, overwrite = TRUE, type = "inner",matchVars = c("Origin"), autoSort = TRUE,
                               varsToKeep2 = c("timezone","Origin"),newVarNames2 = c(timezone="OriginTimeZone"),rowsPerOutputBlock = 500000)

rxGetVarInfo(mergedFlightDelayData)
head(mergedFlightDelayData)
tail(mergedFlightDelayData)