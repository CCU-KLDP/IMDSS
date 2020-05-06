from django.urls import path
from . import views


urlpatterns = [
    path("<str:date>/", views.display_emr_view, name="show_emr"),
    path("<str:date>/get_xml", views.ajax_get_xml, name="get_xml")
]