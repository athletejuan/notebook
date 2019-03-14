# cancer.csv
# 연령대별로 암 발생률 그래프출력

df<-read.csv("cancer.csv")
head(df)

tmp_data <- data.frame(age <- df$age)

# cut function
# (1:11)*10
age_data<-table(cut(tmp_data$age, breaks=(1:11)*10))
qplot(age_data, bins=10)
age_data
class(age_data)
rownames(age_data)<-c("10s","20s","30s","40s","50s","60s","70s","80","90s","100s")
age_data
qplot(age_data)
hist(age_data)

checkAge <- function(age)
  age<-""{if(age >0 & age <10){age="10s"} else if(age>=10 & age<20){age="20s"} else{age="old"}return(age)}
tmp_data3<-checkAge(tmp_data$age)
tmp_data3

# coffee.csv 2000년도 이후 폐업된 매장 목록
df2<-read.csv("coffee.csv")
View(df2)
closure<-data.frame(cls <- df2$dateOfclosure)
class(closure)
head(closure)
coffeecls<-closure$cls>20000101
table(coffeecls)

df[which(df2$stateOfbusiness == "폐업 등" & df2$yearOfStart > 2000),]

# 전국 연도별 커피숍 개업건수
open<-data.frame(year<-df2$yearOfStart)
table(open)
qplot(open$Var1, open$Freq)

# 전국 연도별 커피숍 폐업건수
date<-table(df[which(year<-df2$dateOfclosure)])
yr<-date$year
yr
quit<-data.frame(if (yr >=19920101 & yr<19930101){1992} else if (yr>=19930101 & 19940101){1993} else if (yr>=19940101 & 19950101){1994} else if (yr>=19950101 & 19960101){1995}else if (yr>=19960101 & 19970101){1996}
  else if (yr>=19970101 & 19840101){1997}else if (yr>=19980101 & 19990101){1998}else if (yr>=19990101 & 20000101){1999}else if (yr>=20000101 & 20010101){2000}else if (yr>=20010101 & 20020101){2001}else if (yr>=20020101 & 20030101){2002}
  else if (yr>=20030101 & 20040101){2003}else if (yr>=20040101 & 20050101){2004}else if (yr>=20050101 & 20060101){2005}else if (yr>=20060101 & 20070101){2006}else{2007})
#class(quit$year)
table(quit$yr)

# solution(???)
df3 <- table(df[which(df$stateOfbusiness == "폐업 등"),15])
class(df3)
df3_1 <- as.data.frame(df3)
df3_1
qplot(df3_1$Var1, df3_1$Freq)
