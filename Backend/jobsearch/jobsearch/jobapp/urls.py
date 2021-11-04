
from django.contrib import admin
# from django.contrib.admin.sites import AdminSite
from django.urls import path, re_path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('posts',views.PostViewSet, basename='post')
router.register('add-post',views.AddPostViewSet, basename='add-post')
router.register('companies',views.CompanyViewSet, basename='company')
router.register('add-companies',views.AddCompanyViewSet, basename='add-company')
router.register('users',views.UserViewSet, basename='user')
router.register('save-job',views.SavedPostViewSet, basename='save-job')
router.register('apply-job',views.AppliedJobViewSet, basename='apply-job')
# router.register('applicants',views.ApplicantViewSet, basename='applicants')

router.register('skillstag',views.SkillTagViewSet, basename='skillstag')
router.register('locations',views.LocationViewSet, basename='locations')
router.register('levels',views.LevelViewSet, basename='levels')
router.register('jobtype',views.JobTypeViewSet, basename='jobtype')





#* /posts/ - GET 
#* /posts/ - POST
#* /posts/{post_id}/ - GET
#* /posts/{post_id}/ - PUT
#* /posts/{post_id}/ - DELETE

urlpatterns = [
    # path('', views.index, name="index"),
    # path('', admin.site.urls),
    path('', include(router.urls)),
    path('oauth2-info/', views.AuthInfo.as_view())
    # path('welcome/<str:year>/', views.welcome, name="welcome"),
    # path('test/', views.TestView.as_view()),
    # re_path(r'^welcome2/(?P<year>[0-9]{4})/$', views.welcome2, name="welcome2"),

]
# admin.site.site_title = "ITJobs"
# admin.site.site_header = "ITJobs Management"