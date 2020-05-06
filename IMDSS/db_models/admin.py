from django.contrib import admin
from django.apps import apps

# Register your models here.
# https://hackernoon.com/automatically-register-all-models-in-django-admin-django-tips-481382cf75e5

models = apps.get_models()

for model in models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass
