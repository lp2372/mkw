__author__ = 'lp'
__date__ = '18-10-30 上午10:02'

from django.conf.urls import url

from .views import CourseListView,CourseDetailView,ViedoPlayView,CourseInfoView,CommentView,AddCommentView

urlpatterns = [
    url("^list/$",CourseListView.as_view(),name='course_list'),
    url("^detail/(?P<course_id>\d+)$",CourseDetailView.as_view(),name='course_detail'),
    url("^info/(?P<course_id>\d+)$",CourseInfoView.as_view(),name='course_info'),
    url("^comment/(?P<course_id>\d+)$",CommentView.as_view(),name='course_comment'),
    url("^add_commment/$",AddCommentView.as_view(),name='add_comment'),
    url("^viedo/(?P<viedo_id>\d+)$",ViedoPlayView.as_view(),name='viedo_pay'),
]