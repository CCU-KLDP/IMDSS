from django.urls import path
from .import views


urlpatterns = [
    path("", views.emr_view, name="show_emr"),
    path("dept_table/", views.get_dept_table, name="get_dept_table"),
    path("table_item/", views.get_table_item, name="get_table_item"),
]