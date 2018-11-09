from django.conf.urls import include, url

from .views import UserInfoView,MyMessageView,MyFavOrgView,MyFavCourseView,MyFavTeacherView,UploadImageView,UpdatePwdView,SendEmailCodeView,UpdateEmailView,MyCourseView


urlpatterns = [


    url(r'^info/$', UserInfoView.as_view(),name='user_info'),
    url(r'^upload_image/$', UploadImageView.as_view(),name='upload_image'),
    url(r'^update_pwd/$', UpdatePwdView.as_view(),name='update_pwd'),
    url(r'^send_email_code/$', SendEmailCodeView.as_view(),name='send_email_code'),
    url(r'^update_email/$', UpdateEmailView.as_view(),name='update_email'),
    url(r'^mycourse/$', MyCourseView.as_view(),name='my_course'),
    url(r'^myfav/org$', MyFavOrgView.as_view(),name='myfav_org'),
    url(r'^myfav/teacher$', MyFavTeacherView.as_view(),name='myfav_teacher'),
    url(r'^myfav/course$', MyFavCourseView.as_view(),name='myfav_course'),
    url(r'^mymessage/$', MyMessageView.as_view(),name='my_message'),

]