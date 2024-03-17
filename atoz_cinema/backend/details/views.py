from .core import Top250 
# Create your views here.
from rest_framework.decorators import api_view
from rest_framework.response import Response
  

@api_view(["GET"]) 
def top250movies(request):
    if request.method == "GET":
        model = Top250()
        print("server start")
        result = model.TvShowsMovies("https://www.imdb.com/chart/top/") 
        print("server end ")
        return Response(result)
@api_view(["GET"]) 
def top250tvshows(request):
    if request.method == "GET":
        model = Top250()
        print("server start")
        result = model.TvShowsMovies("https://www.imdb.com/chart/toptv/") 
        print("server end ")
        return Response(result)
