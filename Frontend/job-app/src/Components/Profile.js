import React, { useState, useEffect } from 'react';
import API, { endpoints } from '../Configs/API';
import cookies from 'react-cookies'
import "../css/profile.css"
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faBookmark, faClipboard} from '@fortawesome/free-solid-svg-icons';
import { Button, Form } from 'react-bootstrap';


export default function Profile() {
    let [user, setUser] = useState(null) 
    let [userId, setUserId] = useState(null) 
    let [last_name, setLastName] = useState(null) 
    let [first_name, setFirstName] = useState(null) 
    let [phone_number, setPhone] = useState(null) 
    let [email, setEmail] = useState(null) 
    
    // let [avatar, setAvatar] = useState() 

    useEffect(() => {
        async function getUser() {
            let res = await API.get(endpoints['current-user'], {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setUser(res.data)
            setUserId(res.data.id)
            console.log(res.data.is_recruiter)
        }
        getUser()
    }, [])
    const update = (event) => {
        event.preventDefault()
        console.log(userId)
        let updataProfile = async () => {
            const formData = new FormData()
            // formData.append("username", user.username)
            if (first_name !== user.first_name) {
                formData.append("first_name", first_name)
            }
            else {
                formData.append("first_name", user.first_name)
            }
            if (last_name !== user.last_name) {
                formData.append("last_name", last_name)
            }
            else {
                formData.append("last_name", user.last_name)
            }
            if (phone_number !== user.phone_number) {
                formData.append("phone_number", phone_number)
            }
            else {
                formData.append("phone_number", user.phone_number)
            }
            if (email !== user.email) {
                formData.append("email", email)
            }
            else {
                formData.append("email", user.email)
            }


            let res = await API.patch(endpoints['update-info'](userId)
            ,
            formData,
            {
                headers: {
                    "Authorization": `Bearer ${cookies.load("access_token")}`
                }
            }
            )
            console.log(res.data)   
        }
        

        updataProfile()
    }

    


    return(
        <>
        {user ? (
        <div className="container bootstrap snippets bootdey">
        <div className="row">
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
                      <li className="active"><Link to="#"> 
                        <FontAwesomeIcon icon={faUser} className="icon"></FontAwesomeIcon>
                          Thông tin cá nhân</Link></li>
                      {/* <li><Link to="#"> 
                      <FontAwesomeIcon icon={faFileAlt} className="icon"></FontAwesomeIcon>
                        Quản lý CV</Link></li> */}
                      <li><Link to="/saved-jobs"> 
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
                <Form onSubmit={update}>

                    <div className="row gutters">
                        <div className="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 className="mb-2 text-primary">Thông tin cá nhân</h6>
                        </div>
                        <div className="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div className="form-group">
                                <label>Họ: </label>
                                <input type="text"
                                 className="form-control" 
                                 id="lastName" 
                                 defaultValue={user.last_name}
                                 value={last_name}
                                 onChange={(event) => setLastName(event.target.value)}
                                 />
                            </div>
                        </div>
                        <div className="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div className="form-group">
                                <label>Tên: </label>
                                <input type="text"
                                 className="form-control" 
                                 id="firstName" 
                                 defaultValue={user.first_name}
                                 value={first_name}
                                 onChange={(event) => setFirstName(event.target.value)}
                                 />
                            </div>
                        </div>
                        <div className="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div className="form-group">
                                <label> Số điện thoại: </label>
                                <input type="text"
                                 className="form-control" 
                                 id="phone" 
                                 defaultValue={user.phone_number}
                                 value={phone_number}
                                 onChange={(event) => setPhone(event.target.value)}
                                 />
                            </div>
                        </div>
                        <div className="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div className="form-group">
                                <label >Địa chỉ email: </label>
                                <input type="text"
                                 className="form-control" 
                                 id="phone" 
                                 defaultValue={user.email}
                                 value={email}
                                 onChange={(event) => setEmail(event.target.value)}
                                 />
                            </div>
                        </div>
                        <div className="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div className="form-group">
                                <label >Cập nhật ảnh đại diện:  </label>
                                <input id="file" type="file" />

                                {/* <input type="file"
                                 className="form-control" 
                                 id="phone" 
                                 defaultValue={user.avatar}
                                 value={avatar}
                                 onChange={(event) => setLastName(event.target.value)}
                                 /> */}
                            </div>
                        </div>
                        {/* <div className="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div className="form-group">
                                <label >Cập nhật CV: </label>
                                
                                <input id="file" type="file" />
                            </div>
                        </div> */}
                        <Button type="submit" className="btn btn-primary mt-3">Lưu thông tin</Button>
                    </div>
                    </Form>

                    {/* <div className="row gutters">
                        <div className="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div className="text-right">
                                
                                <button type="button" id="submit" name="submit" className="btn btn-primary mt-3">Lưu thông tin</button>
                            </div>
                        </div>
                    </div> */}
                </div>
            </div>
            </div>
        </div>
        </div>
        
        
         
        ): (<div style={{height: '100vh'}}>
            <div className="loading">
            <span className="dot"></span>
            <div className="dots">
                <span></span>
                <span></span>
                <span></span>
            </div>
            </div>
        </div>)}
        </>
    )
}



