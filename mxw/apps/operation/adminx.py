__author__ = 'lp'
__date__ = '18-10-18 上午10:03'

import xadmin

from .models import UserAsk,CourseComment,UserFavorite,UserMessage,UserCourse

class UserAskAdmin(object):
    list_display = ['name', 'mobile','course_name','add_time']
    search_fields =  ['name', 'mobile','course_name']
    list_filter = ['name', 'mobile','course_name','add_time']

class CourseCommentAdmin(object):
    list_display = ['user', 'course', 'comment', 'add_time']
    search_fields = ['user__name', 'course__name', 'comment']
    list_filter = ['user__name', 'course__name', 'comment', 'add_time']

class UserFavoriteAdmin(object):
    list_display = ['user', 'fav_id', 'fav_type', 'add_time']
    search_fields = ['user__name', 'fav_id', 'fav_type']
    list_filter = ['user__name', 'fav_id', 'fav_type', 'add_time']

class UserMessageAdmin(object):
    list_display = ['user', 'message', 'has_read', 'add_time']
    search_fields = ['user', 'message', 'has_read']
    list_filter = ['user', 'message', 'has_read']

class UserCourseAdmin(object):
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user__name', 'course__name']
    list_filter = ['user__name', 'course__name', 'add_time']

xadmin.site.register(UserAsk,UserAskAdmin)
xadmin.site.register(CourseComment,CourseCommentAdmin)
xadmin.site.register(UserFavorite,UserFavoriteAdmin)
xadmin.site.register(UserMessage,UserMessageAdmin)
xadmin.site.register(UserCourse,UserCourseAdmin)

