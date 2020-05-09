from django.shortcuts import render

# Create your views here.

def mri_view(request):
    content = {

    }
    return render(request, "mri/mri.html", content)