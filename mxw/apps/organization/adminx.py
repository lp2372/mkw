__author__ = 'lp'
__date__ = '18-10-18 上午9:49'

import xadmin

from .models import CityDict,CourseOrg,Teacher

class CityDictAdmin(object):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc', ]
    list_filter = ['name', 'desc', 'add_time']

class CourseOrgAdmin(object):
    list_display = ['name', 'desc','click_num','fav_nums','image','address','city','add_time']
    search_fields = ['name', 'desc','click_num','fav_nums','image','address','city__name']
    list_filter = ['name', 'desc','click_num','fav_nums','image','address','city__name','add_time']

class TeacherAdminz(object):
    list_display = ['org','name', 'work_years','work_commpany','work_position','click_num','points','fav_num', 'add_time']
    search_fields = ['org__name','name', 'work_years','work_commpany','work_position','click_num','points','fav_num', ]
    list_filter = ['org__name','name', 'work_years','work_commpany','work_position','click_num','points','fav_num', 'add_time']

xadmin.site.register(CityDict,CityDictAdmin)
xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(Teacher,TeacherAdminz)
