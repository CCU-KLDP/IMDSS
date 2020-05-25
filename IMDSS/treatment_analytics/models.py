# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Analysis(models.Model):
    dept_id = models.CharField(max_length=10)
    disease_name = models.CharField(max_length=100)
    treatment_id = models.CharField(max_length=20)
    treat_name = models.CharField(max_length=100)
    treat_description = models.CharField(max_length=1000)
    treat_success = models.IntegerField()
    treat_side = models.CharField(max_length=1000)
    treat_cost = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'analysis'


class AnalysisAnnual(models.Model):
    treatment_id = models.CharField(max_length=20)
    year = models.IntegerField()
    ratio = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'analysis_annual'
