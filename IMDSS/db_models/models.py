from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class Department(models.Model):
    """
    @Kyle
    department
    """
    dep_id = models.CharField(max_length=100, unique=True, primary_key=True)
    dep_name = models.CharField(max_length=100)

    def __str__(self):
        return self.dep_name


class Doctor(models.Model):
    """
    @Kyle
    replace User_data
    """
    doctor_id = models.CharField(max_length=100, unique=True, primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=30, blank=False, null=True)
    last_name = models.CharField(max_length=30, blank=False, null=True)
    create_time = models.CharField(max_length=60, blank=False, null=True)
    department = models.ForeignKey(
        'db_models.Department',
        on_delete=models.DO_NOTHING
    )

    def __str__(self):
        return self.first_name

    # def create(user, first_name, last_name, create_time, department):


    # class Meta():
    #     ordering = ["-department"]


class Patient(models.Model):
    patient_id = models.CharField(max_length=100, unique=True)
    name = models.CharField(max_length=20)
    gender = models.CharField(max_length=10)
    medical_condition = models.CharField(max_length=200)
    birth = models.DateField()
    identification = models.CharField(max_length=20)


class Evaluation_form(models.Model):
    name = models.CharField(max_length=50)
    medical_condition = models.CharField(max_length=200)
    time_frame = models.CharField(max_length=50, null=True)
    cuis_list = models.CharField(max_length=2500)
    dep_id = models.ForeignKey(
        'db_models.Department',
        related_name='dep_evaluation',
        on_delete=models.DO_NOTHING
        )


class Med(models.Model):
    """
    @Louise
    Change med model
    """
    patient_id = models.ForeignKey(
        'db_models.Patient',
        on_delete=models.DO_NOTHING,
        to_field='patient_id',
        )
    EncounterId = models.CharField(max_length=20) # 住院序號
    OrderId = models.CharField(max_length=100)  # NIA編號+NIB序號
    MedPRS = models.CharField(max_length=100)  # 處置代碼
    dose = models.IntegerField()  # 劑量
    doseUnit = models.CharField(max_length=20)  # 劑量單位
    exeDt = models.CharField(max_length=15) #執行時間


class Tpr_data(models.Model):
    # medical_record = models.IntegerField()  # 病歷號
    patient_id = models.ForeignKey(
        'db_models.Patient',
        on_delete=models.DO_NOTHING,
        to_field='patient_id',
        )
    item = models.CharField(max_length=100, null=True)  # 量測的項
    value = models.DecimalField(max_digits=4, decimal_places=1, null=True)
    unit = models.CharField(max_length=20, null=True)
    # source = models.IntegerField()  # 量測來源
    create_date = models.CharField(max_length=100, null=True)
    create_time = models.CharField(max_length=100, null=True)
    resident_doctor = models.ForeignKey(
        'db_models.Doctor',
        on_delete=models.DO_NOTHING
        )  # 登錄時的主治醫師

    def __str__(self):
        return self.patient_id


class Emr_data(models.Model):
    """
    @Louise
    All emr string with tag
    """
    EmrId = models.CharField(max_length=50,unique=True)     # 病歷檔名編號
    Sequence = models.IntegerField()                        # 行數
    EmrContent = models.CharField(max_length=5000)          # 包含tag內容


class Xsl_data(models.Model):
    """
    @Louise
    All xsl string with tag
    """
    XslId = models.CharField(max_length=50)          # Xsl檔名編號
    Sequence = models.IntegerField()                 # 行數
    XslContent = models.CharField(max_length=5000)   # 包含tag內容


class Memo_data(models.Model):
    time = models.DateField(auto_now=True)
    doctor_id = models.ForeignKey(
        'db_models.Doctor',
        on_delete=models.DO_NOTHING,
        to_field='doctor_id',
        related_name='memo_doctor',
        )
    patient_id = models.ForeignKey(
        'db_models.Patient',
        on_delete=models.DO_NOTHING,
        to_field='patient_id',
        related_name='memo_patients'
        )
    content = models.CharField(max_length=6000)


class OutPatient_data(models.Model):
    """
    @Kyle
    Outpatient_data
    """
    time = models.CharField(max_length=100)
    EmrId = models.ForeignKey(
        'db_models.Emr_data',
        on_delete=models.DO_NOTHING,
        to_field='EmrId'
        )
    doctor_id = models.ForeignKey(
        'db_models.Doctor',
        on_delete=models.DO_NOTHING,
        to_field='doctor_id',
        related_name='outpatient_doctor'
        )
    patient_id = models.ForeignKey(
        'db_models.Patient',
        on_delete=models.DO_NOTHING,
        to_field='patient_id',
        related_name='outpatient_patients'
        )
    dep_id = models.ForeignKey(
        'db_models.Department',
        on_delete=models.DO_NOTHING,
        to_field='dep_id'
        )
    Type = models.CharField(max_length=100)
    """
    need to temporary ignore it
    med_id = models.ForeignKey(
        'db_models.Med',
        on_delete=models.DO_NOTHING,
        to_field='id'
        )
    """


class Hospitalized_data(models.Model):
    """
    @Kyle
    hospitalized_data
    """
    time = models.CharField(max_length=100)
    EmrId = models.ForeignKey(
        'db_models.Emr_data',
        on_delete=models.DO_NOTHING,
        to_field='EmrId'
        )
    doctor_id = models.ForeignKey(
        'db_models.Doctor',
        on_delete=models.DO_NOTHING,
        to_field='doctor_id',
        related_name='hospitalized_doctor'
        )
    patient_id = models.ForeignKey(
        'db_models.Patient',
        on_delete=models.DO_NOTHING,
        to_field='patient_id',
        related_name='hospitalized_patients'
        )
    dep_id = models.ForeignKey(
        'db_models.Department',
        on_delete=models.DO_NOTHING,
        to_field='dep_id'
        )
    Type = models.CharField(max_length=100)
    """
    need to temporary ignore it
    med_id = models.ForeignKey(
        'db_models.Med',
        on_delete=models.DO_NOTHING,
        to_field='id'
        )
    tpr_id = models.ForeignKey(
        'db_models.Tpr_data',
        on_delete=models.DO_NOTHING,
        to_field='id'
        )
    """


