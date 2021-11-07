import { useState, useEffect } from "react"
import API, { endpoints } from '../../Configs/API'
import cookies from 'react-cookies'
import Loading from "../Loading"
import { Button, Row } from "react-bootstrap"
import {faClipboard, faBriefcase, faEdit } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { Link } from 'react-router-dom'
import Moment from 'react-moment';


export default function RecruitmentJob() {
    const user = cookies.load('user')
    let [company, setCompany] = useState(null) 
    let [posts, setPosts] = useState(null) 

    useEffect(() => {
        async function getCompany() {
            let res = await API.get(endpoints['recruiter-company'](user.id), {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setCompany(res.data.id)
        }
        getCompany()
        if (company !== null) {
            async function getPosts() {
                let res = await API.get(endpoints["company-jobs"](company), {
                    headers: {
                    'Authorization':  `Bearer ${cookies.load('access_token')}`
                    }
                })
                setPosts(res.data)
            }
            getPosts()
        }
    }, [user.id, company])


    

    return(
        <>
        {posts === null ?  (<Loading/>) : (
             <div className="container-fluid bootstrap snippets bootdey main">
             <div className="row">
               <div className="profile-nav col-md-2">
                   <div className="panel">
                       <ul className="nav nav-pills nav-stacked">
                           <li><Link to="/recruitment"> 
                             <FontAwesomeIcon icon={faBriefcase} className="icon"></FontAwesomeIcon>
                               Thông tin công ty</Link></li>
                           {/* <li><Link to="#"> 
                           <FontAwesomeIcon icon={faFileAlt} className="icon"></FontAwesomeIcon>
                             Quản lý CV</Link></li> */}
                           <li  className="active"><Link to="/recruitment-jobs"> 
                           <FontAwesomeIcon icon={faClipboard} className="icon"></FontAwesomeIcon>
                             Danh sách tuyển dụng</Link></li>
                             <li><Link to="/add-post"> 
                            <FontAwesomeIcon icon={faEdit} className="icon"></FontAwesomeIcon>
                                Đăng tuyển</Link></li>
                       </ul>
                   </div>
               </div>
               <div className="col-xl-10 col-lg-10 col-md-12 col-sm-12 col-12">
                    <div className="card h-100">
                        <div className="card-body">
                            <div className="jobs-wrap">
                                <Row>
                                    
                                    {posts.map(post =>
                                        <Post post={post} key={post.id}/>
                                        )}
                                </Row>
                            </div>
                        </div>
                    </div>
                 </div>
             </div>
             </div>
        )}
        </>
    )
}

function Post(props) {
    const hideJob = async (postId) => {
        try {
            let res = await API.post(endpoints['hide-jobs'](postId) ,{}, {
                headers: {
                    "Authorization": `Bearer ${cookies.load("access_token")}`
                }
            })
            console.log(res.data)
            alert("Đã ẩn bài đăng.")
        } catch (err) {
            console.error(err)
            
        }
    }
    return (
        <>
        <div class="card" style={{width: '18rem'}}>
        <div class="card-header">
            <h5 className="jobs__tittle">
                <Link to={`/applicants/${props.post.id}/`}>{props.post.title}</Link>
            </h5>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
            Số lượng ứng tuyển: {Object.values(props.post.applicant).flat().length}
            </li>
            <li class="list-group-item">
            Đã cập nhật: <Moment fromNow>{props.post.update_date}</Moment>
            </li>
            <li class="list-group-item">
            <Button variant="outline-info" size="sm" style={{marginRight:"10px"}}>
                <Link to={`/posts/${props.post.id}/`}>Xem bài đăng</Link>
            </Button>
            <Button onClick={() => hideJob(props.post.id)}
            variant="outline-dark" size="sm"
            >
                Dừng tuyển
            </Button>   
            </li>
            
        </ul>
        </div>
            
            
        </>
    )
}