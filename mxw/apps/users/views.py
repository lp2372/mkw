from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.views.generic import View
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.contrib.auth.hashers import make_password

from .models import UserProfile,EmailVerifyRecord
from .forms import LoginForm,RegisterForm
from operation.models import UserMessage
from utils.email_send import send_email

class CustomBacken(ModelBackend):
    """自定义authenticate"""
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username = username)|Q(email=username)|Q(mobile=username))
            if user.check_password(password):
                return user
            else:
                return None
        except Exception as e:
            return None

class EmailActiveView(View):
    def get(self,request,email,active_code):

        if active_code and email :
            email_code = EmailVerifyRecord.objects.get(email=email,code=active_code)
            if email_code:
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                return render(request,'login.html')






class RegisterView(View):
    """注册"""
    def get(self,request):
        register_form = RegisterForm()

        return render(request,'register.html',{'register_form':register_form})
    def post(self,request):
        register_form = RegisterForm(request.POST)
        print(register_form.is_valid())
        if register_form.is_valid():
            user_name = request.POST.get('email')
            password = request.POST.get('password')
            if UserProfile.objects.filter(email=user_name):
                return render(request,'register.html',{'msg':'该邮箱已存在'})
            #保存用户信息
            user_profile = UserProfile()
            user_profile.email = user_name
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(password)
            user_profile.save()
            # 发送邮箱激活邮件
            send_email(user_name)



            return render(request,'index.html')
        else:
            return render(request,'register.html',{'register_form':register_form})


class LoginView(View):
    """登陆"""
    def get(self,request):
        return render(request,'login.html')

    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("user_name", "")
            password = request.POST.get("password", "")
            user = authenticate(username=user_name,password=password) # authenticate函数验证账号密码 django默认只支持用户名登陆
            if user is not None:
                print(user)
                login(request, user)                                    # login登陆

                return render(request,'index.html')
            else:
                return render(request,'login.html',{'msg':'账号或者密码错误'})

        else:
            return render(request,'login.html',{'login_form':login_form})



