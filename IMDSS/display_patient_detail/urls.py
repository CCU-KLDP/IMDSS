from django.urls import path
from . import views


urlpatterns = [
    path("<int:patient_id>/", views.display_patient_detail_view, name="display_patient_detail"),
    # patient_id 用ajax data傳進來
    path("top_chart/", views.chart_view, name="top_chart_json"),
    path("emr/", views.ajax_get_patient_emr, name="ajax_get_patient_emr"),
    path("update_drugs/", views.ajax_update_charts, name="update_drugs"),
    path("<int:patient_id>/save_memo/", views.ajax_save_memo, name="save_memo"),
]
