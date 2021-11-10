import React, { useState } from 'react';
import cookies from 'react-cookies'
import {
    Container,
    Row,
    Col,
    Form,
    Button,
  } from 'react-bootstrap';

import API, { endpoints } from '../../Configs/API';
import { useHistory } from 'react-router';

export default function RegisterRecruiter(props) {
    const [email, setEmail] = useState('')
    const [firstname, setFirstname] = useState('')
    const [lastname, setLastname] = useState('')
    const [username, setUsername] = useState('')
    const [phonenumber, setPhonenumber] = useState('')
    const recruiter = 1
    const [password, setPassword] = useState('')
    const [comfirmpw, setComfirmpw] = useState('')
    // const [isLogged, setLogged] = useState(false)
    const history = useHistory();

    const register = async (event) => {
        if (email === "" ||  username === ""  || password === "" || phonenumber === "" ) {
            alert('Vui lòng nhập đủ thông tin!')
        } 
        else {
            if (password === comfirmpw) {
                const formData = new FormData()
                formData.append("email", email)
                formData.append("first_name", firstname)
                formData.append("last_name", lastname)
                formData.append("username", username)
                formData.append("phone_number", phonenumber)
                formData.append("is_recruiter", recruiter)
                formData.append("password", password)

                console.log(formData)
                API.post(endpoints['users'], formData)
                .then((res) => {
                    // alert('Đăng ký thành công.')
                    login();
                })
                .catch(err => console.error(err))
            }
            else {
                alert('Mật khẩu không khớp!')
            }
        }
        event.preventDefault()
    }


    const login = async () => {

        try {
            let info = await API.get(endpoints["oauth2-info"])
            let res = await API.post(endpoints['login'], {
                'client_id': info.data.client_id,
                'client_secret': info.data.client_secret,
                'username': username,
                'password': password,
                'grant_type': 'password'
              }) 

            cookies.save('access_token', res.data.access_token)
        } catch (err) {
            console.error(err)
        }

      let user = await API.get(endpoints['current-user'], {
            headers: {
              'Authorization':  `Bearer ${cookies.load('access_token')}`
            }
      })
      cookies.save('user', user.data)
      history.push('add-company')
    //   this.props.history.push("/add-company");
  }

    return(
        <>
        <Container>
            <div className="main">
            <Row className="justify-content-md-center" lg={2}>
                <Col md="6">
                    <h1 className="section-tittle text-uppercase text-center">Đăng ký tuyển dụng</h1>
                    <Form onSubmit={register}>
                        <RegisterForm 
                        id="email" 
                        label="Email" 
                        type="email" 
                        field={email} 
                        change={event => setEmail(event.target.value)}
                        />
                        <RegisterForm 
                        id="username" 
                        label="Tên đăng nhập" 
                        type="text" 
                        field={username} 
                        change={event => setUsername(event.target.value)}
                        />
                        <Row>
                            <Col style={{ paddingRight: 0 }}>
                            <RegisterForm 
                            id="lastname" 
                            label="Họ" 
                            type="text" 
                            field={lastname} 
                            change={event => setLastname(event.target.value)}
                            />
                            </Col>
                            <Col>
                            <RegisterForm 
                            id="firstname" 
                            label="Tên" 
                            type="text" 
                            field={firstname} 
                            change={event => setFirstname(event.target.value)}
                            style={{paddingLeft:"0"}}
                            />
                            </Col>
                        </Row>
                        <RegisterForm 
                        id="phonenumber" 
                        label="Số điện thoại" 
                        type="text" 
                        field={phonenumber} 
                        change={event => setPhonenumber(event.target.value)}
                        />
                        <RegisterForm 
                        id="password" 
                        label="Mật khẩu" 
                        type="password" 
                        field={password} 
                        change={event => setPassword(event.target.value)}
                        />
                        <RegisterForm 
                        id="comfirmpw" 
                        label="Xác nhận mật khẩu" 
                        type="password"
                        field={comfirmpw} 
                        change={event => setComfirmpw(event.target.value)}
                        />
                        <Button type="submit" className="btn btn-primary btn-block text-uppercase" style={{ fontSize: 18, height: "48px", marginTop: "32px"}}>Tiếp tục</Button>
                        {/* </Col> */}
                    </Form>
                </Col>
            </Row>
            </div>
        </Container>
        </>
    )
}

  

export class RegisterForm extends React.Component {
    render() {
        return (
            <div className="form-group">
            <input type={this.props.type} 
            className="form-control" 
            value={this.props.field}
            placeholder={this.props.label} 
            onChange={this.props.change}
            style={{ fontSize: 18, height: "52px"}}
            />
            </div>    
        )
    }
}
