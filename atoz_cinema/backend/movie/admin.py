from django.contrib import admin
from . models import Movie 
from import_export import resources 
from  import_export.admin  import ImportExportModelAdmin
class MovieDetail(resources.ModelResource):
    class Meta :
        model  = Movie 
class MovieDetailAdmin(ImportExportModelAdmin):
    resource_class = MovieDetail 
admin.register(Movie )

admin.register(Movie , MovieDetailAdmin)
# Register your models here.
