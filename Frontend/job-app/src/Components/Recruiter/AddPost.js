import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { useEffect, useState } from 'react';
import { Button } from 'react-bootstrap';
import API, { endpoints } from '../../Configs/API';
import cookies from 'react-cookies'
import {faClipboard, faBriefcase, faEdit } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { Link } from 'react-router-dom'
import Select from 'react-select'
import makeAnimated from 'react-select/animated';

const animatedComponents = makeAnimated()

export default function AddCompany() {
    const [title, setTitle] = useState('') 
    const [content, setContent] = useState('')
    const [jobtype, setJobtype] = useState('')
    const [level, setLevel] = useState('')
    const [salary, setSalary] = useState('')
    const [location, setLocation] = useState('')
    const [company, setCompany] = useState('')
    const user = cookies.load('user')

    // Load thông tin từ API
    const [locations, setLocations] = useState([])
    const [skills, setSkills] = useState([])
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
        async function getCompanyId() {
            let res = await API.get(endpoints['recruiter-company'](user.id), {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setCompany(res.data.id)
        }
        getCompanyId()
    }, [user.id])

    const skillOption = skills.map(skill => {
        return {value: skill.id, label: skill.name}
    })

    const [options, setOptions] = useState([])
    const skillselected = options.map(option => {
        return option.value
    })
    

    const handleChange = (e, editor) => {
        setContent(editor.getData())
    }


    

    const addPost = async (event) => {
        // event.preventDefault()
        console.log(location)

        if (title === "" ||  content === ""  || jobtype === "" || level === "" || salary === "" || location === "" ){
            alert('Vui lòng nhập đủ thông tin!')
        } 
        else {
            const formData = new FormData()
            formData.append("title", title)
            formData.append("content", content)
            formData.append("jobtype", jobtype)
            formData.append("level", level)
            formData.append("salary", salary)
            formData.append("location", location)
            formData.append("company", company)
            formData.append("skilltag", skillselected)
            formData.append("create", user.id)
            API.post(endpoints['add-post'], formData, {
                headers: {
                    "Authorization": `Bearer ${cookies.load("access_token")}`
                }
            }).then((res) => alert('Đăng tuyển thành công.'))
            .catch(err => console.error(err))}
        event.preventDefault()

    }

    return (
        <>
        <div className="container-fluid bootstrap snippets bootdey main">
             <div className="row">
               <div className="profile-nav col-xl-2 col-lg-12 col-md-12 col-xs-12">
                   <div className="panel">
                       <ul className="nav nav-pills nav-stacked">
                           <li><Link to="/recruitment"> 
                            <FontAwesomeIcon icon={faBriefcase} className="icon"></FontAwesomeIcon>
                            Thông tin công ty</Link></li>
                           <li ><Link to="/recruitment-jobs"> 
                           <FontAwesomeIcon icon={faClipboard} className="icon"></FontAwesomeIcon>
                             Danh sách tuyển dụng</Link></li>
                             <li  className="active"><Link to="/add-post"> 
                            <FontAwesomeIcon icon={faEdit} className="icon"></FontAwesomeIcon>
                            Đăng tuyển</Link></li>
                       </ul>
                   </div>
               </div>
               <div className="col-xl-10 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div className="card h-100">
                        <div className="card-body">
                        <div className="form-group row form-row field-name">
                            <label htmlFor="name" className="col-sm-2 col-form-label">
                                <span>Tiêu đề:</span>
                            </label>
                            <div className="col-sm-10">
                                <input type="text" className="add-post-input"
                                value={title} onChange={(event) => setTitle(event.target.value)}
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
                            </div>
                        </div>
                        <div class="form-group row form-row">
                            
                        </div>
                        <div class="form-group row form-row">
                            <label htmlFor="jobtype" className="col-sm-2 col-form-label"
                            >Loại hình công việc</label>
                            <select className="form-control col-sm-2" id="jobtype"
                            onChange={(event) => setJobtype(event.target.value)}>
                            <option value="">------</option>
                            {types.map(type => {
                            return <option value={type.id} key={type.id}>{type.name}</option>})}
                            </select> 
                            <label htmlFor="level" className="col-form-label add-post-label"
                            >Cấp bậc:</label>
                            <select className="form-control col-sm-2" id="level"
                            onChange={(event) => setLevel(event.target.value)}>
                            <option value="">------</option>
                            {levels.map(level => {
                            return <option value={level.id} key={level.id}>{level.name}</option>})}
                            </select> 
                            <label htmlFor="location" className="col-form-label add-post-label"
                            >Địa điểm làm việc:</label>
                            <select className="form-control col-sm-2" id="location"
                            onChange={(event) => setLocation(event.target.value)}>
                            <option value="">------</option>
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
                                <input type="text" className="add-post-input"
                                value={salary} onChange={(event) => setSalary(event.target.value)}
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
                            
                            onChange={(selectedOption) =>  setOptions(selectedOption)}
                            ></Select>
                        </div>
                        <div className="row button-group">
                        <Button onClick={addPost} variant="primary" className="button-item" size="lg">Đăng tuyển</Button>   
                        </div>
                        </div>
                    </div>
                 </div>
             </div>
        </div>
        </>
    )
}