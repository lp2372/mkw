"""mxw URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
import xadmin
from django.views.generic import TemplateView
from django.views.static import serve

from users.views import LoginView,RegisterView,EmailActiveView,ForgetPwdView,RestPwdView,ModifyPwdView
from organization.views import  OrgView
from mxw.settings import MEDIA_ROOT

urlpatterns = [
    url(r'^xadmin/', include(xadmin.site.urls)),
    url(r'^$', TemplateView.as_view(template_name='index.html'),name='index'),
    url(r'^login/$',LoginView.as_view(),name='login'),
    url(r'^register/$',RegisterView.as_view(),name='register'),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<email>.*?)/(?P<active_code>.*)', EmailActiveView.as_view()),
    url(r'^forget/$', ForgetPwdView.as_view(),name='forget'),
    url(r'^forget/(?P<email>.*?)/(?P<active_code>.*)',RestPwdView.as_view(),name='rest_pwd'),
    url(r'^modify_pwd/$',ModifyPwdView.as_view(),name='modify_pwd'),

    url(r'^org/',include('organization.urls',namespace='org')),
    #上传文件访问处理函数
    url(r'^media/(?P<path>.*)',serve,{'document_root':MEDIA_ROOT}),

    url(r'^course/',include('courses.urls',namespace='course')),
]
