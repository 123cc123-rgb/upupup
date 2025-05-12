"""
WSGI config for jczl_pro project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/
"""
#Python Web 应用的标准接口协议，为 Web 服务器（如 Nginx+uWSGI）提供一个入口，服务器通过这个文件加载 Django 应用
#WSGI 是 Python 标准库中的一个模块，用于将 Python 应用程序与 Web 服务器连接起来。
import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'jczl_pro.settings')

application = get_wsgi_application()
