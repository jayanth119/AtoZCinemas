from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializer import BookingMovieSerializer, Top2024MovieSerializer, CommingSoonSerializer
from .models import Movie, Top2024Movies, soom

@api_view(["GET"])
def Booking(request):
    if request.method == "GET":
        movies = Movie.objects.all()
        serializer = BookingMovieSerializer(movies, many=True)
        return Response(serializer.data)

@api_view(["GET"])
def TopMovies(request):
    if request.method == "GET":
        top2024 = Top2024Movies.objects.all()
        serializer = Top2024MovieSerializer(top2024, many=True)
        return Response(serializer.data)

@api_view(["GET"])
def CommingLater(request):
    if request.method == "GET":
        soon = soom.objects.all()
        serializer = CommingSoonSerializer(soon, many=True)
        return Response(serializer.data)

# @csrf_exempt
# def save(request):
#     if request.method == "GET":
#         try:
#             print("started")
#             model = TopMovie()
#             json_data_list = model.CommingSoon() 
#             print("data is got") # Assuming json_data_list is a list of JSON data entries
#             if not json_data_list:
#                 return JsonResponse({'status': 'error', 'message': 'No JSON data provided.'}, status=400)
            
#             for json_data in json_data_list:
#                 try:
#                     saved_movie = soom.save_movie_details(json_data)
#                     print(f"Movie '{saved_movie.title}' saved successfully.")
#                 except Exception as e:
#                     print(f"Error saving movie: {e}")
#             return JsonResponse({'status': 'success', 'message': 'Movies saved successfully.'})
#         except Exception as e:
#             return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
#     else:
#         return JsonResponse({'status': 'error', 'message': 'Only GET requests are supported.'}, status=405)





