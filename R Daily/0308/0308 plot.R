# Python Matplotlib
# R ggplot2

#install.packages("ggplot2")
library(ggplot2)

data <- c("a","b","a","c","d")
data

qplot(data)
#View(mpg)
class(mpg)
str(mpg)
dim(mpg)
colnames(mpg)
rownames(mpg)

qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)
qplot(data=mpg, x=drv, y=hwy)
qplot(data=mpg, x=drv, y=hwy, geom="line")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", colour=drv)
qplot()

english <- c(80,85,60,75)
math <- c(65,80,95,75)
class<-c(1,2,1,2)

df <- data.frame(english, math, class)
df
mean(df$english)
mean(df$math)
mean(df$class)

# 제품 가격 판매량
# 사과 2000  20
# 배   1500  30
# 딸기 2000  40
# 수박 9000  20

fruit<-c('사과', '배', '딸기', '수박')
price<-c(2000, 1500, 2000, 9000)
qty<-c(20,30,40,20)

df2<-data.frame(fruit, price, qty)
df2

mean(df2$price)
median(df2$qty)
summary(df2)
write.csv(df2, file="test_data.csv")
save(df2, file="df2_data.rda")
load("df2_data.rda")

df3 <- read.csv("csv_exam.csv", stringsAsFactors = FALSE)
df3
class(df3)
str(df3)

# head(), tail(), View()
# dim(), str(), summary()
head(df3,10)
tail(df3)
dim(df3)
str(df3)
summary(df3)

install.packages("dplyr")
library(dplyr)
library(ggplot2)
class(mpg)
df3 <- as.data.frame(mpg)
class(df3)
df3$manufacturer
head(df3[,1:3])
head(df3,3)
df3$sum_test<-df3$hwy
head(df3)
colnames(df3)
df3$sum_test
qplot(df3$sum_test)
hist(df3$sum_test)