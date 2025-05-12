
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Talk',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('title', models.CharField(blank=True, max_length=64, null=True, verbose_name='标题')),
                ('content', models.TextField(blank=True, null=True, verbose_name='正文')),
                ('likeCount', models.IntegerField(default=0, verbose_name='点赞数')),
                ('data_id', models.CharField(blank=True, max_length=64, null=True, verbose_name='资源id')),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.user', verbose_name='作者')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Comments',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='最后更新时间')),
                ('content', models.TextField(blank=True, null=True, verbose_name='内容')),
                ('data_id', models.CharField(blank=True, max_length=64, null=True, verbose_name='资源id')),
                ('author', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.user', verbose_name='用户')),
                ('talk', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.talk', verbose_name='关联的贴子')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='user',
            name='dianzan_list',
            field=models.ManyToManyField(blank=True, null=True, to='index.talk', verbose_name='点赞的帖子'),
        ),
    ]
