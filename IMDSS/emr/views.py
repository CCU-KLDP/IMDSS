from django.shortcuts import render

# Create your views here.


def emr_view(request):
    content = {

    }

    return render(request, "emr/emr_page.html", content)
