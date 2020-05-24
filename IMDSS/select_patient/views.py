from django.shortcuts      import render
from db_models.models      import Patient, Doctor
from django.http           import HttpResponse
from django.urls           import reverse
from .models               import MemoData

import pandas              as pd
import json
# from .forms import Patient_data_form


# Create your views here.
def response_as_json(data):
    json_str = json.dumps(data)
    response = HttpResponse(
        json_str,
        content_type="application/json",
    )
    response["Access-Control-Allow-Origin"] = "*"
    return response


def get_patient_list():
    return list(Patient.objects.all())


def select_patient_view(request):
    # doctor_id = request.GET['doctor_id']
    doctor_id = '04135'
    login_doctor = Doctor.objects.get(doctor_id=doctor_id) 

    patients = list(Patient.objects.all().values())

    memo_df = pd.DataFrame(list(MemoData.objects.filter(doctor_id_id=doctor_id).values()))

    memo_df['datetime'] = memo_df.apply(lambda r : pd.datetime.combine(r['date'],r['time']),1)
    print(memo_df)
    patient_groups = memo_df.groupby('patient_id_id')

    memo_dict = {}

    for key in list(patient_groups.groups.keys()):
        df = patient_groups.get_group(key).sort_values(by='datetime', ascending=False)
        memo_dict[key] = df.iloc[0]['content']

        print(memo_dict)


    # key: patient_id value: the latest memo by doctor id
    content = {
        "doctor": login_doctor,
        "patients": patients,
        "memo": memo_dict,
    }
    return render(request, "select_patient/select_patient.html", content)


def ajax_get_visualize_url(request):

    patient_id = request.POST["patient_id"]
    base_url = "http://127.0.0.1:8000/"
    vis_url = base_url + "charts/" + patient_id

    return response_as_json(vis_url)


def ajax_get_emr_search_url(request):
    patient_id = request.POST["patient_id"]
    # print(request.GET)
    base_url = "http://127.0.0.1:8000/"
    emr_url = base_url + "emr_search/" + patient_id
    
    return response_as_json(emr_url)


def ajax_get_memo(request):
    print(request.GET["selected_patient_id"])


    #return memo(string)
    return HttpResponse(123)
