from django.shortcuts import render
from django.views.generic import View

from .models import CityDict,CourseOrg


class OrgView(View):
    """课程机构列表"""
    def get(self,request):
        all_citys = CityDict.objects.all()
        all_orgs = CourseOrg.objects.all()
        org_nums = all_orgs.count()

        return render(request,'org-list.html',{
            'all_citys': all_citys,
            'all_orgs': all_orgs,
            'org_nums': org_nums
        })