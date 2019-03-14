# if
a <- 10L
class(a)
if(is.integer(a)){
  print("a is integer")
}

t_name <- "Tom"
if(t_name == "Tom"){
  print("t_name is Tom")
}
# if else
# %in%
tmp_data <- c("Who","are","you")
tmp_data
if("you" %in% tmp_data){
  print("you exist")
} else if("are" %in% tmp_data){
  print("are exist")
} else{
  print("Not Exist")
}

# switch
s <- switch(3, "one","two","three")
print(s)

tmp_data2 <- c(4,5,6,7)
tmp_data3 <- ifelse(tmp_data2 %% 2 == 0, "even", "odd")
tmp_data3

# repeat loop
tmp_data4 <- c("hi","hello")
count<-2

repeat {
  print(tmp_data4)
  count <- count+1
  if(count>5){break}
}

x<-1
repeat{
  print(x)
  x=x+1
  if(x==10){break}
}
# while loop
count<-1
while(count<10){
  print(tmp_data4)
  count=count+1
  if(count == 5){break}
}

# for loop
tmp_data5 <- 1:10
for(i in tmp_data5){
  print(i)
}

for(j in LETTERS[1:10]){
  print(j)
  if(j=="E"){
    break
  }
}

# - break, next
tmp_data6 <- letters[1:10]
tmp_data6
for(i in tmp_data6){
  if(i=="d"){
    next
  }
  print(i)
}

for(i in 2:9){
  for(j in 1:9){
    msg<-c(i,"x",j,"=",i*j)
    print(paste(msg, collapse=""))}}
