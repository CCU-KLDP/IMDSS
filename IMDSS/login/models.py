from django.db import models
# from django.contrib.auth.models import User

# # Create your models here.
# department_choices = (
#         ("dept1", "dept1"),
#         ("dept2", "dept2"),
#         ("dept3", "dept3")
# )


# class User_data(models.Model):
#     """
#     @pony
#     使用者(醫生)資料

#     @Kyle
#     add User(contrib.auth.models) to User_data
#     """
#     user = models.OneToOneField(User, on_delete=models.CASCADE)
#     name = models.CharField(max_length=100)
#     department = models.CharField(max_length=100, choices=department_choices)

#     def __str__(self):
#         return self.name

#     class Meta():
#         ordering = ["-department"]
