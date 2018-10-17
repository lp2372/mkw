__author__ = 'lp'
__date__ = '18-10-17 下午5:17'

import xadmin
from xadmin import views
from .models import EmailVerifyRecord


class BaseSetting(object):
    """xadmin的基本配置"""
    enable_themes = True  # 开启主题切换功能
    use_bootswatch = True

xadmin.site.register(views.BaseAdminView, BaseSetting)

class GlobalSettings(object):
    """xadmin的全局配置"""
    site_title = "慕学网运营管理系统"  # 设置站点标题
    site_footer = "慕学集团有限公司"  # 设置站点的页脚
    menu_style = "accordion"  # 设置菜单折叠

xadmin.site.register(views.CommAdminView, GlobalSettings)


class EmailVerifyRecordAdmin(object):
    list_display = ['code','email','send_type','send_time']
    search_fields = ['code','email','send_type']

xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)

