from django.urls import path
from . import views


urlpatterns = [
    path("", views.treatement_analytics_view, name="analytics_page"),
    path("disease_table", views.ajax_get_disease, name="get_disease_table"),
    path("treatment_detail", views.ajax_get_treatment_detail, name="get_treatment_detail"),
    path("success_ratio_chart", views.get_success_ratio_charts, name="success_ratio_chart"),
    path("side_effect_detail", views.ajax_side_effect_detail, name="side_effect_detail"),
    path("update_side_effect_detail", views.update_side_effect_detail, name="update_side_effect_detail"),
    path("cost_bar_chart", views.get_cost_bar_charts, name="cost_bar_chart"),
    path("select_chart/thread_chart", views.get_select_thread_chart, name="select_thread_chart"),
    path("select_chart/pie_chart", views.get_select_pie_chart, name="select_pie_chart"),
]
