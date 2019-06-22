from django.urls import path
from . import views

app_name = 'bs'

urlpatterns = [
    path('', views.intro, name='intro'),
    path('new/', views.new, name='new'),
    path('<int:history_pk>/', views.detail, name='detail'),
    path('<int:history_pk>/edit/', views.update, name='update'),
    path('<int:history_pk>/delete/', views.delete, name='delete'),

]