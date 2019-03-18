getwd()
setwd("E:\\Demofiles\\Mod04")
getwd()
rxGetInfo("FlightDelayData.xdf", getBlockSizes = TRUE)
rxDataStep(inData="FlightDelayData.xdf", outFile = "FlightDelayDataMetric.xdf", rowsPerRead = 50000, transforms = list(Distance=Distance*1.6))
milesToKm <- 1.6
rxDataStep(inData="FlightDelayData.xdf", outFile="FlightDelayDataMetric.xdf", rowsPerRead = 50000, transforms = list(Distance=Distance*conversionFactor), transformObjects = list(conversionFactor=milesToKm)
           