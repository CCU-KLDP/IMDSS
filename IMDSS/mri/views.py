from django.shortcuts       import render
from django.http            import HttpResponse
from .models                import Mri_data, XrayData


import json

# Create your views here.

def response_as_json(data):
    json_str = json.dumps(data)
    response = HttpResponse(
        json_str,
        content_type="application/json",
    )
    response["Access-Control-Allow-Origin"] = "*"
    return response


def json_response(data, code=200):
    data = {
        "code": code,
        "msg": "success",
        "data": data,
    }
    return response_as_json(data)


def mri_view(request):
    mris = Mri_data.objects.all()
    # mris = Mri_data.objects.filter(id='32')
    xrays = XrayData.objects.all()
    print(xrays)
    # for mri in mris:
    #     print(mri.mri_image.url)
    print(mris)
    content = {
        'mris': mris,
        'xrays': xrays,
        'first': mris[0],
    }
    return render(request, "mri/mri.html", content)


def ajax_save_pic(request):
    print(12312312)
    return response_as_json(2131)

