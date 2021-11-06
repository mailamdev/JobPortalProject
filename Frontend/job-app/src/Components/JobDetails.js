import { useState, useEffect} from "react"
import { faClock, faDollarSign, faMapMarkerAlt, faBriefcase, faCalendarDay } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React from 'react';
import {Link, useParams} from 'react-router-dom'
import API, { endpoints } from '../Configs/API';
import { Button, Container, Row } from "react-bootstrap";
import Loading from "./Loading";
import cookies from 'react-cookies'
import ApplyJob from "./ApplyJob";
import Moment from 'react-moment';



export default function JobDetails() {
    let [post, setPost] = useState()
    let { postId } = useParams()
    let [user, setUser] = useState(null) 
    let [showForm, setShowForm] = useState(false)
    
   

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
        async function getPost() {
            let res = await API.get(`${endpoints["posts"]}${postId}`)
            setPost(res.data)
        }
        getPost()
    },[postId])
    console.log(user)

    const saveJob = async () => {
        if(user !== null && user !== undefined) {
            try {
                let res = await API.post(endpoints['save-job'](postId), {} ,{
                    headers: {
                        "Authorization": `Bearer ${cookies.load("access_token")}`
                    }
                })
                console.log(res.data)
                alert("Lưu việc làm thành công.")
            } catch (err) {
                console.error(err)
            }
            
        }
        else {
            alert("Vui lòng đăng nhập")
        }
    }
    const applied = () => {
        if(user !== null && user !== undefined) {
            setShowForm(true)
        }
        else {
            alert("Vui lòng đăng nhập")
        }
    }


    console.log(showForm)
    
    return (
        <>
        {post ? (
        <Container>
            <div className="main">
            {showForm ? (   
                <>
                <Button variant="outline-secondary" onClick={() => setShowForm(false)}>Quay lại</Button>
                <h3>
                    Bạn đang ứng tuyển vị trí {post.title} tại công ty {post.company.name}
                </h3>
                <ApplyJob/>
                
                </>
            ) : (
            <Row md={12}>
                <div className="job-detail-wrap">
                <div className="job-detail">
                    <div className="job-detail__logo-company">
                        <img src={post.company.image} alt={post.company.name}/>
                    </div>
                    
                    <div className="job-detail__info">
                        <h5 className="job__tittle">{post.title}
                        </h5>
                        <Link to={`/company/${post.company.id}/posts/`} className="company-name">{post.company.name}</Link>




                        <div className="job-detail__info-list">
                            <div className="job-detail__info-item">
                                <FontAwesomeIcon icon={faDollarSign} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{post.salary}</span>
                            </div>
                            <div className="job-detail__info-item">
                                <FontAwesomeIcon icon={faClock}  className="icon"></FontAwesomeIcon>
                                <span className="info-text">{post.job_type.name}</span>
                            </div>
                            <div className="job-detail__info-item">
                                <FontAwesomeIcon icon={faMapMarkerAlt} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{post.location.name}</span>
                            </div>
                            <div className="job-detail__info-item">
                                <FontAwesomeIcon icon={faBriefcase} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{post.level.name}</span>
                            </div>
                        </div>
                        
                    </div>
                    
                    <div className="job-detail__btn">
                    <div className="job-detail__info-item-time">
                        <FontAwesomeIcon icon={faCalendarDay} className="icon"></FontAwesomeIcon>
                        <Moment fromNow>{post.update_date}</Moment>
                    </div>
                    <Button onClick={applied} className="job-detai__btn-item" variant="success">Ứng tuyển ngay</Button>
                    <Button onClick={saveJob} className="job-detai__btn-item" variant="outline-danger">Lưu tin</Button>
                    </div>
                </div>
                <div className="job-detail-skills-wrap">
                    <span>Yêu cầu kỹ năng: </span>
                    <ul className="job-detail-skills">
                        {post.skill_tags.map((skill, i) => {
                            return <li key={i}><Link to={`/search/?skill_id=${skill.id}`}>{skill.name}</Link></li>})}
                    </ul>
                </div>
                <div className="job-detail__content">
                        <div dangerouslySetInnerHTML={ { __html: post.content}} >
                        </div>
                </div>
                </div>
            </Row>
            )}
            </div>
        </Container>) : 
        (<Loading/>)}
        </>
    )
}

