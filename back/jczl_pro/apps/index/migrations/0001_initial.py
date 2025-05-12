

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('img', models.FileField(blank=True, null=True, upload_to='banner', verbose_name='轮播图')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='BaseSettings',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('media_url', models.CharField(blank=True, max_length=64, null=True, verbose_name='media_url')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='CanShuSettings',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('app_id', models.CharField(blank=True, max_length=64, null=True, verbose_name='app_id')),
                ('app_serct', models.CharField(blank=True, max_length=64, null=True, verbose_name='app_serct')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='JiuFenType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('name', models.CharField(blank=True, max_length=64, null=True, verbose_name='纠纷类型名称')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TouSuType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('name', models.CharField(blank=True, max_length=64, null=True, verbose_name='投诉类型名称')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TuWenType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('name', models.CharField(blank=True, max_length=64, null=True, verbose_name='图文分类名称')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('uuid', models.UUIDField(default=uuid.uuid4, verbose_name='用户唯一标识')),
                ('phone', models.CharField(blank=True, max_length=128, null=True, unique=True, verbose_name='手机号')),
                ('open_id', models.CharField(blank=True, max_length=64, null=True, verbose_name='微信唯一标识')),
                ('avatar', models.FileField(default='avatar/avatar.svg', upload_to='avatar', verbose_name='头像')),
                ('password', models.CharField(blank=True, max_length=128, null=True, verbose_name='密码')),
                ('username', models.CharField(default='微信用户', max_length=64, verbose_name='用户名')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='YiChangType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('name', models.CharField(blank=True, max_length=64, null=True, verbose_name='异常类型名称')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='YiChang',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('img', models.FileField(blank=True, null=True, upload_to='img', verbose_name='图片')),
                ('address', models.CharField(blank=True, max_length=64, null=True, verbose_name='地址')),
                ('text', models.TextField(blank=True, null=True, verbose_name='概况')),
                ('phone', models.CharField(blank=True, max_length=64, null=True, verbose_name='手机号')),
                ('created_date', models.DateField(auto_now_add=True, verbose_name='创建日期')),
                ('type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.yichangtype', verbose_name='异常类型')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.user', verbose_name='用户')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TuWen',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('title', models.CharField(blank=True, max_length=64, null=True, verbose_name='标题')),
                ('created_date', models.DateField(auto_now_add=True, verbose_name='创建日期')),
                ('text', models.TextField(blank=True, null=True, verbose_name='内容')),
                ('img', models.FileField(blank=True, null=True, upload_to='tuwen', verbose_name='图片')),
                ('type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.tuwentype', verbose_name='图文分类')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TouSu',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('img', models.FileField(blank=True, null=True, upload_to='file', verbose_name='证据材料')),
                ('another_user', models.CharField(blank=True, max_length=64, null=True, verbose_name='投诉对象')),
                ('text', models.TextField(blank=True, null=True, verbose_name='事件概况')),
                ('phone', models.CharField(blank=True, max_length=64, null=True, verbose_name='联系方式')),
                ('is_ni', models.SmallIntegerField(choices=[(0, '否'), (1, '是')], default=0, verbose_name='是否匿名')),
                ('img1', models.FileField(blank=True, null=True, upload_to='file', verbose_name='证据材料2')),
                ('img2', models.FileField(blank=True, null=True, upload_to='file', verbose_name='证据材料3')),
                ('data_id', models.CharField(blank=True, max_length=64, null=True, verbose_name='投诉资源id')),
                ('created_date', models.DateField(auto_now_add=True, verbose_name='创建日期')),
                ('type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.tousutype', verbose_name='投诉类型')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.user', verbose_name='用户')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='JiuFen',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('img', models.FileField(blank=True, null=True, upload_to='file', verbose_name='证据材料')),
                ('img1', models.FileField(blank=True, null=True, upload_to='file', verbose_name='证据材料2')),
                ('img2', models.FileField(blank=True, null=True, upload_to='file', verbose_name='证据材料3')),
                ('data_id', models.CharField(blank=True, max_length=64, null=True, verbose_name='纠纷资源id')),
                ('state', models.SmallIntegerField(choices=[(0, '已预约'), (1, '安排中'), (2, '调解中'), (3, '调解结束')], default=0, verbose_name='调解状态')),
                ('apply_user', models.CharField(blank=True, max_length=64, null=True, verbose_name='申请人姓名')),
                ('apply_phone', models.CharField(blank=True, max_length=64, null=True, verbose_name='申请人电话')),
                ('apply_address', models.CharField(blank=True, max_length=64, null=True, verbose_name='申请人地址')),
                ('other_user', models.CharField(blank=True, max_length=64, null=True, verbose_name='被申请人姓名')),
                ('other_phone', models.CharField(blank=True, max_length=64, null=True, verbose_name='被申请人电话')),
                ('other_address', models.CharField(blank=True, max_length=64, null=True, verbose_name='被申请人地址')),
                ('text', models.TextField(blank=True, null=True, verbose_name='纠纷事实与理由')),
                ('suqiu', models.TextField(blank=True, null=True, verbose_name='调解诉求')),
                ('created_date', models.DateField(auto_now_add=True, verbose_name='创建日期')),
                ('type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.jiufentype', verbose_name='纠纷类型')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.user', verbose_name='用户')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='JiFenLog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('text', models.TextField(blank=True, null=True, verbose_name='内容')),
                ('jifen', models.IntegerField(default=0, verbose_name='积分')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.user', verbose_name='用户')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
