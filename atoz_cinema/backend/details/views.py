from .core import Top250 
# Create your views here.
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from .models import Movies250 , Tvshows250  

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



# @csrf_exempt
# def save(request):
#     if request.method == "GET":
#         try:
#             print("started")
#             model = Top250()
#             json_data_list = model.TvShowsMovies("https://www.imdb.com/chart/toptv/") 
#             print("data is got") # Assuming json_data_list is a list of JSON data entries
#             if not json_data_list:
#                 return JsonResponse({'status': 'error', 'message': 'No JSON data provided.'}, status=400)
            
#             for json_data in json_data_list:
#                 try:
#                     saved_movie = Tvshows250 .savemodel(json_data)
#                     print(f"Movie '{saved_movie.name}' saved successfully.")
#                 except Exception as e:
#                     print(f"Error saving movie: {e}")
#             return JsonResponse({'status': 'success', 'message': 'Movies saved successfully.'})
#         except Exception as e:
#             return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
#     else:
#         return JsonResponse({'status': 'error', 'message': 'Only GET requests are supported.'}, status=405)

