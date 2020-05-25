from django.shortcuts import render
from db_models.models import Doctor, Department
from .forms import User_data_create_form
from django.db import IntegrityError
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User

import datetime
# from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
# Create your views here.


def register_view(request):
    departments = [department['dep_name'] for department in Department.objects.all().values()]
    print("hi")
    if request.method == "POST":
        print("you have submitttt")
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.create_user(request.POST['doctor_id'], password=request.POST['password1'], email=request.POST['email'])
                user.save()
                doctor = Doctor.objects.create(
                    doctor_id=request.POST['doctor_id'],
                    user=user,
                    first_name=request.POST['first_name'],
                    last_name=request.POST['last_name'],
                    create_time=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    department=Department.objects.get(dep_name=(request.POST['departments'])),
                )
                doctor.save()
                print('success')
            except IntegrityError:
                return render(request, "register/register.html", {"departments":departments, })
        return render(request, "register/register.html", {})
    else:
        return render(request, "register/register.html", {"departments":departments, })
