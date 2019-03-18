remoteLogin(deployr_endpoint = "http://LON-RSVR.ADATUM.COM:12800", session = TRUE, diff = TRUE, commandline = TRUE, username = "admin", password = "Pa55w.rd")

runif(1)
rnorm(1)
hist(rnorm(100, mean=0, sd=1))

g <- function(){
  3+runif(1)+rnorm(1)}
g()
i<-0
while(i<=10){g()
  i<-i+1}

#y2<-rxExec(FUN=g, timesToRun = 10)
#y2
system.time(y2<-rxExec(FUN=g, timesToRun = 10))
xs<-runif(10)
xs
rxExec()

library(doRSR)
registerDoRSR()
foreach(i=1:3) %dopar% sqrt(i)
