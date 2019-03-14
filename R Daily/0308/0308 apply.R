# paste(rep("#", times=5),collapse="")
# scala, java -> jvm
# apply -> matrix
# apply(X, margin, FUN)
m_data <- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3, ncol=3)
m_data
apply(m_data, 1, sum) # margin = 1(row), 2(col)
apply(m_data, 2, sum)
apply(m_data, 2, mean)

# lapply
# lapply(X, FUN)

tmp_data <- c("a","b","c","d")
lapply(tmp_data, toupper)

tmp_data2 <- list(a=1:10, b=1:20)
tmp_data2
lapply(tmp_data2, mean)

# sapply
# sapply(X, FUN)
sapply(tmp_data2, mean)

# mapply
# mapply(FUN, X....)
tmp_data3 <- list(a=1:10, b=1:20)
tmp_data4 <- list(a=2:10, b=2:20)
mapply(sum, tmp_data3, tmp_data4)

tmp_data3 <- list(a=1:10, b=1:20)
tmp_data3

testfunc <- function(x){
  (min(x)+max(x))/2
}
tmp_data3

tmp_data4 <- sapply(tmp_data3, testfunc)
tmp_data4

# tapply
head(warpbreaks)
str(warpbreaks)
View(warpbreaks)

with(warpbreaks, tapply(breaks, list(wool, tension),mean))

data(iris)
View(iris)
tapply(iris$Sepal.Width, iris$Species, mean)