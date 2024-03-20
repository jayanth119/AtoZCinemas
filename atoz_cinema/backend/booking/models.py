from django.db import models

class Cast(models.Model):
    name = models.CharField(max_length=100)
    image_url = models.URLField()
    def __str__(self) -> str:
        return  self.name 

class Review(models.Model):
    name = models.CharField(max_length=100)
    review = models.TextField()
    rating = models.DecimalField(max_digits=3, decimal_places=1)
    def __str__(self) -> str:
        return  self.name 

class Movie(models.Model):
    title = models.CharField(max_length=255)
    image_url = models.URLField()
    imdb_link = models.URLField()
    rating = models.DecimalField(max_digits=3, decimal_places=1)
    description = models.TextField()
    director = models.CharField(max_length=100, blank=True, null=True)
    release = models.CharField(max_length=100, blank=True, null=True)
    genres = models.JSONField()
    cast = models.ManyToManyField(Cast)
    reviews = models.ManyToManyField(Review)
    def __str__(self) -> str:
        return self.title 

    @classmethod
    def save_movie_details(cls, movie_data):
        existing_movie = cls.objects.filter(title=movie_data['Title']).first()
        if existing_movie:
            return existing_movie  # Movie with the same title already exists
        else:
            movie = cls.objects.create(
                title=movie_data['Title'],
                image_url=movie_data['Image'],
                imdb_link=movie_data['IMDb_link'],
                rating=float(movie_data['Rating']),
                description=movie_data['Description'],
                director=movie_data['Director'],
                release=movie_data['Release'],
                genres=movie_data['Genres']
            )
            # Save cast members
            for cast_name, cast_image_url in movie_data['Cast'].items():
                cast, created = Cast.objects.get_or_create(name=cast_name, image_url=cast_image_url)
                movie.cast.add(cast)
            # Save reviews
            for review_data in movie_data['Reviews']:
                review = Review.objects.create(
                    name=review_data['name'],
                    review=review_data['review'],
                    rating=float(review_data['rating'])
                )
                movie.reviews.add(review)
            return movie
class Top2024Movies(models.Model):
    title = models.CharField(max_length=255)
    image_url = models.URLField()
    imdb_link = models.URLField()
    rating = models.DecimalField(max_digits=3, decimal_places=1)
    description = models.TextField()
    director = models.CharField(max_length=100, blank=True, null=True)
    release = models.CharField(max_length=100, blank=True, null=True)
    genres = models.JSONField()
    cast = models.ManyToManyField(Cast)
    reviews = models.ManyToManyField(Review)
    def __str__(self) -> str:
        return self.title 

    @classmethod
    def save_movie_details(cls, movie_data):
        existing_movie = cls.objects.filter(title=movie_data['Title']).first()
        if existing_movie:
            return existing_movie  # Movie with the same title already exists
        else:
            movie = cls.objects.create(
                title=movie_data['Title'],
                image_url=movie_data['Image'],
                imdb_link=movie_data['IMDb_link'],
                rating=float(movie_data['Rating']),
                description=movie_data['Description'],
                director=movie_data['Director'],
                release=movie_data['Release'],
                genres=movie_data['Genres']
            )
            # Save cast members
            for cast_name, cast_image_url in movie_data['Cast'].items():
                cast, created = Cast.objects.get_or_create(name=cast_name, image_url=cast_image_url)
                movie.cast.add(cast)
            # Save reviews
            for review_data in movie_data['Reviews']:
                review = Review.objects.create(
                    name=review_data['name'],
                    review=review_data['review'],
                    rating=float(review_data['rating'])
                )
                movie.reviews.add(review)
            return movie


class soom(models.Model):
    title = models.CharField(max_length=255)
    image_url = models.URLField()
    imdb_link = models.URLField()
    rating = models.DecimalField(max_digits=3, decimal_places=1)
    description = models.TextField()
    director = models.CharField(max_length=100, blank=True, null=True)
    release = models.CharField(max_length=100, blank=True, null=True)
    genres = models.JSONField()
    cast = models.ManyToManyField(Cast)
    reviews = models.ManyToManyField(Review)
    def __str__(self) -> str:
        return self.title 

    @classmethod
    def save_movie_details(cls, movie_data):
        existing_movie = cls.objects.filter(title=movie_data['Title']).first()
        if existing_movie:
            return existing_movie  # Movie with the same title already exists
        else:
            if movie_data['Rating'] == 'N/A':
                # Set a default rating if it's 'N/A'
                rating_value = -69
            else:
                # Convert the rating to float if it's not 'N/A'
                rating_value = float(movie_data['Rating'])
            movie = cls.objects.create(
                title=movie_data['Title'],
                image_url=movie_data['Image'],
                imdb_link=movie_data['IMDb_link'],  
                    
                rating=rating_value,
                description=movie_data['Description'],
                director=movie_data['Director'],
                release=movie_data['Release'],
                genres=movie_data['Genres']
            )
            # Save cast members
            for cast_name, cast_image_url in movie_data['Cast'].items():
                cast, created = Cast.objects.get_or_create(name=cast_name, image_url=cast_image_url)
                movie.cast.add(cast)
            return movie
