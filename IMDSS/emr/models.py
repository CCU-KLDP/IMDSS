# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TestEmr(models.Model):
    patient_id = models.CharField(db_column='Patient_ID', max_length=255, blank=True, null=True)  # Field name made lowercase.
    chartno = models.CharField(db_column='ChartNo', max_length=255, blank=True, null=True)  # Field name made lowercase.
    admissiondate = models.CharField(db_column='AdmissionDate', max_length=255, blank=True, null=True)  # Field name made lowercase.
    erdate = models.CharField(db_column='ERDate', max_length=255, blank=True, null=True)  # Field name made lowercase.
    notetype = models.CharField(db_column='NoteType', max_length=255, blank=True, null=True)  # Field name made lowercase.
    datetime = models.CharField(db_column='DateTime', max_length=255, blank=True, null=True)  # Field name made lowercase.
    serial = models.IntegerField(db_column='Serial', blank=True, null=True)  # Field name made lowercase.
    content = models.TextField(db_column='Content', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'test_emr'
