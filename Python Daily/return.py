'''
def Test(s):
    print(s)
    return

def sum(a,b):
    c=a+b
    return c

Test("Fuck")
Test("shit")

d=sum(4,6)
print(d)

def sum(s,t, op):
    u=eval(s+op+t)
    return u

num1 = input("Number 1: ")
num2 = input("Number 2: ")
op = input("operator: ")
result = sum(num1, num2, op)
print(result)
'''
def testfunc(mylist):
    print(mylist)
    b=[]
    for i in mylist:
        b.append(i*2)
    return b
a=[1,2,3]
b=testfunc(a)
testfunc(b)
