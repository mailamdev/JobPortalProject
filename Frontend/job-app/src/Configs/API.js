import axios  from 'axios';

export let endpoints = {
    'categories': '/categories/',
    'posts': '/posts/',
    // 'post-detail': (postId) => `/posts/${postId}/`,
    'users': '/users/',
    'oauth2-info': '/oauth2-info/',

    'update-info': (userId) => `/users/${userId}/`,
    'current-user': '/users/current-user/',
    'login': '/o/token/',
    'companies': '/companies/',
    'add-companies': '/add-companies/',

    'company-jobs': (companyId) => `/companies/${companyId}/posts/`,
    'employees': '/employees/',
    'skillstag': '/skillstag/',
    'locations': '/locations/',
    'levels': '/levels/', 
    'save-job': (postId) => `/posts/${postId}/save-job/`,
    'apply-job': (postId) => `/posts/${postId}/apply-job/`,

    'saved-jobs': '/save-job/',
    'applied-jobs': '/apply-job/',

    'delete-saved-jobs': (jobId) => `/save-job/${jobId}`

    // 'saved-jobs': (userId) => `/users/${userId}/saved-jobs`
}


export default axios.create({
    baseURL: 'http://127.0.0.1:8000/',
})