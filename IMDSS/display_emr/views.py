from django.shortcuts import render
from django.http import JsonResponse
from db_models.models import Department
import pandas as pd
# Create your views here.


def display_emr_view(request, date):
    patient_id = '80001'
    xml_data = emr.iloc[0]['content']
    print(xml_data)
    content = {

    }

    return render(request, "display_emr/emr_page.html", content)