# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class MedData(models.Model):
    medprs = models.CharField(db_column='MedPRS', max_length=100)  # Field name made lowercase.
    orderid = models.CharField(db_column='OrderId', max_length=100)  # Field name made lowercase.
    dose = models.IntegerField()
    doseunit = models.CharField(db_column='doseUnit', max_length=20)  # Field name made lowercase.
    encounterid = models.CharField(db_column='EncounterId', max_length=20)  # Field name made lowercase.
    exedt = models.CharField(db_column='exeDt', max_length=15)  # Field name made lowercase.
    patient_id_id = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'med_data'


class TprData(models.Model):
    item = models.CharField(max_length=100)
    value = models.DecimalField(max_digits=4, decimal_places=1)
    create_date = models.CharField(max_length=100)
    create_time = models.CharField(max_length=100)
    unit = models.CharField(max_length=20)
    patient_id_id = models.CharField(max_length=100)
    resident_doctor_id = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'tpr_data'
