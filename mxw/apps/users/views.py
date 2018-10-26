from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.views.generic import View
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.contrib.auth.hashers import make_password

from .models import UserProfile,EmailVerifyRecord
from .forms import LoginForm,RegisterForm,ForgetForm,ModifyPwdForm
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
            email_code = EmailVerifyRecord.objects.filter(email=email,code=active_code,send_type='register')
            if email_code:
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
                email_code.delete()
                return render(request,'login.html')
            else:
                return render(request, 'active_faile.html')
        else:
            return render(request,'active_faile.html')

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
        if login_form.is_valid():  # 表单格式验证
            user_name = request.POST.get("user_name", "")
            password = request.POST.get("password", "")

            user = authenticate(username=user_name,password=password) # authenticate函数验证账号密码 django默认只支持用户名登陆
            if user is not None:
                if user.is_active == False: #是否激活
                    return render(request,'login.html',{'msg':'账号未激活','login_form':login_form})
                login(request, user)                                    # login登陆

                return render(request,'index.html')
            else:
                return render(request,'login.html',{'msg':'账号或者密码错误','login_form':login_form})

        else:
            return render(request,'login.html',{'login_form':login_form})

class ForgetPwdView(View):

    def get(self,request):
        forget_form = ForgetForm()
        return render(request,'forgetpwd.html',{'forget_form':forget_form})

    def post(self,request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email','')
            user = UserProfile.objects.filter(email=email)
            if user:
                send_email(email,'forget')
                return render(request,'send_success.html')
            else:
                return render(request,'forgetpwd.html',{'forget_form':forget_form,'msg':'该用户不存在'})
        else:
            return render(request,'forgetpwd.html',{'forget_form':forget_form})

class RestPwdView(View):

    def get(self,request,email,active_code):
        if email and active_code:
            email_recode = EmailVerifyRecord.objects.filter(email=email,code=active_code,send_type='forget')
            if email_recode:
                return render(request,'password_reset.html',{'email':email})
            else:
                return render(request,'404.html')
        else:
            return render(request, '404.html')

class ModifyPwdView(View):
    def get(self,request):
        return render(request,'forgetpwd.html')
    def post(self,request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            email = request.POST.get('email')
            pwd1 = request.POST.get('password1')
            pwd2 = request.POST.get('password2')
            if pwd1 != pwd2:
                return render(request,'password_reset.html',{'msg':'密码不一致'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd2)
            user.save()
            return render(request,'login.html')
        else:
            email = request.POST.get('email')
            return render(request,'password_reset.html',{'modify_form':modify_form,'email':email})


