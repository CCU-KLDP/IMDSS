# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class HospitalizedData(models.Model):
    time = models.CharField(max_length=100)
    type = models.CharField(db_column='Type', max_length=100)  # Field name made lowercase.
    emrid_id = models.CharField(db_column='EmrId_id', max_length=50)  # Field name made lowercase.
    dep_id_id = models.CharField(max_length=100)
    doctor_id_id = models.CharField(max_length=100)
    patient_id_id = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'hospitalized_data'


class EmrData(models.Model):
    emrid = models.CharField(db_column='EmrId', max_length=50)  # Field name made lowercase.
    sequence = models.IntegerField(db_column='Sequence')  # Field name made lowercase.
    emrcontent = models.CharField(db_column='EmrContent', max_length=5000)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'emr_data'


class EmrCui(models.Model):
    emrid = models.CharField(db_column='EmrId', max_length=50, blank=True, null=True)  # Field name made lowercase.
    cuilist = models.CharField(db_column='CuiList', max_length=20000, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'emr_cui'


class EmrCuiWord(models.Model):
    emrid = models.CharField(db_column='EmrId', max_length=50, blank=True, null=True)  # Field name made lowercase.
    cui = models.CharField(db_column='Cui', max_length=10, blank=True, null=True)  # Field name made lowercase.
    wordlist = models.CharField(db_column='WordList', max_length=20000, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'emr_cui_word'
