import {faClipboard, faBriefcase, faEdit } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { useEffect, useRef, useState } from 'react'
import { Button, Form } from 'react-bootstrap'
import cookies from 'react-cookies'
import { Link } from 'react-router-dom'
import API, { endpoints } from '../../Configs/API'
import Loading from '../Loading'
import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
// import DecoupledEditor from '@ckeditor/ckeditor5-build-decoupled-document';


export default function Recruitment() {
    const user = cookies.load('user')
    const userId = user.id
    let [company, setCompany] = useState(null) 
    let [name, setName] = useState('')
    let [description, setDescription] = useState('')
    let image = useRef()
    let [address, setAddress] = useState('')
    let [website, setWebsite] = useState('')

    

    useEffect(() => {

        async function getCompany() {
            let res = await API.get(endpoints['recruiter-company'](userId), {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setCompany(res.data)
            setName(res.data.name)
            setDescription(res.data.description)
            setAddress(res.data.address)
            setWebsite(res.data.website)

        }
        getCompany()
    }, [userId])

    const handleChange = (e, editor) => {
        setDescription(editor.getData())
    }

    const update = (event) => {
        event.preventDefault()
        let updateCompany = async () => {
            const formData = new FormData()
            formData.append("name", name)
            formData.append("description", description)
            formData.append("address", address)
            formData.append("website", website)


            try {
                await API.patch(endpoints['update-company'](company.id)
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
        updateCompany()
    }

    return(
        <>
        {company ? (
        <div className="container-fluid bootstrap snippets bootdey main">
        <div className="row">
          <div className="profile-nav col-md-2">
              <div className="panel">
                  <ul className="nav nav-pills nav-stacked">
                      <li className="active"><Link to="#"> 
                        <FontAwesomeIcon icon={faBriefcase} className="icon"></FontAwesomeIcon>
                          Thông tin công ty</Link></li>
                      <li><Link to="/recruitment-jobs"> 
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
                    <div className="form-group row form-row field-name">
                        <label htmlFor="name" className="col-sm-2 col-form-label">
                            <span>Tên công ty:</span>
                        </label>
                        <div className="col-sm-10">
                            <input style={{width: "100%"}} type="text" 
                            value={name} 
                            onChange={(event) => setName(event.target.value)}
                            />
                        </div>
                    </div>
                    <div className="form-group row form-row field-name">
                        <label htmlFor="name" className="col-sm-2 col-form-label">
                            <span>Giới thiệu công ty:</span>
                        </label>
                        <div className="col-sm-10">
                            <CKEditor 
                            editor={ClassicEditor}
                            data={company.description}
                            onChange = {(e,editor) => {handleChange(e, editor)}}
                            />
                        </div>
                    </div>
                    <div className="form-group row form-row field-name">
                        <label htmlFor="name" className="col-sm-2 col-form-label">
                            <span>Ảnh đại diện công ty:</span>
                        </label>
                        <div className="col-sm-10">
                        <img src={company.image} alt={company.name}  className="recruitment-company-img"/>
                        <input type="file" ref={image} />  
                        </div>
                    </div>
                    <div className="form-group row form-row field-name">
                        <label htmlFor="name" className="col-sm-2 col-form-label">
                            <span>Địa chỉ công ty:</span>
                        </label>
                        <div className="col-sm-10">
                            <input style={{width: "100%"}} type="text"
                            value={address} onChange={(event) => setAddress(event.target.value)}
                            />
                        </div>
                    </div>
                    <div className="form-group row form-row field-name">
                        <label htmlFor="name" className="col-sm-2 col-form-label">
                            <span>Website công ty:</span>
                        </label>
                        <div className="col-sm-10">
                            <input style={{width: "100%"}} type="text"
                            value={website} onChange={(event) => setWebsite(event.target.value)}
                            />
                        </div>
                    </div>
                    <div className="row button-group">
                    <Link to={`/company/${company.id}/posts/`}><Button variant="outline-primary" className="button-item">Xem chi tiết công ty</Button></Link>
                    <Button onClick={update} variant="danger" className="button-item">Cập nhật thông tin</Button>   
                    </div>
                    

                </div>
            </div>
            </div>
        </div>
        </div>
        
        
         
        ): (<Loading/>)}
        </>
    )
}