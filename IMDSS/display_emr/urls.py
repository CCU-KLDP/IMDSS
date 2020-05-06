from django.urls import path
from . import views


urlpatterns = [
    path("<str:date>/", views.display_emr_view, name="show_emr"),
]