from django.shortcuts import render
# Create your views here.


def register_view(request):
    content = {

    }
    return render(request, "register/register.html", content)
