from rest_framework.views import APIView
from rest_framework.viewsets import GenericViewSet
from rest_framework.mixins import ListModelMixin, CreateModelMixin, UpdateModelMixin
from django.shortcuts import render, redirect
from django.http import JsonResponse
from utils.response import ApiResponse
import requests
import json
from geopy.geocoders import Nominatim
from datetime import datetime
from .models import *
from .serializer import *
from rest_framework.filters import SearchFilter




class GetTuWenDescView(GenericViewSet, ListModelMixin):
    queryset = TuWen.objects.all()
    serializer_class = TuWenSerializer

    filter_backends = [SearchFilter]
    search_fields = ['id']


# 用户登录（手机号快捷登录）
class LoginByPhoneView(APIView):
    def post(self, request):
        js_code = request.data.get('code2')
        canshu_obj = CanShuSettings.objects.all().first()
        appid = canshu_obj.app_id
        secret = canshu_obj.app_serct
        js_code = js_code
        url2 = 'https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code' % (
            appid, secret, js_code)
        result = requests.get(url=url2)
        print(result.json())
        open_id = result.json()['openid']
        print("1")
        return_data = {}
        code = request.data.get('code')
        CanshuSettings_obj = CanShuSettings.objects.all().first()
        data = {
            'appid': CanshuSettings_obj.app_id,
            'secret': CanshuSettings_obj.app_serct,
            'grant_type': 'client_credential'

        }
        url = 'https://api.weixin.qq.com/cgi-bin/stable_token'
        hearder = {
            'Content-Type': 'text/plain'
        }
        print("2")
        header = {
            'Content-Type': 'application/json'
        }
        response = requests.post(url=url, data=json.dumps(data), headers=hearder)
        response_dic = json.loads(response.content)
        print("3","   ",response_dic)
        if response_dic.get('access_token'):
            access_token = response_dic.get('access_token')
            data2 = {
                'code': code
            }
            js_data2 = json.dumps(data2)
            response2 = requests.post(
                url=f'https://api.weixin.qq.com/wxa/business/getuserphonenumber?access_token={access_token}',
                data=js_data2, headers=hearder)
            response2_dic = json.loads(response2.content)
            if response2_dic.get('phone_info'):
                phone_number = response2_dic.get('phone_info').get('phoneNumber')
                user_obj = User.objects.filter(phone=phone_number).first()
                if user_obj:
                    return_data['uuid'] = user_obj.uuid
                    return ApiResponse(data=return_data)
                else:
                    name = '微信用户' + str(int(datetime.now().timestamp()))
                    password = str(int(datetime.now().timestamp())) + '123'
                    new_user_obj = User.objects.create(phone=phone_number, username=name, password=password,
                                                       open_id=open_id)

                    new_user_obj.save()
                    user_obj = User.objects.filter(phone=phone_number).first()
                    return_data['uuid'] = user_obj.uuid
                    return ApiResponse(data=return_data)
            else:
                return ApiResponse(status=500)

        else:

            return ApiResponse(status=500)


# 获取单个用户信息
class GetUserInfoView(APIView):
    def get(self, request):
        uuid = request.query_params.get('uuid')
        user_obj = User.objects.filter(uuid=uuid).first()
        return_data = None
        sc = 0
        if user_obj:
            return_data = {
                'id': uuid,
                'username': user_obj.username,
                'address': user_obj.address,
                'phone': user_obj.phone,
                'role': user_obj.get_role_display(),
                'avatar': get_media_url() + user_obj.avatar.name,
            }
        return ApiResponse(data=return_data)


# banner
class GetBannerView(GenericViewSet, ListModelMixin):
    queryset = Banner.objects.all()
    serializer_class = BannerSerializer


# 前端首页data
class GetIndexDataView(APIView):
    def get(self, request):

        re_data = {}
        objs = TuWen.objects.all()
        for i in objs:
            if re_data.get(i.type.name):
                re_data[i.type.name].append({
                    'title': i.title,
                    'created_date': i.created_date,
                    'id': i.id,

                })
            else:
                re_data[i.type.name] = [{
                    'title': i.title,
                    'created_date': i.created_date,
                    'id': i.id,

                }]

        return ApiResponse(data=re_data)


# 获取用户积分
class GetJiFenView(APIView):
    def get(self, request):
        uuid = request.query_params.get('uuid')
        user_obj = User.objects.filter(uuid=uuid).first()

        re_data = [0, []]
        jifen_objs = JiFenLog.objects.filter(user=user_obj).all()

        if jifen_objs:
            for i in jifen_objs:
                re_data[0] += i.jifen
                re_data[1].append({
                    'text': i.text,
                    'created_date': i.created_date,
                    'jifen': i.jifen,
                })

        return ApiResponse(data=re_data)


# 获取当前城市
class GetCityView(APIView):
    def get(self, request):
        uuid = request.query_params.get('uuid')
        user_obj = User.objects.filter(uuid=uuid).first()
        longitude = request.query_params.get('longitude')
        latitude = request.query_params.get('latitude')
        url = f'https://restapi.amap.com/v3/geocode/regeo?output=json&location={longitude},{latitude}&key=高德地图key&radius=1000&extensions=all'
        response = requests.get(url)
        city = json.loads(response.content).get('regeocode').get('addressComponent').get('city')
        desc_city = json.loads(response.content).get('regeocode').get('formatted_address')

        user_obj.address = desc_city
        user_obj.save()

        return ApiResponse(data=[city, desc_city])


# 获取异常类型
class GetYiChangTypeView(GenericViewSet, ListModelMixin):
    queryset = YiChangType.objects.all()
    serializer_class = YiChangTypeSerializer


# 创建资源
class CreateYiChangView(GenericViewSet, CreateModelMixin):
    queryset = YiChang
    serializer_class = YiChangSerializer

    def create(self, request, *args, **kwargs):
        text = request.data.get('text')
        address = request.data.get('address')
        phone = request.data.get('phone')
        type_id = request.data.get('type_id')
        uuid = request.data.get('uuid')
        img = request.FILES['img']
        type_obj = YiChangType.objects.filter(id=type_id).first()
        user_obj = User.objects.filter(uuid=uuid).first()
        YiChang.objects.create(type=type_obj, user=user_obj, img=img, phone=phone, address=address, text=text)

        return ApiResponse()


class GetUuidView(APIView):
    def get(self, request):
        data = {
            'uuid': get_uuid.uuid4()
        }
        return ApiResponse(data=data)


# 投诉类型
class GetTouSuTypeView(GenericViewSet, ListModelMixin):
    queryset = TouSuType.objects.all()
    serializer_class = TouSuTypeSerializer


# 创建投诉
class CreateTouSuView(GenericViewSet, CreateModelMixin):
    queryset = TouSu
    serializer_class = TouSuSerializer

    def create(self, request, *args, **kwargs):
        data_id = request.data.get('data_id', False)
        text = request.data.get('text')
        is_ni = int(request.data.get('is_ni'))
        another_user = request.data.get('another_user')
        phone = request.data.get('phone')
        type_id = request.data.get('type_id')
        img = request.data.get('img', False)
        img1 = request.data.get('img1', False)
        img2 = request.data.get('img2', False)

        uuid = request.data.get('uuid')
        type_obj = TouSuType.objects.filter(id=type_id).first()
        user_obj = User.objects.filter(uuid=uuid).first()
        y_obj = TouSu.objects.filter(data_id=data_id).first()
        if y_obj:
            if img1:
                y_obj.img1 = request.FILES['img1']
                y_obj.save()
            if img2:
                y_obj.img2 = request.FILES['img2']
                y_obj.save()
            return ApiResponse()
        else:
            y_obj = TouSu.objects.create(type=type_obj, user=user_obj, phone=phone, is_ni=is_ni, text=text,
                                         another_user=another_user, data_id=data_id)
            y_obj.img = request.FILES['img']
            y_obj.save()

            return ApiResponse()


# 纠纷类型
class GetJiuFenTypeView(GenericViewSet, ListModelMixin):
    queryset = JiuFenType.objects.all()
    serializer_class = JiuFenTypeSerializer


# 创建纠纷
class CreateJiuFenView(GenericViewSet, CreateModelMixin):
    queryset = JiuFen
    serializer_class = JiuFenSerializer

    def create(self, request, *args, **kwargs):
        data_id = request.data.get('data_id', False)
        type_id = request.data.get('type_id')
        uuid = request.data.get('uuid')

        apply_user = request.data.get('apply_user')
        apply_phone = request.data.get('apply_phone')
        apply_address = request.data.get('apply_address')
        other_user = request.data.get('other_user')
        other_phone = request.data.get('other_phone')
        other_address = request.data.get('other_address')
        text = request.data.get('text')
        suqiu = request.data.get('suqiu')

        img = request.data.get('img', False)
        img1 = request.data.get('img1', False)
        img2 = request.data.get('img2', False)

        type_obj = JiuFenType.objects.filter(id=type_id).first()
        user_obj = User.objects.filter(uuid=uuid).first()
        y_obj = JiuFen.objects.filter(data_id=data_id).first()
        if y_obj:
            if img1:
                y_obj.img1 = request.FILES['img1']
                y_obj.save()
            if img2:
                y_obj.img2 = request.FILES['img2']
                y_obj.save()
            return ApiResponse()
        else:
            y_obj = JiuFen.objects.create(
                data_id=data_id,
                type=type_obj,
                user=user_obj,
                apply_user=apply_user,
                apply_phone=apply_phone,
                apply_address=apply_address,
                other_user=other_user,
                other_phone=other_phone,
                other_address=other_address,
                text=text,
                suqiu=suqiu
            )
            y_obj.img = request.FILES['img']
            y_obj.save()

            return ApiResponse()




# 获取异常列表数据
class GetYiChangListView(GenericViewSet, ListModelMixin):
    queryset = YiChang.objects.all()
    serializer_class = YiChangSerializer2

    filter_backends = [SearchFilter]
    search_fields = ['user__uuid']


class GetJiuFenListView(GenericViewSet, ListModelMixin):
    queryset = JiuFen.objects.all()
    serializer_class = JiuFenSerializer2

    filter_backends = [SearchFilter]
    search_fields = ['user__uuid']


class GetTouSuListView(GenericViewSet, ListModelMixin):
    queryset = TouSu.objects.all()
    serializer_class = TouSuSerializer2

    filter_backends = [SearchFilter]
    search_fields = ['user__uuid']



# 获取异常详情
class GetYiChangDescView(GenericViewSet, ListModelMixin):
    queryset = YiChang.objects.all()
    serializer_class = YiChangSerializer3

    filter_backends = [SearchFilter]
    search_fields = ['id']


class GetJiuFenDescView(GenericViewSet, ListModelMixin):
    queryset = JiuFen.objects.all()
    serializer_class = JiuFenSerializer3

    filter_backends = [SearchFilter]
    search_fields = ['id']


class GetTouSuDescView(GenericViewSet, ListModelMixin):
    queryset = TouSu.objects.all()
    serializer_class = TouSuSerializer3

    filter_backends = [SearchFilter]
    search_fields = ['id']


# 创建帖子
class CreateTalkView(APIView):
    def post(self,request):
        uuid = request.data.get('uuid')
        data_id = request.data.get('data_id')
        title = request.data.get('title')
        content = request.data.get('content')
        user_obj = User.objects.filter(uuid=uuid).first()
        Talk.objects.create(author=user_obj,title=title,data_id=data_id,content=content)

        return ApiResponse()


class GetTalkView(APIView):
    def get(self,request):
        re_data = []
        top_list = []
        uuid = request.query_params.get('uuid')
        user_obj = User.objects.filter(uuid=uuid).first()

        talk_objs = Talk.objects.all().order_by('-id')
        if talk_objs:
            for i in talk_objs:
                if i.is_top:
                    data_item = {
                        'comments':[]
                    }
                    data_item['author'] = i.author.username
                    data_item['title'] = i.title
                    data_item['content'] = i.content
                    data_item['likeCount'] = i.likeCount
                    data_item['data_id'] = i.data_id
                    data_item['id'] = i.id

                    way_objs = user_obj.dianzan_list.all()

                    result = False

                    if way_objs:
                        for j in way_objs:
                            if j.id == i.id:
                                result = True
                    data_item['isLiked'] = result


                    comment_objs = Comments.objects.filter(talk=i).all()
                    if comment_objs:
                        for n in comment_objs:
                            data_item['comments'].append({
                                'author':n.author.username,
                                'content':n.content,
                                'id':n.id,
                                'data_id':n.data_id,
                            })


                    top_list.append(data_item)

            for i in talk_objs:
                if i.is_top == False:
                    data_item = {
                        'comments': []
                    }
                    data_item['author'] = i.author.username
                    data_item['title'] = i.title
                    data_item['content'] = i.content
                    data_item['likeCount'] = i.likeCount
                    data_item['data_id'] = i.data_id
                    data_item['id'] = i.id
                    data_item['fabu_key'] = ''

                    way_objs = user_obj.dianzan_list.all()

                    result = False

                    if way_objs:
                        for j in way_objs:
                            if j.id == i.id:
                                result = True
                    data_item['isLiked'] = result

                    comment_objs = Comments.objects.filter(talk=i).all()
                    if comment_objs:
                        for n in comment_objs:
                            data_item['comments'].append({
                                'author': n.author.username,
                                'content': n.content,
                                'id': n.id,
                                'data_id': n.data_id,
                            })
                    re_data.append(data_item)

        top_list = top_list + re_data

        return ApiResponse(data=top_list)



class GetMyTalkView(APIView):
    def get(self,request):
        re_data = []
        top_list = []
        uuid = request.query_params.get('uuid')
        user_obj = User.objects.filter(uuid=uuid).first()

        talk_objs = Talk.objects.filter(author=user_obj).all().order_by('-id')
        if talk_objs:
            for i in talk_objs:
                if i.is_top:
                    data_item = {
                        'comments':[]
                    }
                    data_item['author'] = i.author.username
                    data_item['title'] = i.title
                    data_item['content'] = i.content
                    data_item['likeCount'] = i.likeCount
                    data_item['data_id'] = i.data_id
                    data_item['id'] = i.id

                    way_objs = user_obj.dianzan_list.all()

                    result = False

                    if way_objs:
                        for j in way_objs:
                            if j.id == i.id:
                                result = True
                    data_item['isLiked'] = result


                    comment_objs = Comments.objects.filter(talk=i).all()
                    if comment_objs:
                        for n in comment_objs:
                            data_item['comments'].append({
                                'author':n.author.username,
                                'content':n.content,
                                'id':n.id,
                                'data_id':n.data_id,
                            })


                    top_list.append(data_item)

            for i in talk_objs:
                if i.is_top == False:
                    data_item = {
                        'comments': []
                    }
                    data_item['author'] = i.author.username
                    data_item['title'] = i.title
                    data_item['content'] = i.content
                    data_item['likeCount'] = i.likeCount
                    data_item['data_id'] = i.data_id
                    data_item['id'] = i.id
                    data_item['fabu_key'] = ''

                    way_objs = user_obj.dianzan_list.all()

                    result = False

                    if way_objs:
                        for j in way_objs:
                            if j.id == i.id:
                                result = True
                    data_item['isLiked'] = result

                    comment_objs = Comments.objects.filter(talk=i).all()
                    if comment_objs:
                        for n in comment_objs:
                            data_item['comments'].append({
                                'author': n.author.username,
                                'content': n.content,
                                'id': n.id,
                                'data_id': n.data_id,
                            })
                    re_data.append(data_item)

        top_list = top_list + re_data

        return ApiResponse(data=top_list)

# 添加喜欢
class AddScangView(APIView):
    def post(self, request):
        uuid = request.data.get('uuid')
        data_id = request.data.get('data_id')
        user_obj = User.objects.filter(uuid=uuid).first()
        talk_obj = Talk.objects.filter(data_id=data_id).first()
        talk_obj.likeCount += 1
        talk_obj.save()
        user_obj.dianzan_list.add(talk_obj)


        return ApiResponse()


# 取消喜欢
class QXScangView(APIView):
    def post(self, request):
        uuid = request.data.get('uuid')
        data_id = request.data.get('data_id')
        user_obj = User.objects.filter(uuid=uuid).first()
        talk_obj = Talk.objects.filter(data_id=data_id).first()
        talk_obj.likeCount -= 1
        talk_obj.save()
        user_obj.dianzan_list.remove(talk_obj)

        return ApiResponse()

# 添加评论

class AddCommentsView(APIView):
    def post(self, request):
        content = request.data.get('content')
        data_id = request.data.get('data_id')
        uuid = request.data.get('uuid')
        talk_id = request.data.get('id')
        user_obj = User.objects.filter(uuid=uuid).first()
        talk_obj = Talk.objects.filter(id=talk_id).first()
        Comments.objects.create(author=user_obj,data_id=data_id,content=content,talk=talk_obj)


        return ApiResponse()



def index(request):
    type_up1 = ['居民','治安积极分子','民警']
    type_up2 = ['已预约', '安排中', '调解中', '调解结束']
    value_map1 = {'居民': 0, '治安积极分子': 1, '民警': 2}
    value_map2 = {'已预约': 0, '安排中': 1, '调解中': 2, '调解结束': 3}  # 建立映射关系
    data_up1 = [
        {'value': User.objects.filter(role=value_map1[type_name]).count(),'name':type_name }
        for type_name in type_up1
    ]
    print(data_up1)
    data_up2 = [
        {'value': JiuFen.objects.filter(state=value_map2[type_name]).count(),'name': type_name}
        for type_name in type_up2
    ]
    print(data_up2)
    type_list1 = list(YiChangType.objects.values_list('name', flat=True))
    data_list1 = [
        {'name': type_name, 'value': YiChang.objects.filter(type__name=type_name).count()}
        for type_name in type_list1
    ]
    print(data_list1)


    type_list2 = list(JiuFenType.objects.values_list('name', flat=True))
    data_list2 = [
        {'name': type_name, 'value': JiuFen.objects.filter(type__name=type_name).count()}
        for type_name in type_list2
    ]


    type_list3 = list(TouSuType.objects.values_list('name', flat=True))
    data_list3 = [
        {'name': type_name, 'value': TouSu.objects.filter(type__name=type_name).count()}
        for type_name in type_list3
    ]


    return render(request, 'index.html', {
        'type_up1': json.dumps(type_up1),
        'type_up2': json.dumps(type_up2),
        'data_up1': json.dumps(data_up1),
        'data_up2': json.dumps(data_up2),
        'type_list_json1': json.dumps(type_list1),
        'data_list_json1': json.dumps(data_list1),
        'type_list_json2': json.dumps(type_list2),
        'data_list_json2': json.dumps(data_list2),
        'type_list_json3': json.dumps(type_list3),
        'data_list_json3': json.dumps(data_list3),
    })

