from django.urls import path
from . import views

app_name = 'emr'

urlpatterns = [
    path("<int:patient_id>/", views.emr_view, name="show_emr"),
    path("dept_table/", views.ajax_get_dept_table, name="get_dept_table"),
    path("table_item/", views.ajax_get_table_item, name="get_table_item"),
    path("<int:patient_id>/get_emr/", views.ajax_get_emr, name="get_emr"),
    path("text_search_emr/", views.ajax_get_search_emr, name="text_search"),
    path("<int:patient_id>/save_memo/", views.ajax_save_memo, name="save_memo"),
    path("get_mark", views.ajax_get_mark, name="get_mark"),
]
