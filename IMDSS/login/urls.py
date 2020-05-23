from django.urls import path
from . import views

app_name = "login"
urlpatterns = [
    # path("home/", views.)
    # Auth
    path("", views.login_view, name="login_page"),
    path("login", views.ajax_verify_user, name="login_user"),
    path("signup/", views.signup_user, name="signup_user"),
    path("logout/", views.logout_user, name="logout_user"),
]
