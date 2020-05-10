from django import forms
from db_models.models import Doctor, Department
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm


class User_data_create_form(forms.ModelForm):
    """
    @kyle
    register form
    """
    first_name = forms.CharField(max_length=32)
    last_name = forms.CharField(max_length=32)
    department = forms.ChoiceField(
        choices=[(department.dep_id, department.dep_name) for department in Department.objects.all()]
    )

    class Meta():
        model = Doctor
        fields = [
            "first_name",
            "last_name",
            "doctor_id",
            "department",
        ]