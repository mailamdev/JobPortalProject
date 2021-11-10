
from typing import get_args
from django.contrib.admin.decorators import action
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse, Http404
from django.views import View
from django.conf import settings
from django.db.models import Q
from rest_framework import serializers, viewsets, permissions, status, generics, filters
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser
from rest_framework.pagination import PageNumberPagination
from rest_framework.views import APIView

from .models import Applied_Job, JobType, Level, Post, Company, SavedJobs, User, SkillTag
from .serializers import ( AppliedJobSerializer, CompanyDetailSerializer, JobTypeSerializer, LevelSerializer, LocationSerializer, PostSerializer, 
                        PostDetailSerializer,
                        CompanySerializer, 
                        SkillTagSerializer, 
                        UserSerializer, 
                        Location,
                        SavedPostSerializer)
from django.shortcuts import redirect
from django.contrib.auth import logout

class UserViewSet(viewsets.ViewSet, 
                generics.CreateAPIView, 
                generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True)
    parser_class = [MultiPartParser, ]
    serializer_class = UserSerializer

    def get_serializer_context(self):
        context = {'request': self.request}
        return context  

    def get_permissions(self):
        if self.action == 'current_user':
            return [permissions.IsAuthenticated()]
            
        return [permissions.AllowAny()]



    @action(methods=['get'], detail=False, url_path='current-user')
    def current_user(self, request):
        return Response(self.serializer_class(request.user, context={'request': self.request}).data)

    def get_object(self):
        return self.request.user

    def update(self, request,  *args, **kwargs):
        user = self.get_object()
        user.first_name = request.data['first_name']
        user.last_name = request.data['last_name']
        user.email = request.data['email']
        user.phone_number = request.data['phone_number']
        
        if 'avatar' in request.data:
            user.avatar = request.data['avatar']

        user.save()
        return Response(UserSerializer(user, context={'request': self.request}).data, status=status.HTTP_200_OK)   


        
class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)    


class PostPanigation(PageNumberPagination):
      page_size = 10

class CompanyPanigation(PageNumberPagination):
      page_size = 8


class PostViewSet(viewsets.ViewSet,
                    generics.ListAPIView, 
                    generics.RetrieveAPIView
                    ):
    serializer_class = PostDetailSerializer 
    pagination_class =  PostPanigation
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action in ['hide_post']:
            return [permissions.IsAuthenticated()]
            
        return [permissions.AllowAny()]

    def get_parsers(self):
        if getattr(self, 'swagger_fake_view', False):
            return []

        return super().get_parsers()
    
    # ẨN BÀI VIẾT
    @action(methods=['POST'], detail=True, url_path="hide-post", url_name="hide-post")
    # /posts/{pk}/hide-post
    def hide_post(self, request, pk):
        try: 
            p = Post.objects.get(pk=pk)
            p.active = False
            p.save()
        except Post.DoesNotExist: 
            return Response(status=status.HTTP_400_BAD_REQUEST)

        return Response(data=PostSerializer(p, context={'request': request}).data, status=status.HTTP_200_OK)

    # Có pk thì detail = true


    def get_queryset(self):
        posts = Post.objects.filter(active=True)
        # * Tìm kiếm việc làm
        q = self.request.query_params.get('q')
        location_id = self.request.query_params.get('location_id')
        level_id = self.request.query_params.get('level_id')
        if q is not None:
            if(location_id is not None): 
                if (level_id is not None):
                    posts = posts.filter(Q(title__icontains=q) |
                                            Q(skill_tags__name=q) | 
                                            Q(company__name__icontains=q)
                                            ,location=location_id, level=level_id).distinct()
                else:
                    posts = posts.filter(Q(title__icontains=q) |
                                            Q(skill_tags__name=q) | 
                                            Q(company__name__icontains=q)
                                            ,location=location_id).distinct()
            else:
                posts = posts.filter(Q(title__icontains=q) |
                                    Q(skill_tags__name=q) |
                                    Q(company__name__icontains=q)).distinct()
                
                    

        # * Lọc việc làm theo kỹ năng
        skill_id = self.request.query_params.get('skill_id')
        if skill_id is not None:
            posts = posts.filter(skill_tags=skill_id)

        # * Lọc việc làm theo cấp bậc 
        level_id = self.request.query_params.get('level_id')
        if level_id is not None:
            posts = posts.filter(level=level_id)

        # * Lọc việc làm theo khu vực
        location_id = self.request.query_params.get('location_id')
        if location_id is not None:
            posts = posts.filter(location=location_id)

        return posts

    @action(methods=['get'], detail=True, url_path='applicants')
    def get_applicants(self, request, pk):
        applicants = self.get_object().applicant.all()
        return Response(AppliedJobSerializer(applicants, many=True, context={'request': request}).data, status=status.HTTP_200_OK)

    # * Lưu bài đăng
    @action(methods=['post'], detail=True, url_path='save-job')
    def save_job(self, request, pk):
        user = request.user
        post = self.get_object()
        job = SavedJobs.objects.create(user=user, post=post)

        return Response(SavedPostSerializer(job, context={'request': request}).data, status=status.HTTP_200_OK)
        # 
    # * Ứng tuyển
    @action(methods=['post'], detail=True, url_path='apply-job')
    def apply_job(self, request, pk):
        user = request.user
        post = self.get_object()
        cv = request.data.get('cv')
        summary = request.data.get('summary')
        job = Applied_Job.objects.create(user=user, post=post, cv=cv, summary=summary)
    
        return Response(AppliedJobSerializer(job, context={'request': request}).data, status=status.HTTP_200_OK)    

class AddPostViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostDetailSerializer
    def get_serializer_context(self):
        context = {'request': self.request}
        return context  

   
    def create(self, request,  *args, **kwargs):
        creater = request.user
        title = request.data['title']
        content = request.data['content']
        job_type = JobType.objects.get(id=request.data['jobtype'])
        level = Level.objects.get(id=request.data['level'])
        salary = request.data['salary']
        location = Location.objects.get(id=request.data['location'])
        company = Company.objects.get(id=request.data['company'])

        post = Post.objects.create(creater=creater, title=title, content=content, job_type=job_type, level=level, salary=salary, location=location, company=company, )
        post.save()

        skill_list = list(request.data['skilltag'].split(','))

        for index in range(len(skill_list)):
            post.skill_tags.add(SkillTag.objects.get(pk=skill_list[index]))

        return Response(PostSerializer(post, context={'request': self.request}).data, status=status.HTTP_200_OK)    

class AddCompanyViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = Company.objects.all()
    serializer_class = CompanySerializer
    def get_serializer_context(self):
        context = {'request': self.request}
        return context  

   
    def create(self, request,  *args, **kwargs):
        user = request.user
        name = request.data['name']
        description = request.data['description']
        image = request.data['image']
        address = request.data['address']
        website = request.data['website']
        company = Company.objects.create(user=user, name=name, description=description, image=image, address=address, website=website)

        return Response(CompanySerializer(company, context={'request': self.request}).data, status=status.HTTP_200_OK)    


class CompanyViewSet(viewsets.ViewSet, generics.RetrieveAPIView, generics.ListAPIView, generics.CreateAPIView, generics.UpdateAPIView):
    queryset = Company.objects.all()
    serializer_class = CompanyDetailSerializer
    parser_class = [MultiPartParser, ]
    pagination_class =  CompanyPanigation


    def get_serializer_context(self):
        context = {'request': self.request}
        return context  

    @action(methods=['get'], detail=True, url_path="posts")
    def get_posts(self, request, pk):
        posts = self.get_object().posts.filter(active=True)
        
        return Response(PostSerializer(posts, many=True, context={'request': request}).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path="recruiter-company")
    def get_company(self, request, pk):
        user = self.request.user
        company = Company.objects.get(user=user)

        return Response(CompanyDetailSerializer(company, context={'request': request}).data, status=status.HTTP_200_OK)

    def update(self, request,  *args, **kwargs):
        user = request.user
        company = Company.objects.get(user=user)
        company.name = request.data['name']
        company.description = request.data['description']
        company.address = request.data['address']
        company.website = request.data['website']
        if 'image' in request.data:
            company.image = request.data['image']
        company.save()
        return Response(CompanySerializer(company, context={'request': self.request}).data, status=status.HTTP_200_OK)    

    

class SavedPostViewSet(viewsets.ViewSet, 
                        generics.ListAPIView, 
                        # generics.CreateAPIView, 
                        generics.DestroyAPIView,
                        generics.RetrieveAPIView
                        ):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = SavedPostSerializer

    def get_queryset(self):
        user = self.request.user
        posts = SavedJobs.objects.filter(user=user)

        return posts

    def destroy(self, request, *args, **kwargs):
        if request.user == self.get_object().user:
            return super().destroy(request, *args, **kwargs)
        return Response(status=status.HTTP_403_FORBIDDEN)


class AppliedJobViewSet(viewsets.ViewSet, 
                        generics.ListAPIView, 
                        generics.RetrieveAPIView
                        ):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = AppliedJobSerializer
    def get_queryset(self):
        user = self.request.user
        posts = Applied_Job.objects.filter(user=user)

        return posts


class SkillTagViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = SkillTag.objects.all()
    serializer_class = SkillTagSerializer
    filter_backends = [filters.OrderingFilter]
    ordering = ['id']

class LocationViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    filter_backends = [filters.OrderingFilter]
    ordering = ['id']

class LevelViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Level.objects.all()
    serializer_class = LevelSerializer
    filter_backends = [filters.OrderingFilter]
    ordering = ['id']
    

class JobTypeViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = JobType.objects.all()
    serializer_class = JobTypeSerializer
    filter_backends = [filters.OrderingFilter]
    ordering = ['id']
    

def logout_view(request):
    logout(request)
    response = redirect('/admin')
    response.delete_cookie('example_cookie')
    return response