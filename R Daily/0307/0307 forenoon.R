# vector object
# Logical
v1 <- TRUE
print(class(v1))
# Numeric
v2 <- 12.5
print(class(v2))
# Integer
v3 <- 2L
print(class(v3))
# Complex
v4 <- 2+3i
print(class(v4))
# Charactor
v5 <- "Hi"
print(class(v5))
# Raw
v6 <- charToRaw("Test")
print(class(v6))

# 데이터 타입
# vectors
# lists
# Matrices
# Arrays
# factor
# Data Frames

# vector
apple <- c("red","yellow","green")

# vectors
a <- c(1,2,3,4)
class(a)

list1 <- list(c(1,2,3),c(4,5,6), sin)
list1
list2 <- list(1,2)
list2

# matrices
m <-matrix(c('a','a','b','c','a','a'),nrow=2, ncol=3)
m

# arrays
arr <- array(c('yellow','red'), dim=c(3,3,2))
arr

# factors
apple_colors<-c('green','yellow','red','red','green','green','red')
apple_colors
factor_apple<-factor(apple_colors)
print(factor_apple)
print(nlevels(factor_apple))

# Data Frames
test_data<-data.frame(gender = c('Male','Female','Male'), height = c(170,165,180), weight = c(80,46,78), age=c(40,35,25))
test_data