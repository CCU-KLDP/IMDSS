from django.shortcuts import render
# from db_models.models import Patient
from django.http import HttpResponseRedirect
from django.urls import reverse
# from .forms import Patient_data_form


# Create your views here.


def select_patient_view(request):
    content = {
        # "user": user
    }
    return render(request, "select_patient/select_patient.html", content)
