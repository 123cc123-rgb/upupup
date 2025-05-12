from django.contrib import admin
from django.urls import path, include
from django.views.static import serve
from django.conf import settings
from index import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('media/<path:path>', serve, {'document_root': settings.MEDIA_ROOT}),
    path('index/', include('index.url')),
    path('home/', views.index),

]
