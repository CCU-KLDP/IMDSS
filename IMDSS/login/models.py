from django.db import models

# Create your models here.


class User_data(models.Model):
    name = models.CharField(max_length=20)
    account = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    email = models.EmailField()
    department = models.CharField(max_length=50)

    def __str__(self):
        return self.account

    class Meta():
        ordering = ["-department"]
