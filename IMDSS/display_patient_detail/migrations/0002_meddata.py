# Generated by Django 2.0.2 on 2020-05-18 12:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('display_patient_detail', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='MedData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('medprs', models.CharField(db_column='MedPRS', max_length=100)),
                ('orderid', models.CharField(db_column='OrderId', max_length=100)),
                ('dose', models.IntegerField()),
                ('doseunit', models.CharField(db_column='doseUnit', max_length=20)),
                ('encounterid', models.CharField(db_column='EncounterId', max_length=20)),
                ('exedt', models.CharField(db_column='exeDt', max_length=15)),
                ('patient_id_id', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'med_data',
                'managed': False,
            },
        ),
    ]
