from .models import Course,Lesson,Viedo,CourseResource
import xadmin


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree','learn_time','students','fav_num','image','click_num','add_time']
    search_fields = ['name', 'desc', 'detail', 'degree','learn_time','students','fav_num','image','click_num']
    list_filter = ['name', 'desc', 'detail', 'degree','learn_time','students','fav_num','image','click_num','add_time']

class LessonAdmin(object):
    list_display = ['name','course','add_time']
    search_fields = ['name','course__name']          # search_fields 里面必须全为字符类型
    list_filter = ['name','course__name','add_time'] # course_name   必须制定外键字段进行过滤

class ViedoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson__name', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']

class CourseResourceAdmin(object):

    list_display = ['course', 'name', 'download','add_time']
    search_fields = ['course__name', 'name', 'download',]
    list_filter = ['course__name', 'name', 'download','add_time']


xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Viedo,ViedoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)