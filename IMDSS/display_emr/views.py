from django.shortcuts import render
from django.http import JsonResponse
from db_models.models import Department
import pandas as pd
# Create your views here.


def display_emr_view(request, date):
    patient_id = '80001'
    date = 
    content = {
        "emr_table": get_emr_table(patient_id),
        "dept_lst": get_dept_lst(),
    }

    return render(request, "emr/emr_page.html", content)