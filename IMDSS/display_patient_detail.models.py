# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DisplayPatientDetailTprProcess(models.Model):
    pat_no = models.IntegerField()
    bt_ta = models.DecimalField(db_column='BT_TA', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    hr = models.DecimalField(db_column='HR', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    rr = models.DecimalField(db_column='RR', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    dbp = models.DecimalField(db_column='DBP', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    sbp = models.DecimalField(db_column='SBP', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    cre_dt = models.IntegerField()
    cre_ti = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'display_patient_detail_tpr_process'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class LoginUserData(models.Model):
    name = models.CharField(max_length=100)
    department = models.CharField(max_length=100)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, unique=True)

    class Meta:
        managed = False
        db_table = 'login_user_data'


class SelectPatientPatientData(models.Model):
    date = models.DateTimeField()
    duration = models.BigIntegerField()
    division = models.CharField(max_length=50)
    doctors_name = models.CharField(max_length=20)
    patients_name = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'select_patient_patient_data'


class TprData(models.Model):
    tor_server_dt = models.IntegerField(blank=True, null=True)
    chtor_server_ti = models.IntegerField(blank=True, null=True)
    chtor_pat_no = models.IntegerField(blank=True, null=True)
    chtor_item = models.CharField(max_length=30, blank=True, null=True)
    chtor_from_sys_1 = models.CharField(max_length=1, blank=True, null=True)
    chtor_from_sys_2 = models.CharField(max_length=10, blank=True, null=True)
    chtor_ipd_no = models.BigIntegerField(blank=True, null=True)
    chtor_ipd_seq = models.IntegerField(blank=True, null=True)
    chtor_filler1 = models.CharField(max_length=17, blank=True, null=True)
    chtor_del_mark = models.CharField(max_length=1, blank=True, null=True)
    chtor_cre_dt = models.IntegerField(blank=True, null=True)
    chtor_cre_ti = models.IntegerField(blank=True, null=True)
    chtor_cre_dt_v = models.IntegerField(blank=True, null=True)
    chtor_cre_ti_v = models.IntegerField(blank=True, null=True)
    chtor_value_type = models.IntegerField(blank=True, null=True)
    chtor_value_str = models.CharField(max_length=80, blank=True, null=True)
    chtor_value_num = models.DecimalField(max_digits=4, decimal_places=1, blank=True, null=True)
    chtor_unit = models.CharField(max_length=20, blank=True, null=True)
    chtor_memo = models.CharField(max_length=50, blank=True, null=True)
    chtor_cre_user = models.CharField(max_length=5, blank=True, null=True)
    chtor_cre_mj_dr = models.CharField(max_length=5, blank=True, null=True)
    chtor_upd_user = models.CharField(max_length=5, blank=True, null=True)
    chtor_upd_mj_dr = models.CharField(max_length=5, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tpr_data'


class TprProcess(models.Model):
    pat_no = models.IntegerField()
    bt_ta = models.DecimalField(db_column='BT_TA', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    hr = models.DecimalField(db_column='HR', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    rr = models.DecimalField(db_column='RR', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    dbp = models.DecimalField(db_column='DBP', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    sbp = models.DecimalField(db_column='SBP', max_digits=4, decimal_places=1, blank=True, null=True)  # Field name made lowercase.
    cre_dt = models.IntegerField()
    cre_ti = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'tpr_process'
