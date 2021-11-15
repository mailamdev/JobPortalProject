
from django.db.models import fields
from django.db.models.fields import DateTimeField
from rest_framework.serializers import ModelSerializer
from .models import Applied_Job, Level, JobType, Location, Post, Company, SavedJobs,  SkillTag, User
from rest_framework import serializers

class UserSerializer(ModelSerializer):
    avatar = serializers.SerializerMethodField()
    
    def get_avatar(self, obj):
        request = self.context['request']
        if type(obj.avatar.name) != type(None):
            if obj.avatar.name.startswith('static/'):
                path = "/%s" % obj.avatar.name
            else:
                path = '/static/%s' % (obj.avatar)

            return request.build_absolute_uri(path)

    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "email", "username", "password", "avatar", "phone_number", "is_recruiter"]
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }
    
    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        
        return user


class SkillTagSerializer(ModelSerializer):
    class Meta:
        model = SkillTag
        fields = ["id", "name"]

class LevelSerializer(ModelSerializer):
     class Meta:
        model = Level
        fields = "__all__"

class JobTypeSerializer(ModelSerializer):
     class Meta:
        model = JobType
        fields = "__all__"
        
class LocationSerializer(ModelSerializer):
     class Meta:
        model = Location
        fields = "__all__"


class CompanySerializer(ModelSerializer):
    image = serializers.SerializerMethodField()
    def get_image(self, obj):
        request = self.context['request']
        if obj.image.name.startswith('static/'):
            path = "/%s" % obj.image.name
        else:
            path = '/static/%s' % (obj.image)

        return request.build_absolute_uri(path)
    class Meta:
        model = Company
        fields = ["id", "name", "description", "image", "address", "website", "user"]
    

class CompanyDetailSerializer(CompanySerializer):
    class Meta:
        model = CompanySerializer.Meta.model
        fields = CompanySerializer.Meta.fields + ['posts']    

class PostSerializer(ModelSerializer):
    skill_tags = SkillTagSerializer(many=True)
    job_type = JobTypeSerializer()
    level = LevelSerializer()
    location = LocationSerializer()
    company = CompanySerializer()
    
    class Meta:
        model = Post
        fields = ["id", "title", "created_date", "update_date", "job_type", "level", "salary", "location", "company", "skill_tags", "applicant"]

class PostDetailSerializer(PostSerializer):
    class Meta:
        model = PostSerializer.Meta.model
        fields = PostSerializer.Meta.fields + ['content']    


class SavedPostSerializer(ModelSerializer):
    user = UserSerializer()
    post = PostSerializer()

    class Meta:
        model = SavedJobs
        fields = ["id", "date_saved", "user", "post"]


class AppliedJobSerializer(ModelSerializer):
    cv = serializers.SerializerMethodField()
    def get_cv(self, obj):
        request = self.context['request']
        if obj.cv.name.startswith('static/'):
            path = "/%s" % obj.cv.name
        else:
            path = '/static/%s' % (obj.cv)

        return request.build_absolute_uri(path)
    user = UserSerializer()
    post = PostSerializer()

    class Meta:
        model = Applied_Job
        fields = ["id", "date_applied", "user", "post", "cv", "summary"]
