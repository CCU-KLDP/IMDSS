from django.urls import path
from . import views


urlpatterns = [
    path("<str:date>/", views.emr_view, name="show_emr"),
]