from django.db import models

#定义基础数据模型，所有模型继承自BaseModel后会自动拥有创建时间和更新时间字段，且该模型为抽象基类，不会生成数据库表
class BaseModel(models.Model):
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updated_time = models.DateTimeField(auto_now=True, verbose_name='最后更新时间')

    class Meta:
        abstract = True
