from django.urls import path
from . import views


urlpatterns = [
    path("", views.mri_view, name="mri_view"),
]
