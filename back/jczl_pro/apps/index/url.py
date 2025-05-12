from rest_framework.routers import SimpleRouter
from . import views
from django.urls import path

router = SimpleRouter()

router.register('get_banner', views.GetBannerView, 'get_banner')

router.register('get_yichangtype', views.GetYiChangTypeView, 'get_yichangtype')
router.register('create_yichang', views.CreateYiChangView, 'create_yichang')

router.register('get_tousutype', views.GetTouSuTypeView, 'get_tousutype')
router.register('create_tousu', views.CreateTouSuView, 'create_tousu')

router.register('get_jiufentype', views.GetJiuFenTypeView, 'get_jiufentype')
router.register('create_jiufen', views.CreateJiuFenView, 'create_jiufen')


router.register('get_yichang_list', views.GetYiChangListView, 'get_yichang_list')
router.register('get_jiufen_list', views.GetJiuFenListView, 'get_jiufen_list')
router.register('get_tousu_list', views.GetTouSuListView, 'get_tousu_list')


router.register('get_yichang_desc', views.GetYiChangDescView, 'get_yichang_desc')
router.register('get_jiufen_desc', views.GetJiuFenDescView, 'get_jiufen_desc')
router.register('get_tousu_desc', views.GetTouSuDescView, 'get_tousu_desc')



router.register('get_tuwen_desc', views.GetTuWenDescView, 'get_tuwen_desc')








urlpatterns = [

    path('login_by_phone/', views.LoginByPhoneView.as_view()),
    path('get_user_info/', views.GetUserInfoView.as_view()),
    path('get_index_data/', views.GetIndexDataView.as_view()),
    path('get_jifen/', views.GetJiFenView.as_view()),
    path('get_city/', views.GetCityView.as_view()),
    path('get_uuid/', views.GetUuidView.as_view()),
    path('cerate_talk/', views.CreateTalkView.as_view()),
    path('get_talk/', views.GetTalkView.as_view()),
    path('get_my_talk/', views.GetMyTalkView.as_view()),
    path('add_zan/', views.AddScangView.as_view()),
    path('qx_zan/', views.QXScangView.as_view()),
    path('add_com/', views.AddCommentsView.as_view()),
    # path('home/', views.index.as_view())

]

urlpatterns += router.urls
