# Generated by Django 2.0.2 on 2020-04-18 08:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Department',
            fields=[
                ('dep_id', models.CharField(max_length=100, primary_key=True, serialize=False, unique=True)),
                ('dep_name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Doctor',
            fields=[
                ('doctor_id', models.CharField(max_length=100, primary_key=True, serialize=False, unique=True)),
                ('name', models.CharField(max_length=100)),
                ('create_time', models.DateField()),
                ('department', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Department')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Evaluation_form',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('medical_condition', models.CharField(max_length=200)),
                ('time_frame', models.CharField(max_length=50, null=True)),
                ('cuis_list', models.CharField(max_length=2500)),
                ('dep_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Department')),
            ],
        ),
        migrations.CreateModel(
            name='Hospitalized_data',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time', models.DateField()),
                ('dep_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Department')),
                ('doctor_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='hospitalized_doctor', to='db_models.Doctor')),
            ],
        ),
        migrations.CreateModel(
            name='Med',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('MedPRS', models.CharField(max_length=100)),
                ('OrderId', models.CharField(max_length=100)),
                ('begin_at', models.DateField()),
                ('end_at', models.DateField()),
                ('routePmName', models.CharField(max_length=50)),
                ('dose', models.IntegerField()),
                ('doseUnit', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='OutPatient_data',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time', models.DateField()),
                ('dep_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Department')),
                ('doctor_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='outpatient_doctor', to='db_models.Doctor')),
                ('med_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Med')),
            ],
        ),
        migrations.CreateModel(
            name='Patient',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('patient_id', models.CharField(max_length=100, unique=True)),
                ('name', models.CharField(max_length=20)),
                ('gender', models.CharField(max_length=10)),
                ('medical_condition', models.CharField(max_length=200)),
                ('birth', models.DateField()),
                ('identification', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Tpr_data',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('item', models.CharField(max_length=100, null=True)),
                ('value', models.DecimalField(decimal_places=1, max_digits=4, null=True)),
                ('create_date', models.DateField(null=True)),
                ('create_time', models.TimeField(null=True)),
                ('login_user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
                ('patient_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Patient', to_field='patient_id')),
                ('resident_doctor', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Doctor')),
            ],
        ),
        migrations.AddField(
            model_name='outpatient_data',
            name='patient_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='outpatient_patients', to='db_models.Patient', to_field='patient_id'),
        ),
        migrations.AddField(
            model_name='hospitalized_data',
            name='med_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Med'),
        ),
        migrations.AddField(
            model_name='hospitalized_data',
            name='patient_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='hospitalized_patients', to='db_models.Patient', to_field='patient_id'),
        ),
        migrations.AddField(
            model_name='hospitalized_data',
            name='tpr_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='db_models.Tpr_data'),
        ),
    ]
