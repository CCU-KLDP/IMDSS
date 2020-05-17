from django.urls import path
from . import views


urlpatterns = [
    path("", views.treatement_analytics_view, name="analytics_page"),
    path("disease_table", views.ajax_get_disease, name="get_disease_table"),
    path("treatment_detail", views.ajax_get_treatment_detail, name="get_treatment_detail"),
    path("success_ratio_chart", views.get_success_ratio_chart, name="success_ratio_chart"),
]
