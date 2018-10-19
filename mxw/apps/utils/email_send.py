__author__ = 'lp'
__date__ = '18-10-18 下午9:37'

from random import Random

from users.models import EmailVerifyRecord
from django.core.mail import send_mail
from mxw.settings import EMAIL_FROM

def random_str(random_length=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(random_length):
        str+= chars[random.randint(0,length)]
    return str


def send_email(email,send_type='register'):
    code = random_str()
    email_record = EmailVerifyRecord()
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type

    if send_type == 'register':
        email_title = "慕学在线网注册激活链接"
        email_body = "请点击下面的链接激活你的账号: http://127.0.0.1:8000/active/" + email + "/" "{0}".format(code)

        status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if status:
            print('TRUE')


