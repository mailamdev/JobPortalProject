from django.contrib import admin
from django.contrib.auth.models import Group, Permission
from django.utils.html import mark_safe
from django import forms
from .models import Applied_Job, Company, Location, Post, SkillTag, User, Level, JobType
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.urls import path
from django.template.response import TemplateResponse
from django.db.models import Count


class PostForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Post
        fields = '__all__'


class PostTagInline(admin.TabularInline):
    model = Post.skill_tags.through


class PostAdmin(admin.ModelAdmin):
    list_display = ["title", "company", "created_date", "active", "location", "level", "job_type", "salary"]
    search_fields = ["title", "company", "skill_tags"]
    list_filter = ["company", "location", "skill_tags"]
    form = PostForm
    inlines = (PostTagInline, )


class PostInLine(admin.StackedInline):
    model = Post
    fk_name = 'company'


class ApplicantAdmin(admin.ModelAdmin):
    list_display = [ "post", "user", "date_applied", "cv_link", "summary"]
    search_fields = ["user", "post"]
    list_filter = ["user", "post"] 


class LevelAdmin(admin.ModelAdmin):
    list_display = ["name"]

class JobTypeAdmin(admin.ModelAdmin):
    list_display = ["name"]

class LocationAdmin(admin.ModelAdmin):
    list_display = ["name"]


class SkillTagAdmin(admin.ModelAdmin):
    list_display = ["name"]


class CompanyForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Company
        fields = '__all__'

class CompanyAdmin(admin.ModelAdmin):
    list_display = ["name", "address", "website", "user"]
    search_fields = ["name", "address", "user__username"]
    list_filter = ["name", "user"]
    readonly_fields = ["logo"]
    form = CompanyForm 
    def logo(self, company):
        return mark_safe(
            '<img src="/static/{url}" alt="{alt}" width="200px"/>'\
                .format(url=company.image.name, alt=company.name))


class UserAdmin(admin.ModelAdmin):
    list_display = ["username", "email", "is_superuser", "is_staff", "is_active", "is_recruiter"]
    search_fields = ["username", "email"]


class JobAppAdminSite(admin.AdminSite):
    site_header = "ITJOBS MANAGEMENT"
    def get_urls(self):
        return [
            path('app-stats/', self.app_stats)
        ] + super().get_urls()

    def app_stats(self, request):
        company_count = Company.objects.count()
        stats = Company.objects.annotate(post_count=Count('post')).values("id", "name", "post_count")

        return TemplateResponse(request, 'admin/app-stats.html', {
            'company_count': company_count,
            'stats': stats
        })

admin.site = JobAppAdminSite(name='myadmin')
admin.site.register(Company, CompanyAdmin)
admin.site.register(Post, PostAdmin)
admin.site.register(Level, LevelAdmin)
admin.site.register(JobType, JobTypeAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(SkillTag)
admin.site.register(User, UserAdmin)
admin.site.register(Applied_Job, ApplicantAdmin)

# admin.site.register(Permission)
# admin.site.register(Group)
