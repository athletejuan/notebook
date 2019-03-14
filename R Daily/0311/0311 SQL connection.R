install.packages('RMySQL')
library(RMySQL)
mysqlconnection = dbConnect(MySQL(), dbname = 'employees', user = 'hadoop', password = 'Pa$$w0rd123', host = '192.168.137.100')
dbListTables(mysqlconnection)
result <- dbGetQuery(mysqlconnection, "SELECT * FROM employees")
result
class(result)
str(result)
dim(result)
result$gender
library(ggplot2)
qplot(result$gender)
head(result)
colnames(result)

result2<-dbGetQuery(mysqlconnection, "SELECT * FROM departments")
result2
result3<-dbGetQuery(mysqlconnection, "SELECT * FROM salaries")
result3
