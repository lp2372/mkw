from .models import Course,Lesson,Viedo,CourseResource
import xadmin


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree','learn_time','students','fav_num','image','click_num','add_time']
    search_fields = ['name', 'desc', 'detail', 'degree','learn_time','students','fav_num','image','click_num']
    list_filter = ['name', 'desc', 'detail', 'degree','learn_time','students','fav_num','image','click_num','add_time']

class LessonAdmin(object):
    list_display = ['name','course','add_time']
    search_fields = ['name','course']
    list_filter = ['name','course','add_time']

class ViedoAdmin(object):
    list_display = ['lesson', 'course', 'add_time']
    search_fields = ['lesson', 'course']
    list_filter = ['lesson', 'course', 'add_time']


xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Viedo,ViedoAdmin)
