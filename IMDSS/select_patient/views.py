from django.shortcuts import render
from .models import Patient_data
from django.http import HttpResponseRedirect
from django.urls import reverse
from .forms import Patient_data_form


# Create your views here.


def select_patient_view(request):
    a = Patient_data_form(instance=Patient_data.objects.get(id=1))
    content = {
        # "user": user
        "patient": a
    }
    return render(request, "select_patient/select_patient.html", content)
