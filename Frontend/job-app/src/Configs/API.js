import axios  from 'axios';

export let endpoints = {
    'posts': '/posts/',
    'add-post': '/add-post/',
    'save-job': (postId) => `/posts/${postId}/save-job/`,
    'apply-job': (postId) => `/posts/${postId}/apply-job/`,
    'hide-jobs': (postId) => `/posts/${postId}/hide-post/`,
    'applicants': (postId) => `/posts/${postId}/applicants/`,
    'delete-saved-jobs': (jobId) => `/save-job/${jobId}`,

    'oauth2-info': '/oauth2-info/',
    'users': '/users/',
    'update-info': (userId) => `/users/${userId}/`,
    'current-user': '/users/current-user/',
    'login': '/o/token/',

    'companies': '/companies/',
    'add-companies': '/add-companies/',
    'update-company': (companyId) => `/companies/${companyId}/`,
    'recruiter-company': (userId) => `/companies/${userId}/recruiter-company/`,
    'company-jobs': (companyId) => `/companies/${companyId}/posts/`,

    'skillstag': '/skillstag/',
    'locations': '/locations/',
    'levels': '/levels/', 
    'jobtype': '/jobtype/', 

    'saved-jobs': '/save-job/',
    'applied-jobs': '/apply-job/',
}


export default axios.create({
    baseURL: 'http://127.0.0.1:8000/',
})