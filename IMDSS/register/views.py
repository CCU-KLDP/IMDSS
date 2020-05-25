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

# def register_view(request):
#     """
#     @kyle
#     sign up user
#     """
#     if request.method == "GET":
#         # user_form = User_form()
#         detail_form = User_data_create_form()
#         return render(request, "register/register.html", {"user_form": UserCreationForm, "detail_form": detail_form})        
#     else:
#         # user_form = User_form(data=request.POST)
#         detail_form = User_data_create_form(data=request.POST)
#         if user_form.is_valid() and detail_form.is_valid():
#             user = user_form.save()
#             user.set_password(user.password)
#             user.save()
#             details = detail_form.save(commit=False)
#             details.user = user
#             details.save()
#             login(request, user)
#             return HttpResponseRedirect(reverse("login:success"))
#         else:
#             errors = [user_form.errors, detail_form.errors]
#             print(user_form.errors, detail_form.errors)
#             return render(request, "register/register.html", {"user_form": user_form, "detail_form": detail_form, "error": errors})
#     # return 0
