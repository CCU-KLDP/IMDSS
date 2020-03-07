from django.urls import path
from . import views

app_name = "login"
urlpatterns = [
    # path("home/", views.)
    path("", views.login_view, name="login"),
    path("success", views.success_page_view, name="success")
]
