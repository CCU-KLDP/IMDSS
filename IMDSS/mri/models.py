from django.db import models

# Create your models here.
class Mri_data(models.Model):
    patient_id = models.CharField(max_length=20, null=True)
    doctor_id = models.CharField(max_length=20, null=True)
    mri_image = models.ImageField(upload_to='mri/images')