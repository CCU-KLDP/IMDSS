from django.shortcuts import render
# from db_models.models import Patient
from django.http import HttpResponse
from django.urls import reverse
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


def select_patient_view(request):
    content = {
        # "user": user
    }
    return render(request, "select_patient/select_patient.html", content)


def ajax_get_visualize_url(request):
    patient_id = request.POST["patient_id"]
    base_url = "http://127.0.0.1:8000/"
    vis_url = base_url + "charts/" + patient_id

    return response_as_json(vis_url)


def ajax_get_emr_search_url(request):
    patient_id = request.POST["patient_id"]
    base_url = "http://127.0.0.1:8000/"
    emr_url = base_url + "emr_search/" + patient_id

    return response_as_json(emr_url)
