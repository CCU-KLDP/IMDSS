from django.urls import path
from . import views

app_name = "select_patient"
urlpatterns = [
    path("", views.select_patient_view, name="select_page"),
    path("visualize", views.ajax_get_visualize_url, name="get_vis"),
    path("emr_search", views.ajax_get_emr_search_url, name="get_emr_search"),
]
