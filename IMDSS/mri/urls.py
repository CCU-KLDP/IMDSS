from django.urls import path
from . import views


urlpatterns = [
    path("<int:patient_id>", views.mri_view, name="mri_view"),
    path("save_pic", views.ajax_save_pic, name="save_pic"),
]
