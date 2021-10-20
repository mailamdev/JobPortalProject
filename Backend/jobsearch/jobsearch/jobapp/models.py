from django.contrib import admin
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.fields import DateTimeField, DateField
from ckeditor.fields import RichTextField
from django.utils.html import format_html


class User(AbstractUser):
    avatar = models.ImageField(upload_to='uploads/%Y/%m',default=None)
    phone_number = models.CharField(max_length=20, null=True, blank=True, default=None)
    is_recruiter = models.BooleanField(default=False)


class Company(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, default=None)
    name = models.CharField(max_length=100)
    description = RichTextField()
    image = models.ImageField(upload_to='company', default=None)
    address = models.CharField(max_length=100, unique=True)
    website = models.CharField(max_length=50, blank=True, null=True, unique=True)

    @admin.display
    def cv_link(self):
        return format_html('<a href="{}">{}</a>', ('/static/%s' % (self.image)),  ('/static/%s' % (self.image)))

    def __str__(self):
        return self.name


class Level(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name


class JobType(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name

class Location(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name



class SkillTag(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name 


class Post(models.Model):
    class Meta: 
        ordering = ["-created_date"]
    creater = models.ForeignKey(User, on_delete=models.CASCADE) 
    title = models.CharField(max_length=100)
    content = RichTextField()
    created_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)
    job_type = models.ForeignKey(JobType, on_delete=models.CASCADE)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    salary = models.CharField(max_length=50)
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    company = models.ForeignKey(Company, related_name="posts", on_delete=models.CASCADE)
    # *related_name: trong Company sẽ có thêm thuộc tính posts
    skill_tags = models.ManyToManyField(SkillTag)

    def __str__(self):
        return self.title




class Applied_Job(models.Model):
    user = models.ForeignKey(User, related_name='applied_jobs', on_delete=models.CASCADE)
    post = models.ForeignKey(Post, related_name='applicant', on_delete=models.CASCADE)
    date_applied = models.DateTimeField(auto_now_add=True)
    cv = models.FileField(upload_to='employee/cv', default=None)
    summary = models.TextField(default=None)

    @admin.display
    def cv_link(self):
        return format_html('<a href="{}">{}</a>', ('/static/%s' % (self.cv)),  ('/static/%s' % (self.cv)))

    def __str__(self):
        return self.post.title


class SavedJobs(models.Model):
    user = models.ForeignKey(User, related_name='saved_jobs', on_delete=models.CASCADE)
    post = models.ForeignKey(Post, related_name='saved', on_delete=models.CASCADE)
    date_saved = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.post.title

