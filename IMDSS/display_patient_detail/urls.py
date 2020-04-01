from django.urls import path
from . import views


urlpatterns = [
    path("charts/", views.display_patient_detail_view, name="display_patient_detail"),
    path("charts/top_chart", views.chart_view, name="top_chart_json"),
    path("emr/", views.ajax_get_patient_emr, name="ajax_get_patient_emr"),
]
