from django.db import models
from jczl_pro.utils.models import BaseModel
import uuid as get_uuid
from django.utils.html import format_html


def get_media_url():
    media_url = BaseSettings.objects.all().first().media_url
    # print(media_url)
    return media_url


# 基础设置表
class BaseSettings(BaseModel):
    media_url = models.CharField(verbose_name='media_url', max_length=64, null=True, blank=True)


# 参数设置表
class CanShuSettings(BaseModel):
    app_id = models.CharField(max_length=64, verbose_name='app_id', null=True, blank=True)
    app_serct = models.CharField(max_length=64, verbose_name='app_serct', null=True, blank=True)


# 用户表
class User(BaseModel):
    uuid = models.UUIDField(verbose_name='用户唯一标识', default=get_uuid.uuid4)
    phone = models.CharField(verbose_name='手机号', max_length=128, null=True, blank=True, unique=True)
    open_id = models.CharField(max_length=64, verbose_name='微信唯一标识', null=True, blank=True)
    avatar = models.FileField(verbose_name='头像', upload_to='avatar', default='avatar/avatar.svg')
    password = models.CharField(verbose_name='密码', max_length=128, null=True, blank=True)
    username = models.CharField(verbose_name='用户名', max_length=64, default='微信用户')
    dianzan_list = models.ManyToManyField(to='Talk',verbose_name='点赞的帖子',null=True,blank=True)
    address = models.TextField(verbose_name='地址', null=True, blank=True)
    role = models.SmallIntegerField(choices=((0, '居民'), (1, '治安积极分子'), (2, '民警')), verbose_name='身份',default=0)


    def avatar_data(self):
        return format_html(
            f'<img src="{get_media_url()}{self.avatar}" width="70px", height="70px"/>',

        )

    avatar_data.short_description = u'头像'

    def __str__(self):
        return self.username


# 首页图文
class TuWen(BaseModel):
    title = models.CharField(max_length=64, verbose_name='标题', null=True, blank=True)
    created_date = models.DateField(auto_now_add=True, verbose_name='创建日期')
    text = models.TextField(verbose_name='内容', null=True, blank=True)
    img = models.FileField(verbose_name='图片', upload_to='tuwen', null=True, blank=True)
    type = models.ForeignKey(to='TuWenType', verbose_name='图文分类', null=True, blank=True, on_delete=models.CASCADE)

    def img_data(self):
        return format_html(
            f'<img src="{get_media_url()}{self.img}" width="100px", height="70px"/>',

        )

    img_data.short_description = u'图片'


class TuWenType(BaseModel):
    name = models.CharField(max_length=64, verbose_name='图文分类名称', null=True, blank=True)

    def __str__(self):
        return self.name


# 首页轮播图
class Banner(BaseModel):
    img = models.FileField(verbose_name='轮播图', upload_to='banner', null=True, blank=True)

    def img_data(self):
        return format_html(
            f'<img src="{get_media_url()}{self.img}" width="100px", height="70px"/>',

        )

    img_data.short_description = u'轮播图'


# 积分记录
class JiFenLog(BaseModel):
    user = models.ForeignKey(to='User', verbose_name='用户', null=True, blank=True, on_delete=models.CASCADE)
    created_date = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    text = models.TextField(verbose_name='内容', null=True, blank=True)
    jifen = models.IntegerField(verbose_name='积分', default=0)


# 异常预警
class YiChang(BaseModel):
    type = models.ForeignKey(to='YiChangType', verbose_name='异常类型', null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(to='User', verbose_name='用户', null=True, blank=True, on_delete=models.CASCADE)
    img = models.FileField(verbose_name='图片', upload_to='img', null=True, blank=True)

    address = models.CharField(max_length=64, verbose_name='地址', null=True, blank=True)
    text = models.TextField(verbose_name='概况', null=True, blank=True)
    phone = models.CharField(max_length=64, verbose_name='手机号', null=True, blank=True)
    created_date = models.DateField(auto_now_add=True, verbose_name='创建日期')


# 异常预警类型
class YiChangType(BaseModel):
    name = models.CharField(max_length=64, verbose_name='异常类型名称', null=True, blank=True)

    def __str__(self):
        return self.name


# 投诉
class TouSu(BaseModel):
    type = models.ForeignKey(to='TouSuType', verbose_name='投诉类型', null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(to='User', verbose_name='用户', null=True, blank=True, on_delete=models.CASCADE)
    img = models.FileField(verbose_name='证据材料', upload_to='file', null=True, blank=True)
    another_user = models.CharField(max_length=64, verbose_name='投诉对象', null=True, blank=True)
    text = models.TextField(verbose_name='事件概况', null=True, blank=True)
    phone = models.CharField(max_length=64, verbose_name='联系方式', null=True, blank=True)
    is_ni = models.SmallIntegerField(choices=((0, '否'), (1, '是')), verbose_name='是否匿名', default=0)
    img1 = models.FileField(verbose_name='证据材料2', upload_to='file', null=True, blank=True)
    img2 = models.FileField(verbose_name='证据材料3', upload_to='file', null=True, blank=True)
    data_id = models.CharField(max_length=64, verbose_name='投诉资源id', null=True, blank=True)
    created_date = models.DateField(auto_now_add=True, verbose_name='创建日期')



# 投诉类型
class TouSuType(BaseModel):
    name = models.CharField(max_length=64, verbose_name='投诉类型名称', null=True, blank=True)

    def __str__(self):
        return self.name


# 纠纷
class JiuFen(BaseModel):
    type = models.ForeignKey(to='JiuFenType', verbose_name='纠纷类型', null=True, blank=True, on_delete=models.CASCADE)
    user = models.ForeignKey(to='User', verbose_name='用户', null=True, blank=True, on_delete=models.CASCADE)
    img = models.FileField(verbose_name='证据材料', upload_to='file', null=True, blank=True)
    img1 = models.FileField(verbose_name='证据材料2', upload_to='file', null=True, blank=True)
    img2 = models.FileField(verbose_name='证据材料3', upload_to='file', null=True, blank=True)
    data_id = models.CharField(max_length=64, verbose_name='纠纷资源id', null=True, blank=True)
    state = models.SmallIntegerField(choices=((0, '已预约'), (1, '安排中'), (2, '调解中'), (3, '调解结束')), verbose_name='调解状态',default=0)
    apply_user = models.CharField(max_length=64, verbose_name='申请人姓名', null=True, blank=True)
    apply_phone = models.CharField(max_length=64, verbose_name='申请人电话', null=True, blank=True)
    apply_address = models.CharField(max_length=64, verbose_name='申请人地址', null=True, blank=True)
    other_user = models.CharField(max_length=64, verbose_name='被申请人姓名', null=True, blank=True)
    other_phone = models.CharField(max_length=64, verbose_name='被申请人电话', null=True, blank=True)
    other_address = models.CharField(max_length=64, verbose_name='被申请人地址', null=True, blank=True)
    text = models.TextField(verbose_name='纠纷事实与理由', null=True, blank=True)
    suqiu = models.TextField(verbose_name='调解诉求', null=True, blank=True)
    created_date = models.DateField(auto_now_add=True, verbose_name='创建日期')


# 纠纷类型
class JiuFenType(BaseModel):
    name = models.CharField(max_length=64, verbose_name='纠纷类型名称', null=True, blank=True)

    def __str__(self):
        return self.name


class Talk(BaseModel):
    author = models.ForeignKey(to='User', verbose_name='作者', null=True, blank=True, on_delete=models.CASCADE)
    title = models.CharField(max_length=64, verbose_name='标题', null=True, blank=True)
    content = models.TextField(verbose_name='正文', null=True, blank=True)
    likeCount = models.IntegerField(verbose_name='点赞数', default=0)
    data_id = models.CharField(max_length=64, verbose_name='资源id', null=True, blank=True)
    is_top = models.BooleanField(verbose_name='是否置顶',default=False)

    def __str__(self):
        return self.title



class Comments(BaseModel):
    author = models.ForeignKey(to='User', verbose_name='用户', null=True, blank=True, on_delete=models.CASCADE)
    talk = models.ForeignKey(to='Talk', verbose_name='关联的贴子', null=True, blank=True, on_delete=models.CASCADE)
    content = models.TextField(verbose_name='内容', null=True, blank=True)
    data_id = models.CharField(max_length=64, verbose_name='资源id', null=True, blank=True)
