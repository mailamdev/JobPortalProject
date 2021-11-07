import React, { useEffect, useRef, useState } from 'react'
import { Button, Form } from 'react-bootstrap'
// import { createEditor } from 'slate'
// import { Slate, Editable, withReact } from 'slate-react'
import API, { endpoints } from '../Configs/API'
import cookies from 'react-cookies'
import { useParams } from 'react-router'



export default function ApplyJob() {
    let { postId } = useParams()
    let [user, setUser] = useState(null) 

    const cv = useRef()
    const [summary, setSummary] = useState("")
    // const editor = useMemo(() => withReact(createEditor()), [])  
    

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
    },[])
    console.log(user)

    const applyJob = async () => {
        const formData = new FormData()
        formData.append("cv", cv.current.files[0])
        formData.append("summary", summary)

        if(user !== null && user !== undefined) { 
            if (cv.current.files[0] === undefined || summary === "" ) {
                alert("Vui lòng điền đầy đủ thông tin")
            }
            else {
                try {
                    let res = await API.post(endpoints['apply-job'](postId), 
                    formData, {
                        headers: {
                            "Content-Type": "multipart/form-data",
                            "Authorization": `Bearer ${cookies.load("access_token")}`
                        }
                    })
                    console.log(res.data)
                    alert("Ứng tuyển thành công.")
                } catch (err) {
                    console.error(err)
                }
            }
        }
        else {
            alert("Vui lòng đăng nhập")
        }
    }

    return (
        <>
            <span className="mt-3">Tải lên CV (yêu cầu định dạng pdf):  </span>
            <input type="file" accept=".pdf" ref={cv} />  
            <Form.Group controlId="summaryContent">
                <Form.Label className="mt-2">Giới thiệu bản thân:</Form.Label>
                <Form.Control as="textarea" rows={8} value={summary} onChange={(event) => setSummary(event.target.value)}/>
            </Form.Group>
            {/* <div>Giới thiệu bản thân: </div>
            <div style={{background:"#f1f1f1",minHeight:'300px'}}>
            <Slate
            editor={editor}      
            value={summary}      
            onChange={value => {
                setSummary(value)
                const isAstChange = editor.operations.some(
                    op => 'set_selection' !== op.type
                    )
                    if (isAstChange) {
                        const content = JSON.stringify(summary)
                        localStorage.setItem('content', content)
                    }
                }}
            >   
            <Editable/>
            </Slate> 
            </div> */}
            <div className="button-group">
                <Button onClick={applyJob} variant="success" size="lg">Gửi CV</Button>   
            </div>
        </>
    )

}