

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0003_talk_is_top'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='address',
            field=models.TextField(blank=True, null=True, verbose_name='地址'),
        ),
        migrations.AddField(
            model_name='user',
            name='role',
            field=models.SmallIntegerField(choices=[(0, '居民'), (1, '治安积极分子'), (2, '民警')], default=0, verbose_name='调解状态'),
        ),
    ]
