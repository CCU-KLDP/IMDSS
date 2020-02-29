from django import forms
from .models import User_data


class User_data_create_form(forms.ModelForm):
    """
    @pony
    建立新使用者時用的form
    """
    department_choice = (
        (1, "dept1"),
        (2, "dept2"),
        (3, "dept3")
    )
    password = forms.PasswordInput()
    confirm_password = forms.PasswordInput()
    email = forms.EmailField(
        help_text="Please enter a valid email!"
    )
    depatrment = forms.ChoiceField(
        choices=department_choice
    )

    class Meta():
        model = User_data
        fields = [
            "name",
            "account",
            "password",
            "email",
            "department"
        ]
