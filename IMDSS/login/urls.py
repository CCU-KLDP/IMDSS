from django.urls import path
from . import views

app_name = "login"
urlpatterns = [
    path("", views.login_view, name="login"),
    path("success/", views.home_page_view, name="home")
]
