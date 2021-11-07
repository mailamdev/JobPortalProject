import React, { useState, useEffect, useRef } from 'react';
import API, { endpoints } from '../Configs/API';
import cookies from 'react-cookies';
import "../css/profile.css";
import userdefault from "../img/user.png";
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faBookmark, faClipboard, faPen} from '@fortawesome/free-solid-svg-icons';
import { Button, Form } from 'react-bootstrap';
import Loading from './Loading';


export default function Profile() {
    let [user, setUser] = useState(null) 
    let [userId, setUserId] = useState(null) 

    
    let [last_name, setLastName] = useState('') 
    let [first_name, setFirstName] = useState('') 
    let [phone_number, setPhone] = useState('') 
    let [email, setEmail] = useState('') 
    let [avatar, setAvatar] = useState('') 

    const newAvatar = useRef()


    useEffect(() => {
        async function getUser() {
            let res = await API.get(endpoints['current-user'], {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            console.log(res.data)

            setUser(res.data)
            setUserId(res.data.id)
            setLastName(res.data.last_name)
            setFirstName(res.data.first_name)
            setPhone(res.data.phone_number)
            setEmail(res.data.email)
            setAvatar(res.data.avatar)

        }
        getUser()
            
    }, [])

    const update = (event) => {
        event.preventDefault()
        let updateProfile = async () => {
            const formData = new FormData()
            formData.append("first_name", first_name)
            formData.append("last_name", last_name)
            formData.append("phone_number", phone_number)
            formData.append("email", email)

            try {
                await API.patch(endpoints['update-info'](userId)
                ,
                formData,
                {
                    headers: {
                        "Authorization": `Bearer ${cookies.load("access_token")}`
                    }
                })
            alert("Lưu thông tin thành công.")
            }
            catch (err) {
                console.log(err)
            }
        }
        updateProfile()
    }
    const updateAvatar = async () => {
        const formData = new FormData()
        formData.append("avatar", newAvatar.current.files[0])
        try {
            await API.patch(endpoints['update-info'](userId), 
            formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                    "Authorization": `Bearer ${cookies.load("access_token")}`
                }
            })
        } catch (err) {
            console.error(err)
        }
    }

    


    return(
        <>
        {user ? (
        <div className="container bootstrap snippets bootdey main">
        <div className="row">
          <div className="profile-nav col-md-3">
              <div className="panel">
                  <div className="user-heading round">
                      <div className="user-avatar">
                          {avatar !== null ? (
                            <img src={avatar} alt=""/>
                          ): (
                            <img src={userdefault} alt=""/>
                          )}
                          {/* <Button class="edit" onClick={updateAvatar}>  */}
                              <FontAwesomeIcon icon={faPen} className="icon">
                              <input
                                type="file"
                                accept=".png, .jpg, .jpeg"
                                ref={newAvatar}
                                // style={{ zIndex:"5" }}
                                />
                              </FontAwesomeIcon>
                          {/* </Button> */}
                      </div>
                      <h3>{user.last_name} {user.first_name}</h3>
                      <p>@{user.username}</p>
                  </div>
        
                  <ul className="nav nav-pills nav-stacked">
                      <li className="active"><Link to="#"> 
                        <FontAwesomeIcon icon={faUser} className="icon"></FontAwesomeIcon>
                          Thông tin cá nhân</Link></li>
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
                        <div className="button-group">
                            <Button type="submit" className="btn btn-primary mt-2">Cập nhật thông tin</Button>
                        </div>
                    </div>
                    </Form>
                </div>
            </div>
            </div>
        </div>
        </div>
        
        
         
        ): (<Loading/>)}
        </>
    )
}



