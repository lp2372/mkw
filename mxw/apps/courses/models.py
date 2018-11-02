
from datetime import datetime

from django.db import models

from organization.models import CourseOrg,Teacher

# Create your models here.


class Course(models.Model):
    teacher = models.ForeignKey(Teacher,verbose_name='授课讲师',blank=True,null=True)
    course_org = models.ForeignKey(CourseOrg,verbose_name='课程机构',null=True,blank=True)
    name = models.CharField(max_length=50,verbose_name='课程名')
    desc  = models.CharField(max_length=300,verbose_name='课程描述')
    detail = models.TextField(verbose_name='课程详情')
    degree = models.CharField(choices=(('cj','初级'),('zj','中级'),('gj','高级')),verbose_name='课程等级',max_length=20)

    learn_time = models.IntegerField(default=0,verbose_name='学习时长')
    students = models.IntegerField(default=0,verbose_name='学习人数')
    fav_num = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m',verbose_name='封面图')
    click_num = models.IntegerField(default=0,verbose_name='点击量')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')
    category = models.CharField(max_length=20,verbose_name='课程类别',default='后端开发')
    tag = models.CharField(max_length=20,verbose_name='标签',default='')
    youneed = models.CharField(max_length=200,verbose_name='课程须知',default='')
    teacher_tell = models.CharField(max_length=200,verbose_name='老师告诉你',default='')


    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_lesson_num(self):
        return self.lesson_set.all().count()

    def get_learn_user(self):
        return self.usercourse_set.all()[:5]

    def get_lesson(self):
        return self.lesson_set.all()


class Lesson(models.Model):
    course = models.ForeignKey(Course,verbose_name='课程')
    name = models.CharField(max_length=100,verbose_name='章节名')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_viedo(self):
        return self.viedo_set.all()

class Viedo(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name='章节')
    name = models.CharField(max_length=100,verbose_name='视频名')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')
    url = models.CharField(max_length=200,verbose_name='视频链接',default='')
    learn_time = models.IntegerField(default=0,verbose_name='学习时长')
    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class CourseResource(models.Model):
    course = models.ForeignKey(Course,verbose_name='课程')
    name = models.CharField(max_length=100,verbose_name='名称')
    download = models.FileField(upload_to="course/resource/%Y/%m",max_length=100,verbose_name='资源文件')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    class Meta:
        verbose_name = u"课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name