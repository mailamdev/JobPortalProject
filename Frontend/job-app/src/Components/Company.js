import { useState, useEffect } from "react"
import { Container, Row } from "react-bootstrap"
import {useParams} from 'react-router-dom'
import API, { endpoints } from '../Configs/API'
import JobCart from './JobCart'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {faMapMarkerAlt} from '@fortawesome/free-solid-svg-icons';
import Loading from "./Loading"


export default function Company() {
    let [posts, setPosts] = useState([])
    let [company, setCompany] = useState([])
    let { companyId } = useParams()
    let [ isLoading, setLoading ] = useState(true)

    useEffect(() => {
        async function getPosts() {
            let res = await API.get(endpoints["company-jobs"](companyId))
            setPosts(res.data)
        }
        getPosts()
        async function getCompany() {
            // API.get(`${endpoints['posts']}${id}`)
            let res = await API.get(`${endpoints["companies"]}${companyId}`)
            setCompany(res.data)
            setLoading(false)
        }
        getCompany()
        
    },[companyId])

    return (
        <>
        <div className="main">
        {isLoading  ?  (<Loading/>)   : (<Container>
            <div className="company-detail-container ">
                <div className="company-detail">
                    <div className="company-detail__logo">
                        <img src={company.image} alt={company.name}/>
                    </div>
                    <div className="company-detail__info">
                        <h4 className="company-detail__info-name">
                        {company.name}
                        </h4>
                        <div className="company-detail__info-list">
                            <div className="company-detail__info-item">
                                <FontAwesomeIcon icon={faMapMarkerAlt} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{company.address}</span>
                            </div>
                            <div className="company-detail__info-item">
                                <FontAwesomeIcon icon={faMapMarkerAlt} className="icon"></FontAwesomeIcon>
                                <span className="info-text">{company.website}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <h3 className="section-tittle text-center text-uppercase mt-3">Giới thiệu công ty</h3>
                <div dangerouslySetInnerHTML={ { __html: company.description}} >
                </div>
            </div>
            <h3 className="section-tittle text-center text-uppercase mt-3">Danh sách việc làm đang tuyển dụng</h3>
            <div className="jobs-wrap">
                <Row>
                    {posts.map(post =><JobCart post={post}/>)}
                </Row>
            </div>
        </Container>)
        }
        </div>
        </>
        
    )
}