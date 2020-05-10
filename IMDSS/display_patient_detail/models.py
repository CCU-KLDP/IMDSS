from django.db import models

# Create your models here.

# class Tpr_process(models.Model):
#     """
#     @louise
#     Processed TPR data
#     """
#     pat_no = models.IntegerField()
#     BT_TA = models.DecimalField(max_digits=4, decimal_places=1, null=True)
#     HR = models.DecimalField(max_digits=4, decimal_places=1, null=True)
#     RR = models.DecimalField(max_digits=4, decimal_places=1, null=True)
#     DBP = models.DecimalField(max_digits=4, decimal_places=1, null=True)
#     SBP = models.DecimalField(max_digits=4, decimal_places=1, null=True)
#     cre_dt = models.IntegerField()
#     cre_ti = models.IntegerField()

#     def __str__(self):
#         return self.pat_no
