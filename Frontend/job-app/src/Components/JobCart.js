import React from 'react';
import { Col} from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClock, faDollarSign, faMapMarkerAlt, faBriefcase } from '@fortawesome/free-solid-svg-icons';



export default function JobCart(props) {
        return (
            <> 
            
            <Col xs={12} md={6} lg={6}>
                <div className="jobs-item" style={{position: 'relative'}}>
                    <h5 className="jobs__tittle">
                        <Link to={`/posts/${props.post.id}/`}>{props.post.title}</Link>

                    </h5>
                    <div className="jobs__info jobs-list__info">
                        <div className="jobs-list__info-row">
                            <div className="jobs-list__info-item">
                                <FontAwesomeIcon icon={faDollarSign} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{props.post.salary}</span>
                            </div>
                            <div className="jobs-list__info-item">
                                <FontAwesomeIcon icon={faClock}  className="icon"></FontAwesomeIcon>
                                <span className="info-text">{props.post.job_type.name}</span>
                            </div>
                        </div>
                        <div className="jobs-list__info-row">
                            <div className="jobs-list__info-item">
                                <FontAwesomeIcon icon={faMapMarkerAlt} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{props.post.location.name}</span>
                            </div>
                            <div className="jobs-list__info-item">
                                <FontAwesomeIcon icon={faBriefcase} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{props.post.level.name}</span>
                            </div>
                        </div>
                    </div>
                    <div className="jobs__company">
                        <div className="left">
                            <div className="company-img">
                            <img src={props.post.company.image} alt={props.post.company.name}/>
                            </div>
                            
                            <Link to={`/company/${props.post.company.id}/posts/`} className="company-name">{props.post.company.name}</Link>
                        </div>
                    </div>
                </div>
            </Col>
            </>
        )
}