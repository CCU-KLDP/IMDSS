from django.urls import path
from .import views


urlpatterns = [
    path("", views.emr_view, name="show_emr"),
    path("dept_CUI/", views.get_dept_CUI, name="get_dept_CUI"),
    path("table_CUI/", views.get_table_CUI, name="get_table_CUI"),
]