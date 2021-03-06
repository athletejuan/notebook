sampleDataDir <- rxGetOption("sampleDataDir")
getwd()
list.files(sampleDataDir)
airSource <- file.path(sampleDataDir, "AirlineDemoSmall.csv")
airSource
airData <- rxImport(inData = airSource)
class(airData)
str(airData)
colnames(airData)
dim(airData)
workFolder <- file.path(getwd(), "test.xdf")
workFolder

airData2 <- rxImport(inData = airSource,
                     outFile = workFolder,
                     overwrite = TRUE)
airData3 <- rxImport(inData = workFolder,
                     rowsPerRead = 200000,
                     stringsAsFactors = TRUE)
airData3
rxGetInfo(airData3, 
          getVarInfo = TRUE)
list.files(rxGetOption("sampleDataDir"))

airSource <- file.path(sampleDataDir, "AirlineDemoSmall.xdf")
airSource
df <- rxImport(inData = airSource)
colnames(df)
df$ArrDelay