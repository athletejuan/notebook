# RevolutionR
# https://packages.revolutionanalytics.com/datasets/

getwd()
rxGetOption("sampleDataDir")
myPath<-file.path(rxGetOption("sampleDataDir"),"AirlineDemoSmall.csv")
df<- rxImport(inData=myPath)
dim(df)
myWorkingPath<-file.path(getwd(),"AirlineSmall.xdf")
df<-rxImport(inData=myPath, outFile = myWorkingPath)

rxGetInfo(df, getVarInfo = TRUE)
rxGetVarInfo(df)

df2<-rxImport(inData=myPath, outFile = myWorkingPath, stringsAsFactors = TRUE, overwrite = TRUE)
rxGetVarInfo(df2)

df3<-rxImport(inData=myPath, outFile = myWorkingPath, colInfo = list(DayOfWeek=list(type="factor")), overwrite = TRUE)
rxGetVarInfo(df3)

nrow(df3)
ncol(df3)
head(df3)

df4<-rxReadXdf(df3, numRows = 1000, startRow = 100000)
nrow(df4)
rxGetVarInfo(df4)
levels(df4$DayOfWeek)
summary(df4)
rxSummary(data=df4, formula = ~.)
rxSummary(data=df3, ~ArrDelay:DayOfWeek)
rxGetVarInfo(df3)

df5<-rxImport(inData=myPath, stringsAsFactors = TRUE)
rxGetVarInfo(df5)
class(df5)
rxHistogram(~ArrDelay, data=df5)
rxHistogram(~DayOfWeek, data=df5)

df6<-rxImport(inData=myPath, stringsAsFactors = FALSE)
rxDataStep(inData = df6, rowSelection = (ArrDelay > 240 & ArrDelay <= 300), varsToKeep = c("ArrDelay","DayOfWeek"))
rxGetVarInfo(df6)
