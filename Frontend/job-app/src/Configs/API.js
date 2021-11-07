import axios  from 'axios';

export let endpoints = {
    'posts': '/posts/',
    'users': '/users/',
    'oauth2-info': '/oauth2-info/',
    'update-info': (userId) => `/users/${userId}/`,
    'current-user': '/users/current-user/',
    'login': '/o/token/',
    'companies': '/companies/',
    'add-companies': '/add-companies/',
    'add-post': '/add-post/',
    'update-company': (companyId) => `/companies/${companyId}/`,
    'recruiter-company': (userId) => `/companies/${userId}/recruiter-company/`,
    'company-jobs': (companyId) => `/companies/${companyId}/posts/`,
    'hide-jobs': (postId) => `/posts/${postId}/hide-post/`,

    'applicants': (postId) => `/posts/${postId}/applicants/`,
    'skillstag': '/skillstag/',
    'locations': '/locations/',
    'levels': '/levels/', 
    'jobtype': '/jobtype/', 
    'save-job': (postId) => `/posts/${postId}/save-job/`,
    'apply-job': (postId) => `/posts/${postId}/apply-job/`,

    'saved-jobs': '/save-job/',
    'applied-jobs': '/apply-job/',

    'delete-saved-jobs': (jobId) => `/save-job/${jobId}`

}


export default axios.create({
    baseURL: 'http://127.0.0.1:8000/',
})