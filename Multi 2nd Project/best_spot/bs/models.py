from django.db import models

class BS(models.Model):
    year = models.IntegerField()
    month = models.IntegerField()
    day = models.IntegerField()
    hour = models.IntegerField()
    min = models.IntegerField()
    title = models.CharField(max_length=20)
    member = models.IntegerField()
    weight = models.IntegerField()
    start = models.CharField(max_length=10)
    goal = models.CharField(max_length=10)

    def __str__(self):
        return f'날짜: {self.year}년 {self.month}월 {self.day}일 {self.hour}시 {self.min}분'

class Cost(models.Model):
    cost = models.IntegerField()

    def __str__(self):
        return f'총 결제금액: {self.cost}원'
