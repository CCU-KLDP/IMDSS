from django.shortcuts import render
from .models import Mri_data

# Create your views here.

def mri_view(request):
    mris = Mri_data.objects.all()
    # mris = Mri_data.objects.filter(id='32')

    # for mri in mris:
    #     print(mri.mri_image.url)
    print(mris)
    content = {
        'mris': mris,
        'first': mris[0],
    }
    return render(request, "mri/mri.html", content)