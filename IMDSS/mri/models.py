# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class XrayData(models.Model):
    patient_id = models.CharField(max_length=20, blank=True, null=True)
    doctor_id = models.CharField(max_length=20, blank=True, null=True)
    mri_image = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'xray_data'


class Mri_data(models.Model):
    patient_id = models.CharField(max_length=20, null=True)
    doctor_id = models.CharField(max_length=20, null=True)
    mri_image = models.ImageField(upload_to='mri/images')