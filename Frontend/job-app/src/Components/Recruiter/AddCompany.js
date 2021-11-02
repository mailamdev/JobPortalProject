import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { useEffect, useRef, useState } from 'react';
import { Button, Container } from 'react-bootstrap';
import API, { endpoints } from '../../Configs/API';
import cookies from 'react-cookies'


export default function AddCompany() {
    let [userId, setUserId] = useState(null) 
    const [name, setName] = useState('')
    const [description, setDescription] = useState('')
    const image = useRef()
    const [address, setAddress] = useState('')
    const [website, setWebsite] = useState('')

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
                    // this.props.history.push("/login");

                    
                })
                .catch(err => console.error(err))
            }
        
        event.preventDefault()
    }

    return (
        <>
        <Container>
        <div className="card-body main">
            <div className="form-group row form-row field-name">
                <label htmlFor="name" className="col-sm-2 col-form-label">
                    <span>Tên công ty:</span>
                </label>
                <div className="col-sm-10">
                    <input style={{width: "370px"}} type="text" 
                    value={name} onChange={(event) => setName(event.target.value)}
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
                    onChange = {(e,editor) => {handleChange(e, editor)}}
                    />
                    <div>{description}</div>
                </div>
            </div>
            <div className="form-group row form-row field-name">
                <label htmlFor="name" className="col-sm-2 col-form-label">
                    <span>Ảnh đại diện công ty:</span>
                </label>
                <div className="col-sm-10">
                <input type="file" ref={image} />  
                </div>
            </div>
            <div className="form-group row form-row field-name">
                <label htmlFor="name" className="col-sm-2 col-form-label">
                    <span>Địa chỉ công ty:</span>
                </label>
                <div className="col-sm-10">
                    <input style={{width: "370px"}} type="text"
                    value={address} onChange={(event) => setAddress(event.target.value)}
                    />
                </div>
            </div>
            <div className="form-group row form-row field-name">
                <label htmlFor="name" className="col-sm-2 col-form-label">
                    <span>Website công ty:</span>
                </label>
                <div className="col-sm-10">
                    <input style={{width: "370px"}} type="text"
                    value={website} onChange={(event) => setWebsite(event.target.value)}
                    />
                </div>
            </div>
            <Button onClick={addCompany} variant="danger">Đăng ký</Button>   

        </div>
        </Container>
        </>
    )
}