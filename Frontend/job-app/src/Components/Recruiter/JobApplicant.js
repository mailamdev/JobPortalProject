import { useEffect, useState } from 'react'
import API, { endpoints } from '../../Configs/API'
import {useParams} from 'react-router-dom'
import Loading from '../Loading'
import { Alert, Row } from "react-bootstrap"
import {faClipboard, faBriefcase, faEdit } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { Link } from 'react-router-dom'
import Moment from 'react-moment';


export default function JobApplicant(props) {
    // const user = cookies.load('user')
    // const userId = user.id
    let { postId } = useParams()

    let [applicants, setApplicant] = useState(null) 


    useEffect(() => {

        async function getApplicant() {
            let res = await API.get(endpoints['applicants'](postId), )
            setApplicant(res.data)
        }
        getApplicant()
    }, [postId])

    return (
        <>
        {(applicants === null) ?  (<Loading/>) : (
            // :
            <div className="container-fluid bootstrap snippets bootdey main">
            <div className="row">
              <div className="profile-nav col-xl-2 col-lg-12 col-md-12 col-xs-12">
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
                           {/* <div className="jobs-wrap"> */}
                               <Row className="job-applicants">
                                   {/* 
                                   Danh sách ứng viên
                                   {applicants.map(applicant =>
                                    <h1>{applicant.user.email}</h1>)} */}
                                
                                {(applicants.length < 1 ) ? (
                                    <Alert variant="info" className="mt-3" style={{width: "100%"}}>
                                    Chưa có ứng viên
                                    </Alert>
                                ) : (
                                <div>
                                <h4 className="text-center">{applicants[0].post.title} - Danh sách ứng tuyển</h4>
                                <div class="table-responsive">
                                <table className="table table-hover table-responsive">
                                <thead>
                                    <tr>
                                    <th scope="col">Email</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giới thiệu</th>
                                    <th scope="col">CV</th>
                                    <th scope="col">Ngày</th>
                                    </tr>
                                </thead>
                                <tbody>
                                {applicants.map(applicant => 
                                    <tr key={applicant.user.id}>
                                        <td>{applicant.user.email}</td>
                                        <td>{applicant.user.phone_number}</td>
                                        <td>{applicant.user.first_name}</td>
                                        <td>{applicant.summary}</td>
                                        <td><a href={applicant.cv} target="_blank" rel="noreferrer">Xem CV</a></td>
                                        <td><Moment format="DD/MM/YYYY">{applicant.date_applied}</Moment></td>

                                    </tr>
                                )}
                                </tbody>
                                </table>
                                </div>
                                </div>
                                )}
                               </Row>
                           {/* </div> */}
                       </div>
                   </div>
                </div>
            </div>
            </div>
        )}
        </>
    )
}

