from django.urls import path
from . import views

app_name = "display_emr"
urlpatterns = [
    path("<int:patient_id>/<str:date>/", views.display_emr_view, name="show_emr"),
    path("<int:patient_id>/<str:date>/get_xml", views.ajax_get_xml, name="get_xml")
]