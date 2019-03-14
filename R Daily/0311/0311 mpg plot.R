# mpg
library(ggplot2)
class(mpg)
data<-as.data.frame(mpg)
class(data)
summary(data)

colnames(data)
install.packages("dplyr")
library(dplyr)
colnames(data)
data<-rename(data, city=cty)
colnames(data)

#통합연비를 구해서 히스토그램으로 출력하시오.
# (cty + hwy) / 2

colnames(data)
data$total <- (data$city+data$hwy)/2
qplot(data$total, binwidth=2, geom="histogram")
hist(data$total)
mean(data$total)

# frequency >= 20 pass, frequency < 20 fail
data$check<-ifelse(data$total >=20, "Pass", "Fail")
data$check
table(data$check)
qplot(data$check)

# 다음의 등급을 정의하여 빈도수를 출력하시오.
# 등급 total 기준
# A 30이상 ~
# B 20이상 ~ 30미만
# C 10이상 ~ 20미만
# D 0이상 ~ 10미만

#data$dist<-if(data$total >= 30){"A"} ifelse(30 > data$total >=20){"B"} ifelse(20>data$total>=10){"C"} else {"D"}

class(mpg)
class(data)
colnames(data)
data$level<-ifelse(data$total >= 30,"A", ifelse(data$total >= 20 & data$total < 30,"B", ifelse(data$total >=10 & data$total < 20,"C","D")))
data$level
qplot(data$level)

test<-function(e){if(total >= 30){level="A"} else if (data$total >= 20 & data$total < 30){level="B"} else if (data$total >= 10 & data$total < 20){level="C"} else{level="D"}return(total)}
data$level<-test(data$total)
qplot(data$level)

#midwest
str(midwest)
class(midwest)
data2 <- as.data.frame(midwest)
View(data2)

# 전체 인구대비 아시아 인구 백분율
head(data2)
data2$ratio<-data2$popasian/data2$poptotal*100
hist(data2$ratio)