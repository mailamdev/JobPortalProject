import { Col, Container, Form, Row, Button } from "react-bootstrap";
import React, { useState } from 'react';
import { Redirect } from "react-router";
// import { UserContext } from "../App";
import API, { endpoints } from '../Configs/API';
import cookies from 'react-cookies'
import { useDispatch } from 'react-redux';
// import API, { endpoints } from "../API";

export default function Login(props) {
    const [username, setUsername] = useState(null)  
    const [password, setPassword] = useState(null)
    const [isLogged, setLogged] = useState(false)
    const dispatch = useDispatch()
    
    // const auth = useContext(UserContext)

    // const login = async (event) => {
    //     // auth.login(username, password)
    // }   

    const login = async (event) => {
        event.preventDefault()

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
      dispatch({
        "type": "login",
        "payload": user.data
      })
      setLogged(true)

  }
    // const store = useStore()
    // const user = store.getState()

    if (isLogged) {
        return <Redirect to="/"/>
        // if(user.role === 'Nhà tuyển dụng')
        // {               
        //     return <Redirect to="/employer" />
        // }
        // else {
        //     return <Redirect to="/" />

        // }
    }   
    else {
        return (
            <>
            <Container>
                <div className="main">
                <Row className="justify-content-md-center ">
                    <Col md="6">
                        <h1 className="py-4 section-tittle text-uppercase text-center">Đăng nhập</h1>
                        <Form onSubmit={login}>
                        <LoginForm 
                        id="username" 
                        label="Tên đăng nhập" 
                        type="text" 
                        field={username} 
                        change={event => setUsername(event.target.value)}
                        />
                        <LoginForm 
                        id="password" 
                        label="Mật khẩu" 
                        type="password" 
                        field={password} 
                        change={event => setPassword(event.target.value)}
                        />
                        <Button type="submit" className="btn btn-info btn-block text-uppercase" style={{ fontSize: 18, height: "48px", marginTop: "32px"}}>Đăng nhập</Button>
                        {/* <p className="forgot-password text-right">
                        Chưa có tài khoản? <a href="/register">Đăng Ký</a>
                        </p> */}
                    </Form>
                    </Col>
                </Row>
                </div>
            </Container>
            </>
        )
    }

    
}

class LoginForm extends React.Component {
    render() {
        return (
            <div className="form-group">
                    {/* <label>First name</label> */}
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

