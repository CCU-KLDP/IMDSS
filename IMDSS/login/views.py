from django.shortcuts import render
from .models import User_data
from .forms import User_data_login_form
from django.http import HttpResponseRedirect
from django.urls import reverse

# Create your views here.


def login_view(request):
    """
    @pony
    驗證使用者
    """
    user = User_data_login_form(request.POST or None)
    if request.method == "POST":
        pwd = User_data.objects.get(
            account=request.POST['account']
        ).password
        if request.POST["password"] == pwd:
            return HttpResponseRedirect(reverse("login:success"))
        else:
            pass
    context = {
        "user": user
    }
    return render(request, "login/login_page.html", context)


def success_page_view(request):
    return render(request, "another/test.html", {})
