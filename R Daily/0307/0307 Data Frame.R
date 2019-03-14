data <- c('east','west','east','west','north','east')
data
class(data)
is.factor(data)
f_data <- factor(data)
f_data
is.factor(f_data)

# Data Frame
height <- c('160','170','180','173')
weight <- c(48, 73, 90, 56)
gender <- c('male','female','male','female')
df <- data.frame(height, weight, gender, stringsAsFactors = FALSE)
#colnames(df) <- c('')
#df$gender
class(df)
is.factor(df$gender)
df$gender
is.factor(df$height)
df$height

# Factor Levels
f_data2 <- gl(3,4, labels=c('seoul','tokyo','beijing'))
f_data2

# Data import
df2 <- read.csv("seoul.csv", fileEncoding = 'utf-8', header=TRUE, sep=',', stringsAsFactors = FALSE)
#View(df2)
#str(df2$날짜)
class(df2)
df2

emp_data <- data.frame(emp_id=c(1:3),emp_name=c('홍길동','이순신','강감찬'), salary=c(100,200,300),start_data=c('2018-10-10','2018-10-12','2018-10-12'), stringAsFactors=FALSE)
summary(emp_data)
emp_data