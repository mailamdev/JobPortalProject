import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { useEffect, useRef, useState } from 'react';
import { Button, Container } from 'react-bootstrap';
import API, { endpoints } from '../../Configs/API';
import cookies from 'react-cookies'
import {faClipboard, faBriefcase, faEdit } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { Link } from 'react-router-dom'
import Select from 'react-select'
import makeAnimated from 'react-select/animated';

const animatedComponents = makeAnimated()

export default function AddCompany() {
    let [userId, setUserId] = useState(null) 
    const [name, setName] = useState('')
    const [description, setDescription] = useState('')
    const image = useRef()
    const [address, setAddress] = useState('')
    const [website, setWebsite] = useState('')

    const [skills, setSkills] = useState([])
    const [locations, setLocations] = useState([])
    const [levels, setLevels] = useState([])
    const [types, setTypes] = useState([])

    
    useEffect(() => {
        async function getSkill() {
            let res = await API.get(endpoints["skillstag"])
            setSkills(res.data)
        }
        getSkill()
        async function getLacation() {
            let res = await API.get(endpoints["locations"])
            setLocations(res.data)
        }
        getLacation()
        async function getLevel() {
            let res = await API.get(endpoints["levels"])
            setLevels(res.data)
        }
        getLevel()
        async function getType() {
            let res = await API.get(endpoints["jobtype"])
            setTypes(res.data)
        }
        getType()
    }, [])



    const skillOption = skills.map(skill => {
        return {value: skill.id, label: skill.name}
    })


    const handleChange = (e, editor) => {
        setDescription(editor.getData())
    }
    useEffect(() => {
        async function getUser() {
            let res = await API.get(endpoints['current-user'], {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setUserId(res.data.id)
        }
        getUser()
    }, [])

    

    const addCompany = async (event) => {
        if (name === "" ||  description === ""  || address === "" || image.current.files[0] === undefined ) {
            alert('Vui lòng nhập đủ thông tin!')
        } 
        else {
            const formData = new FormData()
            formData.append("image", image.current.files[0])
            formData.append("name", name)
            formData.append("description", description)
            formData.append("address", address)
            formData.append("website", website)
            formData.append("user", userId)

                console.log(formData)
                API.post(endpoints['add-companies'], formData, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                        "Authorization": `Bearer ${cookies.load("access_token")}`
                    }
                })
                .then((res) => {
                    alert('Đăng ký thành công.')
                })
                .catch(err => console.error(err))
            }
        
        event.preventDefault()
    }

    return (
        <>
        {/* <Container> */}
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
                           <li ><Link to="/recruitment-jobs"> 
                           <FontAwesomeIcon icon={faClipboard} className="icon"></FontAwesomeIcon>
                             Danh sách tuyển dụng</Link></li>
                             <li  className="active"><Link to="/add-post"> 
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
                                <span>Tiêu đề:</span>
                            </label>
                            <div className="col-sm-10">
                                <input style={{width: "500px"}} type="text" 
                                value={name} onChange={(event) => setName(event.target.value)}
                                />
                            </div>
                        </div>
                        <div className="form-group row form-row field-name">
                            <label htmlFor="name" className="col-sm-2 col-form-label">
                                <span>Mô tả công việc:</span>
                            </label>
                            <div className="col-sm-10">
                                <CKEditor 
                                editor={ClassicEditor}
                                onChange = {(e,editor) => {handleChange(e, editor)}}
                                />
                                <div>{description}</div>
                            </div>
                        </div>
                        <div class="form-group row form-row">
                            
                        </div>
                        <div class="form-group row form-row">
                            <label for="exampleFormControlSelect1" className="col-sm-2 col-form-label"
                            >Loại hình công việc</label>
                            <select className="form-control col-sm-2" id="exampleFormControlSelect1">
                            {types.map(type => {
                            return <option value={type.id} key={type.id}>{type.name}</option>})}
                            </select> 
                            <label for="exampleFormControlSelect1" className="col-form-label ml-5 mr-3"
                            >Cấp bậc:</label>
                            <select className="form-control col-sm-2" id="exampleFormControlSelect1">
                            {levels.map(level => {
                            return <option value={level.id} key={level.id}>{level.name}</option>})}
                            </select> 
                            <label for="exampleFormControlSelect1" className="col-form-label ml-5 mr-3"
                            >Địa điểm làm việc:</label>
                            <select className="form-control col-sm-2" id="exampleFormControlSelect1">
                            {locations.map(location => {
                            return <option value={location.id} key={location.id}>{location.name}</option>})}
                            </select> 
                        </div>
                        <div class="form-group row form-row">
                            
                        </div>
                        <div className="form-group row form-row field-name">
                        <label htmlFor="name" className="col-sm-2 col-form-label">
                                <span>Mức lương:</span>
                            </label>
                            <div className="col-sm-10">
                                <input style={{width: "500px"}} type="text" 
                                value={name} onChange={(event) => setName(event.target.value)}
                                />
                            </div>
                        </div>
                        <div class="form-group row form-row">
                            <label for="exampleFormControlSelect2" className="col-sm-2 col-form-label">Kỹ năng yêu cầu: </label>
                            {/* <select multiple class="form-control" id="exampleFormControlSelect2">
                            {skills.map(skill => {
                            return <option value={skill.id} key={skill.id}>{skill.name}</option>})}
                            </select> */}
                            <Select 
                            className="col-sm-10"
                            closeMenuOnSelect={false}
                            components={animatedComponents}
                            isMulti
                            options={skillOption}
                            
                            ></Select>
                        </div>
                        <div className="row button-group">
                        <Button variant="danger" className="button-item" size="lg">Đăng tuyển</Button>   
                        </div>
                        </div>
                    </div>
                 </div>
             </div>
             </div>
        {/* </Container> */}
        </>
    )
}