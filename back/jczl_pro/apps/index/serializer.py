from rest_framework import serializers
from .models import *


# 获取图文
class TuWenSerializer(serializers.ModelSerializer):
    class Meta:
        model = TuWen
        fields = '__all__'


# 所有积分规则
class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Banner
        fields = '__all__'


# 所有异常预警类型
class YiChangTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = YiChangType
        fields = '__all__'


# 所有异常预警
class YiChangSerializer(serializers.ModelSerializer):
    class Meta:
        model = YiChang
        fields = '__all__'


# 所有投诉类型
class TouSuTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = TouSuType
        fields = '__all__'


# 所有投诉
class TouSuSerializer(serializers.ModelSerializer):
    class Meta:
        model = TouSu
        fields = '__all__'


# 所有纠纷类型
class JiuFenTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = JiuFenType
        fields = '__all__'


# 所有纠纷
class JiuFenSerializer(serializers.ModelSerializer):
    class Meta:
        model = JiuFen
        fields = '__all__'



class YiChangSerializer2(serializers.ModelSerializer):
    type = serializers.CharField(source='type.name', read_only=True)

    class Meta:
        model = YiChang
        fields = ['type', 'created_date', 'id']


class JiuFenSerializer2(serializers.ModelSerializer):
    type = serializers.CharField(source='type.name', read_only=True)

    class Meta:
        model = JiuFen
        fields = ['type', 'created_date', 'id']


# 所有投诉
class TouSuSerializer2(serializers.ModelSerializer):
    type = serializers.CharField(source='type.name', read_only=True)

    class Meta:
        model = TouSu
        fields = ['type', 'created_date', 'id']




class YiChangSerializer3(serializers.ModelSerializer):
    type = serializers.CharField(source='type.name', read_only=True)

    class Meta:
        model = YiChang
        fields = ['type', 'created_date', 'img', 'address', 'text', 'phone']


class JiuFenSerializer3(serializers.ModelSerializer):
    type = serializers.CharField(source='type.name', read_only=True)

    state = serializers.SerializerMethodField()

    def get_state(self, obj):
        return obj.get_state_display()

    class Meta:
        model = JiuFen
        fields = ['type', 'created_date', 'img', 'state', 'img1', 'img2', 'apply_user', 'apply_phone', 'apply_address',
                  'other_user', 'other_phone', 'other_address', 'text', 'suqiu']


# 所有投诉
class TouSuSerializer3(serializers.ModelSerializer):
    type = serializers.CharField(source='type.name', read_only=True)

    is_ni = serializers.SerializerMethodField()

    def get_is_ni(self, obj):
        return obj.get_is_ni_display()

    class Meta:
        model = TouSu
        fields = ['type', 'created_date', 'img', 'another_user', 'text', 'phone', 'is_ni', 'img1', 'img2', ]


