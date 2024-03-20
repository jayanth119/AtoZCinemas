from rest_framework.decorators import api_view
from rest_framework.response import Response
from .core import BookingMovies , TopMovie  
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from .models import soom 
@api_view(["GET"]) 
def Booking(request):
    if request.method == "GET":
        model = BookingMovies()
        print("server start ")
        booking_data = model.BookingResponse()  # Assuming BookingResponse returns a dictionary or a list
        print("server end ")
        return Response(booking_data)  # Return the booking data as JSON response
@api_view(["GET"]) 
def TopMovies(request):
    if request.method == "GET":
        model = TopMovie()
        print("server start ")
        booking_data = model.TopMovieResponse()  # Assuming BookingResponse returns a dictionary or a list
        print("server end ")
        return Response(booking_data)  # Return the booking data as JSON response
@api_view(["GET"]) 
def CommingLater(request):
    if request.method == "GET":
        model = TopMovie()
        print("server start ")
        booking_data = model.CommingSoon()  # Assuming BookingResponse returns a dictionary or a list
        print("server end ")
        return Response(booking_data)  # Return the booking data as JSON response
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





