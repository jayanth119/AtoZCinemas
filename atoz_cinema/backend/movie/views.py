from rest_framework.decorators import api_view
from rest_framework.response import Response
import json

@api_view(["GET"])
def movie(request):
    json_file_path = 'assets/movies.json'

    try:
        with open(json_file_path , "r", encoding="utf-8") as file:
    # your code her:
            # Load data from the JSON file
            data = json.load(file)

        # Return JsonResponse with the loaded data
        return Response(data)

    except FileNotFoundError:
        # Handle the case where the file is not found
        return Response({'error': 'File not found'}, status=404)

    except json.JSONDecodeError:
        # Handle the case where the JSON file is invalid
        return Response({'error': 'Invalid JSON file'}, status=500)

    except Exception as e:
        # Handle other exceptions
        return Response({'error': f'Error: {str(e)}'}, status=500)
