from django.shortcuts import render
# from .forms import User_data_create_form, User_form
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth import login, logout, authenticate
# Create your views here.


def logout_user(request):
    """
    @kyle
    logout
    """
    logout(request)
    return HttpResponseRedirect(reverse("login:login_user"))


def login_view(request):
    """
    @pony
    驗證使用者

    @kyle
    login
    """
    if request.method == "GET":
        return render(request, "login/login_page.html", {})
    else:
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            return HttpResponseRedirect(reverse("select_patient:select_page"))
        else:
            return render(request, "login/login_page.html", {"error": "Username and password did not match!"})


def signup_user(request):
    # """
    # @kyle
    # sign up user
    # """
    # if request.method == "GET":
    #     user_form = User_form()
    #     detail_form = User_data_create_form()
    #     return render(request, "login/signup_page.html", {"user_form": user_form, "detail_form": detail_form})        
    # else:
    #     user_form = User_form(data=request.POST)
    #     detail_form = User_data_create_form(data=request.POST)
    #     if user_form.is_valid() and detail_form.is_valid():
    #         user = user_form.save()
    #         user.set_password(user.password)
    #         user.save()
    #         details = detail_form.save(commit=False)
    #         details.user = user
    #         details.save()
    #         login(request, user)
    #         return HttpResponseRedirect(reverse("login:success"))
    #     else:
    #         errors = [user_form.errors, detail_form.errors]
    #         print(user_form.errors, detail_form.errors)
    #         return render(request, "login/signup_page.html", {"user_form": user_form, "detail_form": detail_form, "error": errors})
    return 0

def success_page_view(request):
    return render(request, "another/test.html", {})
