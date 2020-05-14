from django.shortcuts import render
from random import randint
from django.http import HttpResponse
import json

# Create your views here.

# json response
def response_as_json(data):
    json_str = json.dumps(data)
    response = HttpResponse(
        json_str,
        content_type="application/json",
    )
    response["Access-Control-Allow-Origin"] = "*"
    return response



def treatement_analytics_view(request):
    content = {
        "dept_lst": get_dept_lst()
    }
    return render(request, "treatment_analytics/analytics_page.html", content)


def get_dept_lst():
    return ["dept1", "dept_2", "dept_3"]


def ajax_get_disease(request):
    dept_lst = get_dept_lst()
    dic = {
        "dept": get_dept_lst()
    }

    for i in dept_lst:
        temp = []
        for j in range(3):
            temp.append("disease-" + str(randint(1, 11)))
        dic[i] = temp
    
    return response_as_json(dic)


def ajax_get_treatment_detail(request):
    selected_disease = request.GET["selected_disease"]
    treatment_lst = ["treatment_1", "treatment_2", "treatment_3"]
    dic = {}
    dic['treatment'] = treatment_lst
    for i in treatment_lst:
        dic[i] = "description" + i.split("_")[1]

    return response_as_json(dic)
