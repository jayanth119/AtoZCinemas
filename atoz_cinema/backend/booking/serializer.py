from rest_framework import serializers
from .models import Movie, Cast, Review , Top2024Movies, soom 
class CastSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cast
        fields = ['name', 'image_url']

class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = ['name', 'review', 'rating']

class BookingMovieSerializer(serializers.ModelSerializer):
    cast = CastSerializer(many=True, read_only=True)
    reviews = ReviewSerializer(many=True, read_only=True)

    class Meta:
        model = Movie
        fields = ['title', 'image_url', 'imdb_link', 'rating', 'description', 'director', 'release', 'genres', 'cast', 'reviews']
class Top2024MovieSerializer(serializers.Serializer):
    cast = CastSerializer(many=True , read_only = True )
    review = ReviewSerializer(many=True , read_only=True)
    class Meta:
        model = Top2024Movies 
        fields = ['title', 'image_url', 'imdb_link', 'rating', 'description', 'director', 'release', 'genres', 'cast', 'reviews']

class CommingSoonSerializer(serializers.Serializer):
    cast = CastSerializer(many=True , read_only = True) 
    class Meta : 
        model = soom
        fields = ['title', 'image_url', 'imdb_link', 'rating', 'description', 'director', 'release', 'genres', 'cast']


