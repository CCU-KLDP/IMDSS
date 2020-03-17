from django.urls import path
from .import views


urlpatterns = [
    path("", views.emr_view, name="show_emr")
]