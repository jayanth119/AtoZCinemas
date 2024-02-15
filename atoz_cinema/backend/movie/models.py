from django.db import models

#Create your models here.
class Movie(models.Model):
    title = models.CharField(max_length=100)
    year = models.IntegerField()
    href =  models.CharField(max_length=100) 
    extract =  models.CharField(max_length=100)
    thumbnail = models.CharField(max_length=100)
    thumbnail_width = models.IntegerField()
    thumbnail_height =  models.IntegerField()
    photo = models.CharField(max_length=100)
    def __str__(self) -> str:
        return self.title 
    