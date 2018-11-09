from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import JsonResponse

from .models import CityDict,CourseOrg
from .forms import UserAskForm
from operation.models import UserFavorite,Teacher
from courses.models import Course


class OrgView(View):
    """课程机构列表"""
    def get(self,request):
        all_citys = CityDict.objects.all()
        all_orgs = CourseOrg.objects.all()


        hot_orgs = all_orgs.order_by("-click_num")[:4]
        #城市筛选
        city_id = request.GET.get('city','')
        if city_id:
            all_orgs = all_orgs.filter(city_id = int(city_id))

        # 机构分类筛选
        ct = request.GET.get('ct','')
        if ct:
            all_orgs = all_orgs.filter(category=ct)
        #学习人数课程数排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.order_by('-students')
            elif sort == 'courses':
                all_orgs = all_orgs.order_by('-course_nums')

        org_nums = all_orgs.count()
        #分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_orgs,5, request=request)
        orgs = p.page(page)

        return render(request,'org-list.html',{
            'all_citys': all_citys,
            'all_orgs': orgs,
            'org_nums': org_nums,
            'city_id': city_id,
            'ct':  ct,
            'hot_orgs':hot_orgs,
            'sort': sort
        })

class AddUserAskView(View):

    def post(self,request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return JsonResponse({'status':'success'})
        else:
            return JsonResponse({'status':'fail','msg':'添加失败'})

class OrgHomeView(View):

    def get(self,request,org_id):
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=org_id,fav_type=2):
                has_fav = True

        current_page = 'home'
        course_org = CourseOrg.objects.get(id=org_id)
        all_course = course_org.course_set.all()[:3]
        all_teacher = course_org.teacher_set.all()[:1]

        return render(request,'org-detail-homepage.html',{
            'all_courses' : all_course,
            'all_teachers' : all_teacher,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav':has_fav
        })

class OrgCourseView(View):

    def get(self,request,org_id):
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=org_id, fav_type=2):
                has_fav = True
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=org_id)
        all_course = course_org.course_set.all()[:3]


        return render(request,'org-detail-course.html',{
            'all_courses' : all_course,

            'course_org':course_org,
            'current_page': current_page,
            'has_fav': has_fav
        })

class OrgDescView(View):

    def get(self,request,org_id):
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=org_id, fav_type=2):
                has_fav = True
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=org_id)

        return render(request,'org-detail-desc.html',{

            'course_org':course_org,
            'current_page': current_page,
            'has_fav': has_fav
        })

class OrgTeacherView(View):

    def get(self,request,org_id):
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=org_id, fav_type=2):
                has_fav = True
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=org_id)
        all_teacher = course_org.teacher_set.all()


        return render(request,'org-detail-teachers.html',{

            'course_org':course_org,
            'current_page': current_page,
            'all_teacher' : all_teacher,
            'has_fav': has_fav
        })

class AddFavView(View):

    def post(self,request):
        fav_id = int(request.POST.get('fav_id',0))
        fav_type = int(request.POST.get('fav_type',0))

        if not request.user.is_authenticated():
            return JsonResponse({"status":"fail","msg":"用户未登录"})


        exist_records = UserFavorite.objects.filter(user=request.user,fav_id=fav_id,fav_type=fav_type)

        if exist_records: # 存在则取消收藏
            exist_records.delete()
            if fav_type == 1:
                course = Course.objects.get(id=fav_id)
                course.fav_num -= 1
                course.save()
            elif fav_type == 2:
                course_org = CourseOrg.objects.get(id=fav_id)
                course_org.fav_num -= 1
                course_org.save()
            elif fav_type == 3:
                teacher = Teacher.objects.get(id=fav_id)
                teacher.fav_num -= 1
                teacher.save()
            return JsonResponse({"status":"success","msg":"收藏"})
        if fav_id > 0 and fav_type > 0:
            user_fav = UserFavorite()
            user_fav.user = request.user
            user_fav.fav_id = int(fav_id)
            user_fav.fav_type = int(fav_type)
            user_fav.save()
            # fav_type =((1, '课程'), (2, '课程机构'), (3, '教师')), default=1, verbose_name='收藏类型')
            if fav_type == 1:
                course = Course.objects.get(id=fav_id)
                course.fav_num += 1
                course.save()
            elif fav_type ==2:
                course_org = CourseOrg.objects.get(id=fav_id)
                course_org.fav_num += 1
                course_org.save()
            elif fav_type == 3:
                teacher = Teacher.objects.get(id=fav_id)
                teacher.fav_num += 1
                teacher.save()

            return JsonResponse({"status": "success", "msg": "已收藏"})
        else:
            return JsonResponse({"status": "fail", "msg": "收藏出错"})

class TeacherListView(View):

    def get(self,request):

        teacher_list = Teacher.objects.all()
        teacher_count = teacher_list.count()
        hot_teachers = teacher_list.order_by('-click_num')[:3]
        sort = request.GET.get('sort','')
        if sort == 'hot':
            teacher_list = teacher_list.order_by('-click_num')
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1


        p = Paginator(teacher_list,1, request=request)

        teachers = p.page(page)

        return render(request,'teachers-list.html',{
            'teacher_list':teachers,
            'teacher_count':teacher_count,
            'sort':sort,
            'hot_teachers':hot_teachers
        })

class TeacherDetailView(View):

    def get(self,request,teacher_id):

        teacher = Teacher.objects.get(id=teacher_id)
        courses = Course.objects.filter(teacher=teacher)
        hot_teachers = Teacher.objects.all().order_by('-click_num')[:3]

        has_fav_teacher =False
        has_fav_org = False

        if request.user.is_authenticated():
            fav_teacher = UserFavorite.objects.filter(user=request.user,fav_id=teacher.id,fav_type=3)
            fav_org = UserFavorite.objects.filter(user=request.user,fav_id=teacher.org.id,fav_type=2)
            if fav_teacher:
                has_fav_teacher = True
            if fav_org:
                has_fav_org = True


        return render(request,'teacher-detail.html',{
            'teacher':teacher,
            'courses':courses,
            'hot_teachers':hot_teachers,
            'has_fav_teacher':has_fav_teacher,
            'has_fav_org':has_fav_org
        })
