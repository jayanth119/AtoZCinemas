# import serializer from rest_framework
from rest_framework import serializers

# import model from models.py
from .models import Movie

# Create a model serializer
class MovieSerializer(serializers.Serializer):
	# specify model and fields
	class Meta:
		model = Movie
		fields = ('title', 'year' , 'photo')
