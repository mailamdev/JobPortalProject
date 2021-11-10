import { useEffect, useState } from "react"
import { Col, Row } from "react-bootstrap"
import API, { endpoints } from "../Configs/API"
import cookies from 'react-cookies'
import { Link } from "react-router-dom"
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faBookmark, faClipboard,faPen} from '@fortawesome/free-solid-svg-icons';
import Loading from "./Loading"
import Moment from 'react-moment';
import userdefault from "../img/user.png";


export default function SavedJobs() {
    let [jobs, setJobs] = useState([])
    let [user, setUser] = useState(null) 
    let [ isLoading, setLoading ] = useState(true)
    let [avatar, setAvatar] = useState('') 

    useEffect(() => {
        async function getUser() {
            let res = await API.get(endpoints['current-user'], {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setUser(res.data)
            setAvatar(res.data.avatar)

        }
        getUser()
        async function getData() {
            let res = await API.get(endpoints["applied-jobs"], {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setJobs(res.data)
            setLoading(false)

        }
        getData()
    }, [])


    return (
        <>
        {isLoading ?  (<Loading/>) : (
        <div className="container bootstrap snippets bootdey main">
        <div className="row">
          <div className="profile-nav col-md-12 col-xs-12 col-lg-12 col-xl-3">
              <div className="panel">
                  <div className="user-heading round">
                  <div className="user-avatar">
                  {avatar !== 'http://127.0.0.1:8000/static/' ? (
                            <img src={avatar} alt=""/>
                          ): (
                            <img src={userdefault} alt=""/>
                          )}
                            {/* <Button class="edit" onClick={updateAvatar}>  */}
                                <FontAwesomeIcon icon={faPen} className="icon">
                                <input
                                    type="file"
                                    accept=".png, .jpg, .jpeg"
                                    // ref={newAvatar}
                                    // style={{ zIndex:"5" }}
                                    />
                                </FontAwesomeIcon>
                            {/* </Button> */}
                        </div>
                      <h3>{user.last_name} {user.first_name}</h3>
                      <p>@{user.username}</p>
                  </div>
        
                  <ul className="nav nav-pills nav-stacked">
                      <li ><Link to="/profile"> 
                        <FontAwesomeIcon icon={faUser} className="icon"></FontAwesomeIcon>
                          Thông tin cá nhân</Link></li>
                      {/* <li><Link to="#"> 
                      <FontAwesomeIcon icon={faFileAlt} className="icon"></FontAwesomeIcon>
                        Quản lý CV</Link></li> */}
                      <li><Link to="/saved-jobs"> 
                      <FontAwesomeIcon icon={faBookmark} className="icon"></FontAwesomeIcon>
                        Việc làm đã lưu</Link></li>
                      <li  className="active"><Link to="#"> 
                      <FontAwesomeIcon icon={faClipboard} className="icon"></FontAwesomeIcon>
                      Việc làm đã ứng tuyển</Link></li>
                  </ul>
              </div>
          </div>
          <div className="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
            <div className="card h-100">
                <div className="card-body">
                    {/* { jobs.map(job => (
                     <div>{job.post.title}</div>

                    )) */}

                    <div className="jobs-wrap">
                <Row style={{flexWrap: 'wrap'}}>
                    {jobs.map(job =>
                    <Col xs={12} md={6} lg={6}>
                    <div className="jobs-item" style={{position: 'relative'}}>
                        <h5 className="jobs__tittle">
                            <Link to={`/posts/${job.post.id}/`}>{job.post.title}</Link>
    
                        </h5>
                        
                        <div className="jobs__company">
                            <div className="left">
                                <div className="company-img">
                                <img src={job.post.company.image} alt={job.post.company.name}/>
                                </div>
                                
                                <Link to={`/company/${job.post.company.id}/posts/`} className="company-name">{job.post.company.name}</Link>
                            </div>
                        </div>
                        
                        <div className="applied-time">Ngày ứng tuyển:&ensp;
                        <Moment format="DD/MM/YYYY">{job.date_applied}</Moment></div>
                        <div><a href={job.cv}>Xem CV</a></div>
                    </div>
                </Col>
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