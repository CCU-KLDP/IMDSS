from .models import Patient_data
from django import forms


class Patient_data_form(forms.ModelForm):
    class Meta():
        model = Patient_data
        fields = [
            "date",
            "duration",  
            "patients_name",
            "division", # 科別
            "doctors_name",
        ]