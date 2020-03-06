from django.shortcuts import render

# Create your views here.


def select_patient_view(request):
    content = {

    }
    return render(request, "select_patient/select_patient.html", content)
