from django.urls import path
from . import views

urlpatterns = [
    path("", views.select_patient_view, name="select_patient")
]
