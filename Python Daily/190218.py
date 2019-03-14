'''
test1=open("c:\\pythontest\\test.txt","w")
for i in range(10):
    test1.write("%d번째 줄입니다.\n" % i)
test1.close()

print("End")
'''

#test1=open("c:\\pythontest\\test.txt","r+")
'''
#test2=test1.readline()
#print(test2)
#test2=test1.readline()
#print(test2)
while True:
    line=test1.readline()
    if not line: break
    print(line)
test1.close()

print("End")

lines =test1.readlines()
print(lines)
for i in lines:
    print(i, end=" ")
'''
'''
#lines =test1.read(20)
#print(lines)

#Employee
#   name
#   working
#   go home

class Employee:
    
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def testprint(self):
        print("내 이름은 %s, %d 살이지." % (self.name,self.age))

#    def gohome(self):
#        print("%s go home" % self.name)
        
emp1 = Employee("홍길동", 20)
emp1.testprint()
emp2 = Employee("이순신", 24)
emp2.testprint()
emp3 = Employee("강감찬", 26)
emp3.testprint()

class Employee:
    id=0
    name = ""
    def __init__(self):
        self.id=200
        self.name="이순신"
    def msg(self):
        print("ID: %d, name: %s" % (self.id, self.name))

emp2=Employee()
emp2.msg()

class Employee3:
    id=0
    name = ""
    def __init__(self, id=0, name=""):
        self.id=id
        self.name=name
    def msg(self):
        print("ID: %d, name: %s" % (self.id, self.name))

emp3=Employee3(300, "강감찬")
emp3.msg()
emp4=Employee3(400, "권율")
emp4.msg()
emp5=Employee3()
emp5.msg()
'''
'''
#Inheritance

class Animal:
    def speak(self):
        print("Animal Speaking")

class Dog(Animal):
    def bark(self):
        print("Dog Barking")
#ani - Animal()
#ani.speak()

do = Dog()
do.bark()
do.speak()

#Database Connection Driver
#Oracle, SQL Server, MySQL....

class Database:
    def open(self):
        print("Database Open")

class Oracle(Database):
    def select_oracle(self):
        print("Oracle Select")

class SQLServer(Database):
    def select_sqlserver(self):
        print("SQLServer Select")

db1=Oracle()
db1.open()
db1.select_oracle()

db2=SQLServer()
db2.open()
db2.select_sqlserver();
'''
'''
#파이썬의 경우 오버라이딩은 되지만 오버로딩은 안된다.
#Overloading : 같은 이름의 함수들이 서로다른 매개변수의 유형과 개수를 갖는 것
class Student:
    name = ""
    age=0
    #def __init__(self):
    #    self.name = "이순신"
    def __init__(self,name="이순신"):
        self.name=name
        print(self.name)
    def msg(self, age=20):
        self.age=age
        print(self.age)

stu=Student()
stu.msg()
stu.msg(40)

stu2=Student("강감찬")
stu2.msg()
stu2.msg(60)
'''
'''
#Overriding : 상위 클래스가 가지고 있는 메소드를 하위 클래스가 재정의하는 것
class Animal:
    def speak(self):
        print("Animal Speaking")

class Dog(Animal):
    def speak(self):
        print("Dog Speaking")
    def barking(self):
        print("Dog Barking")

do=Dog()
do.speak()
do.barking()
'''
'''
class Point:
    def __init__(self, x=0, y=0):
        self.x=x
        self.y=y

    def __add__(self, point_v):
        return Point(self.x + point_v.x, self.y + point_v.y)

    def msg(self):
        print("x: %d, y: %d" % (self.x, self.y))

p=Point(1,2)
p1=Point(2,3)
#p.__add__(p1)
p2=p+p1
#p.msg()
p2.msg()
'''
#Data abstraction : 안의 데이터를 숨겨주는 것(hide)
#__

class Employee:
    __count=0;

    def __init__(self):
        Employee.__count=Employee.__count +1

    def msg(self):
        print("Emp Count:",Employee.__count)

emp=Employee()
emp.msg()
#emp.__count

#Polymorphism(다형성)
#클래스(객체) 상속 메소드가 동일하고, 재정의한 경우
#같은 이름의 메소드 호출은 다른 특성을 나타낸다.

class Database:
    def open(self):
        print("Database Open()")

class Oracle(Database):
    def open(self): # Override
        print("Oracle Open()")
    def close(self):
        print("Oracle Close()")

class SQLServer(Database):
    def open(self): # Override
        print("SQLServer Open()")

databases = [Oracle(), SQLServer()]
for db in databases:
    db.open()

def testdb(db):
    db.open()

db2=Oracle() #Oracle Object
db3=SQLServer() #SQLServer Object
