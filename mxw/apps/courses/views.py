from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import JsonResponse
from django.db.models import Q
# Create your views here.

from .models import Course,CourseResource,Viedo
from operation.models import UserFavorite,CourseComment,UserCourse
from utils.mixin_utils import LoginRequiredMixin

class CourseListView(View):

    def get(self,request):

        all_course = Course.objects.all()
        hot_course = all_course.order_by('click_num')[:3]

        search_keywords = request.GET.get('keywords','')
        if search_keywords:
            all_course = all_course.filter(Q(name__icontains=search_keywords)|Q(desc__icontains=search_keywords)|Q(detail__icontains=search_keywords))

        sort = request.GET.get('sort','')
        if sort == '':
            all_course = all_course.order_by('-add_time')
        elif sort == 'hot':
            all_course = all_course.order_by('-click_num')
        elif sort == 'students':
            all_course = all_course.order_by('-students')

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_course, 3,request=request)

        courses = p.page(page)

        return render(request,'course-list.html',{
            'all_course' : courses,
            'sort':sort,
            'hot_course':hot_course

        })

class CourseDetailView(View):

    def get(self,request,course_id):

        course = Course.objects.get(id = int(course_id))
        course.click_num += 1
        course.save()

        has_fav_course = False
        has_fav_org = False

        if request.user.is_authenticated():
            if  UserFavorite.objects.filter(user=request.user,fav_id=course_id,fav_type=1):
                has_fav_course = True
            if  UserFavorite.objects.filter(user=request.user,fav_id=course.course_org.id,fav_type=2):
                has_fav_org = True

        tag = course.tag
        if tag:
            relate_course = Course.objects.filter(tag=tag)[:1]
        else:
            relate_course = []
        return render(request,'course-detail.html',{
            'course':course,
            'relate_courses':relate_course,
            'has_fav_course' : has_fav_course,
            'has_fav_org' : has_fav_org
        })

class CourseInfoView(LoginRequiredMixin,View):

    def get(self,request,course_id):

        course = Course.objects.get(id=int(course_id))
        #查询用户是否已经关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user,course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()
            course.students += 1
            course.save()
        #该课的同学还学过
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        relate_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [relate_user_course.course.id for relate_user_course in relate_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_num')[:5]

        course_resource = CourseResource.objects.filter(course=course)

        return render(request,'course-video.html',{
            'course':course,
            'course_resources':course_resource,
            'relate_courses':relate_courses
        })

class CommentView(View):

    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        course_resource = CourseResource.objects.filter(course=course)

        comments = CourseComment.objects.filter(course_id = course_id)

        return render(request,'course-comment.html',{
            'course': course,
            'course_resources': course_resource,
            'comments':comments
        })

class AddCommentView(View):

    def post(self,request):

        if not request.user.is_authenticated():
            return JsonResponse({"status":"fail","msg":"用户未登录"})

        course_id = request.POST.get("course_id")
        comment = request.POST.get("comments",'')

        if not all([course_id,comment]):
            return JsonResponse({"status":"fail","msg":"添加失败"})
        course = Course.objects.get(id = course_id)
        comments = CourseComment()
        comments.course = course
        comments.user = request.user
        comments.comment = comment
        comments.save()

        return JsonResponse({"status": "success", "msg": "添加成功"})

class ViedoPlayView(View):

    def get(self,request,viedo_id):
        viedo = Viedo.objects.get(id = viedo_id)
        course_id = viedo.lesson.course.id
        course = Course.objects.get(id=int(course_id))
        # 查询用户是否已经关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()
            course.students += 1
            course.save()
        # 该课的同学还学过
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        relate_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [relate_user_course.course.id for relate_user_course in relate_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_num')[:5]

        course_resource = CourseResource.objects.filter(course=course)

        return render(request,'course-play.html',{
            'course': course,
            'course_resources': course_resource,
            'relate_courses': relate_courses,
            'viedo':viedo
        })

