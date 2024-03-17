from rest_framework.decorators import api_view
from rest_framework.response import Response
from .core import BookingMovies , TopMovie  

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