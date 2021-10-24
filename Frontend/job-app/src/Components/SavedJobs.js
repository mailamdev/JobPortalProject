import { useEffect, useState } from "react"
import { Col, Row } from "react-bootstrap"
import API, { endpoints } from "../Configs/API"
import cookies from 'react-cookies'
import { Link } from "react-router-dom"
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faBookmark, faClipboard, faTimes} from '@fortawesome/free-solid-svg-icons';
import Loading from "./Loading"

export default function SavedJobs() {
    let [jobs, setJobs] = useState([])
    let [user, setUser] = useState(null) 
    let [ isLoading, setLoading ] = useState(true)


    useEffect(() => {
        async function getUser() {
            let res = await API.get(endpoints['current-user'], {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setUser(res.data)
        }
        getUser()
        async function getData() {
            let res = await API.get(endpoints["saved-jobs"], {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setJobs(res.data)
            setLoading(false)

        }
        getData()
    }, [])

    const deleteJob = async (jobId) => {
        // setJobId(jobs.id)
        console.log(jobId)
        try {
            let res = await API.delete(endpoints['delete-saved-jobs'](jobId) ,{
                headers: {
                    "Authorization": `Bearer ${cookies.load("access_token")}`
                }
            })
            console.log(res.data)
            alert("Bỏ lưu thành công.")
            window.location.reload(false)
        } catch (err) {
            console.error(err)
            
        }
    }

    return (
        <>
        {isLoading ?  (<Loading/>) : (
        <div className="container bootstrap snippets bootdey">
        <div className="row" style={{flexWrap: 'nowrap'}}>
          <div className="profile-nav col-md-3">
              <div className="panel">
                  <div className="user-heading round">
                      <Link to="#">
                          <img src="https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/8_avatar-512.png" alt=""/>
                          
                      </Link>
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
                      <li className="active"><Link to="/saved-jobs"> 
                      <FontAwesomeIcon icon={faBookmark} className="icon"></FontAwesomeIcon>
                        Việc làm đã lưu</Link></li>
                      <li><Link to="/applied-jobs"> 
                      <FontAwesomeIcon icon={faClipboard} className="icon"></FontAwesomeIcon>
                      Việc làm đã ứng tuyển</Link></li>
                  </ul>
              </div>
          </div>
          <div className="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
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
                        <button onClick={() => deleteJob(job.id)}className="btn-delete-job">
                      <FontAwesomeIcon icon={faTimes} className="icon-delete"></FontAwesomeIcon>
                        </button>
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