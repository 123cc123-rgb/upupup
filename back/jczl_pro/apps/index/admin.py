from django.contrib import admin
from .models import *
from django.urls import reverse
from django.utils.html import format_html
from django.utils.safestring import mark_safe

admin.site.site_header = '数治枫桥'  # 设置header
admin.site.site_title = '数治枫桥'  # 设置title


@admin.register(BaseSettings)
class CycAdmin(admin.ModelAdmin):
    list_display = ('media_url', 'caozuo',)

    def caozuo(self, obj):
        edit_url = reverse('admin:index_basesettings_change', args=[obj.pk])
        delete_url = reverse('admin:index_basesettings_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'

        )

    caozuo.short_description = u'操作'


@admin.register(CanShuSettings)
class CycAdmin(admin.ModelAdmin):
    list_display = ('id', 'app_id', 'app_serct', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_canshusettings_change', args=[obj.pk])
        delete_url = reverse('admin:index_canshusettings_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'

        )

    caozuo.short_description = u'操作'


@admin.register(User)
class CycAdmin(admin.ModelAdmin):
    list_display = ('username', 'phone', 'avatar_img', 'role','address','caozuo')
    search_fields = (['username','phone','role','address'])
    list_filter = (['role'])

    @admin.display(description='头像')
    def avatar_img(self, obj):
        div = f"<img src='{obj.avatar.url}' width='32px'>"
        return mark_safe(div)

    def caozuo(self, obj):
        edit_url = reverse('admin:index_user_change', args=[obj.pk])
        delete_url = reverse('admin:index_user_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'

        )

    caozuo.short_description = u'操作'


@admin.register(TuWen)
class CycAdmin(admin.ModelAdmin):
    list_display = ('title', 'created_date', 'text', 'type', 'img_data', 'caozuo')

    list_filter = ('type',)

    def caozuo(self, obj):
        edit_url = reverse('admin:index_tuwen_change', args=[obj.pk])
        delete_url = reverse('admin:index_tuwen_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'

        )

    caozuo.short_description = u'操作'


@admin.register(TuWenType)
class CycAdmin(admin.ModelAdmin):
    list_display = ('name', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_tuwentype_change', args=[obj.pk])
        delete_url = reverse('admin:index_tuwentype_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'

        )

    caozuo.short_description = u'操作'


@admin.register(Banner)
class CycAdmin(admin.ModelAdmin):
    list_display = ('img_data', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_banner_change', args=[obj.pk])
        delete_url = reverse('admin:index_banner_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'

        )

    caozuo.short_description = u'操作'


@admin.register(JiFenLog)
class CycAdmin(admin.ModelAdmin):
    list_display = ('user', 'created_date', 'text', 'jifen', 'caozuo')
    search_fields = (['user__username', 'text'])
    #list_filter = ([''])

    def caozuo(self, obj):
        edit_url = reverse('admin:index_jifenlog_change', args=[obj.pk])
        delete_url = reverse('admin:index_jifenlog_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'

        )

    caozuo.short_description = u'操作'


@admin.register(YiChang)
class CycAdmin(admin.ModelAdmin):
    list_display = ('type', 'user', 'address','phone','caozuo')
    search_fields = (['user__username', 'phone', 'text','address'])
    list_filter = (['type'])


    def caozuo(self, obj):
        edit_url = reverse('admin:index_yichang_change', args=[obj.pk])
        delete_url = reverse('admin:index_yichang_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'


@admin.register(YiChangType)
class CycAdmin(admin.ModelAdmin):
    list_display = ('name', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_yichangtype_change', args=[obj.pk])
        delete_url = reverse('admin:index_yichangtype_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'


@admin.register(TouSu)
class CycAdmin(admin.ModelAdmin):
    list_display = ('type', 'user','another_user','caozuo')
    search_fields = (['user__username', 'phone', 'text','another_user'])
    list_filter = (['type'])

    def caozuo(self, obj):
        edit_url = reverse('admin:index_tousu_change', args=[obj.pk])
        delete_url = reverse('admin:index_tousu_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'


@admin.register(TouSuType)
class CycAdmin(admin.ModelAdmin):
    list_display = ('name', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_tousutype_change', args=[obj.pk])
        delete_url = reverse('admin:index_tousutype_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'


@admin.register(JiuFen)
class CycAdmin(admin.ModelAdmin):
    list_display = ('type', 'user', 'apply_user', 'other_user', 'state', 'caozuo')
    search_fields = (['apply_user', 'other_user', 'text'])
    list_filter = (['type','state'])

    def caozuo(self, obj):
        edit_url = reverse('admin:index_jiufen_change', args=[obj.pk])
        delete_url = reverse('admin:index_jiufen_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'


@admin.register(JiuFenType)
class CycAdmin(admin.ModelAdmin):
    list_display = ('name', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_jiufentype_change', args=[obj.pk])
        delete_url = reverse('admin:index_jiufentype_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'



@admin.register(Talk)
class CycAdmin(admin.ModelAdmin):
    list_display = ('author','title','content','likeCount','is_top', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_talk_change', args=[obj.pk])
        delete_url = reverse('admin:index_talk_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'


@admin.register(Comments)
class CycAdmin(admin.ModelAdmin):
    list_display = ('author','talk','content', 'caozuo')

    def caozuo(self, obj):
        edit_url = reverse('admin:index_comments_change', args=[obj.pk])
        delete_url = reverse('admin:index_comments_delete', args=[obj.pk])
        return format_html(

            f'<a href="{edit_url}" style="color: red;">编辑</a> | <a href="{delete_url}" style="color: red;">删除</a>'
        )

    caozuo.short_description = u'操作'