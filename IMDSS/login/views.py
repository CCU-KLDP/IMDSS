from django.shortcuts import render
from .models import User_data
from .forms import User_data_login_form
from django.http import HttpResponseRedirect
from django.urls import reverse

# Create your views here.


def login_view(request):
    user = User_data_login_form(request.POST or None)
    print(user)
    if request.method == "POST":
        pwd = User_data.objects.get(
            account=user.cleaned_data['account']
        ).password
        if user.cleaned_data["password"] == pwd:
            return HttpResponseRedirect(reverse("login:home"))
        else : 
            user = User_data_login_form()
    context = {
        "user" :user
    }
    return render(request, "login/login_page.html", context)

def home_page_view(request):
    return render(request, "another/test.html", {})