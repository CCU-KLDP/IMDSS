from django import forms
from db_models.models import Doctor, Department
from django.contrib.auth.models import User

class User_form(forms.ModelForm):
    username = forms.CharField(max_length=100)
    password = forms.CharField(widget=forms.PasswordInput())
    email = forms.EmailField(
        help_text="Please enter a valid email!"
    )
    
    class Meta():
        model = User
        fields = (
            'username',
            'password',
            'email'
        )

class User_data_create_form(forms.ModelForm):
    """
    @pony
    建立新使用者時用的form
    """
    department = forms.ChoiceField(
        choices=[(department.dep_id, department.dep_name) for department in Department.objects.all()]
    )

    class Meta():
        model = Doctor
        fields = [
            "name",
            "department"
        ]


# class User_data_login_form(forms.Form):
#     """
#     @pony
#     使用者登入時用的form
#     """
#     account = forms.CharField(
#         label="帳號 : ",
#         widget=forms.TextInput(
#             attrs={
#                 "is_required": True,
#                 "placeholder": "Account",
#                 "id": "account",
#                 "type": "text",
#                 "class": "validate white-text"
#             }
#         )
#     )

#     password = forms.CharField(
#         label="密碼 : ",
#         widget=forms.PasswordInput(
#             attrs={
#                 "is_required": True,
#                 "placeholder": "Password",
#                 "input id": "password",
#                 "type": "password",
#                 "class": "validate white-text"
#             }
#         )
#     )
