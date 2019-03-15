setwd("E:\\Labfiles\\Lab03")
flightDelayDataXdf <- "FlightDelayData.xdf"
flightDelayData <- RxXdfData(flightDelayDataXdf)
rxOptions(reportProgress = 1)
delayPlotData <- rxImport(flightDelayData, rowsPerRead = 1000000, 
                          varsToKeep = c("Distance","Delay","Origin","Originstate"),
                          rowSelection = (Distance>0)&as.logical(rbinom(n=.rxNumRows, size=1, prob=0.02)))
library(tidyverse)
ggplot(data=delayPlotData)+geom_point(mapping = aes(x=Distance, y=Delay))+
  xlab("Distance (miles)")+ ylab("minutes)")
delayPlotData %>%
  filter(!is.na(Delay)&(Delay >=0)&(Delay<=1000)) %>%
  ggplot(mapping=aes(x=Distance, y=Delay)) +
  xlab("Distance (miles)")+ylab("Delay(minutes)")+geom_point(alpha=1/50)+geom_smooth(color="red")
delayPlotData %>%
  filter(!is.na(Delay)&(Delay >=0)&(Delay<=1000)) %>%
  ggplot(mapping=aes(x=Distance, y=Delay)) +
  xlab("Distance (miles)")+ylab("Delay(minutes)")+geom_point(alpha=1/50)+geom_smooth(color="red")+theme(axis.text=element_text(size=6)) + facet_wrap( ~ OriginState, nrow = 8)
