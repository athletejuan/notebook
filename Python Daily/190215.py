'''
num = int(input("Number: "))
if num%2 == 0:
    print("짝수입니다.")
else:
    print("홀수입니다.")

a=int(input("Number 1: "))
b=int(input("Number 2: "))
c=int(input("Number 3: "))
if a>b and a>c:
    print("a is largest number")
if b>a and b>c:
    print("b is largest number")
if c>a and c>b:
    print("c is largest number")

num = int(input("Number :"))
if num == 10:
    print("num is equal to 10")
elif num ==50:
    print("num is equal to 50")
elif num == 100:
    print("num is equal to 100")
else:
    print("num is etc")

#while
i=0
while i < 100:
    print(i)
    i=i+1

print("End")

j=1
num=0

num = int(input("Number: "))
while j<=10:
    print("%d X %d = %d" % (num, j, num*j))
    j=j+1

#for
for i in [1,2,3]:
    print(i)
for j in (1,2,3):
    print(j)
for k in "123":
    print(k)
for s in range(0,10,2):
    print(s)

num = int(input("Number: "))
for i in range(1,10):
    print("%d x %d = %d" % (num, i, num*i))

print("End")

i,j = 0,0
num = int(input("Number: "))
for i in range(0,num):
    print()
    for j in range(0,i+j):
        print("*", end="")

i=10
if i%2 ==0:
    pass
else:
    print("odd")
'''
'''
#function ==> swap

def msgfunc():
    print("Test Print")

msgfunc()

def msgfunc2():
    print("Test Print2")
    return

a=msgfunc2()
print(a)

def msgfunc3():
    print("Test Print3")
    return 10

a1=msgfunc3()
print(a1)

def testSum(a,b):
    return(a+b)

a,b = 1,-1
c=testSum(a,b)
if c:
    print("True")
else:
    print("False")

def testfunc5(*a):
    print(a)
    print(type(a))

testfunc5(1,2,3)

def testfunc6(test):
    print(test)
test1 = [1,2,3]
testfunc6(test1)
print(type(test1))

def sum_mul(a,b):
    return(a+b, a*b)

result = sum_mul(1,2)
print(type(result))
print(result)

def say_myself(name,old,man=True):
    print("My name is %s" % name)
    print("I'm %d years old" % old)
    if man:
        print("I'm a boy")
    else:
        print("you're a girl")

say_myself("SeungHwan", 36)
say_myself("SeungHwan", 36, True)

def testfunc7(test):
    test[2] =4
    return test

test2=[1,2,3]
testfunc7(test2)
print(test2)

test = [1,2,3]
print(test)
test[1] = 4
print(test)

total = 0
def sum(a,b):
    total=a+b
    print("inner total: ",total)
    return total

sum(10,20)
print("outer total: ", total)

def calc(*args):
    sum=0
    for arg in args:
        sum=sum+arg
    print("Sum: ",sum)
calc(1,2,3,4,5,6,7,8,9,10)
sum=0
print(sum)
'''
c=lambda a,b : a+b
print(c(1,2))

