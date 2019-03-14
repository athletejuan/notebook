#dplyr, ggplot2, purrr, ... => tidyverse
install.packages("tidyverse")
library(dplyr)
df <- read.csv("csv_exam.csv")
View(df)
df[which(df$class==1),]

# %>%
df %>% filter(class==1)
df %>% filter(class==2)
df %>% filter(math > 50)
df %>% filter(class==1 | math > 50)
df2 <- df %>% filter(class==1 | math > 50)
class(df2)
mean(df2$math)
median(df2$math)
max(df2$english)

# class 1,2
df %>% filter(math>30 | class==2)
df %>% filter(class %in% c(1,2))
df %>% select(math, english)
df %>% select(-math)

df %>% select(math, english) %>% filter(math > 50)

library(ggplot2)
class(mpg)
df4<-ggplot2::mpg
df5<-as.data.frame(df4)

df6<-df5 %>% select(class, cty)
df5%>%arrange(class, cty)
str(df5)
df5 %>% arrange(desc(class))
df5 %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)

df6 <- df5 %>% mutate(total= (hwy+cty)/2) %>% head
str(df6)

df7 <- df5 %>% mutate(total= (hwy+cty)/2, mean=hwy)
head(df7)

tmp_data<-as.data.frame(mpg)
tmp_data %>% filter(displ<=4)
str(tmp_data)

# 요약하기
df5 %>% summarise(hwy_mean = mean(hwy))
df5 %>% group_by(class) %>% summarise(class_mean=mean(hwy), class_max=max(hwy), class_min=min(hwy))
df5 %>% group_by(class) %>% summarise(count=n())

# mean() 평균
# sd() 표준편차
# sum() 합계
# median() 중앙값
# min() 최소값
# max() 최대값
# n() 빈도

mpg

# mpg 회사별 "SUV"자동차의 도시 및 고속도로 통합연비 평균의 1위부터 5위를 내림차순으로 정렬
mpg<-ggplot2::mpg
mpg %>% group_by(manufacturer) %>% filter(class=="suv") %>% mutate(total_tmp=(cty+hwy)/2) %>% summarise(total_mean=mean(total_tmp)) %>% arrange(desc(total_mean)) %>% head(5)