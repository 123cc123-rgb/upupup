

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0002_talk_comments_user_dianzan_list'),
    ]

    operations = [
        migrations.AddField(
            model_name='talk',
            name='is_top',
            field=models.BooleanField(default=False, verbose_name='是否置顶'),
        ),
    ]
