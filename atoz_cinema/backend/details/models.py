from django.db import models

# Create your models here.
class Movies250(models.Model):
    name = models.CharField(max_length = 150)
    url  = models.URLField(max_length = 150)
    def __str__(self) -> str:
        return self.name 
    @classmethod
    def savemodel(cls, details):
        existing_movie = cls.objects.filter(name=details['Name']).first()
        if existing_movie:
            return existing_movie  # Movie with the same title already exists
        else:
            movie = cls.objects.create(
                name=details['Name'],
                url=details['Image_URL'],
            )
            return movie

class Tvshows250(models.Model):
    name = models.CharField(max_length = 150)
    url  = models.URLField(max_length = 150)
    def __str__(self) -> str:
        return self.name 
    @classmethod
    def savemodel(cls, details):
        existing_movie = cls.objects.filter(name=details['Name']).first()
        if existing_movie:
            return existing_movie  # Movie with the same title already exists
        else:
            movie = cls.objects.create(
                name=details['Name'],
                url=details['Image_URL'],
            )
            return movie