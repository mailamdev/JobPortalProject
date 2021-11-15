import { Col, Container, Form, Row, Button } from "react-bootstrap";
import React, { useState } from 'react';
import { Redirect } from "react-router";
import API, { endpoints } from '../Configs/API';
import cookies from 'react-cookies'
import { useDispatch } from 'react-redux';

export default function Login(props) {
    let [username, setUsername] = useState(null)  
    let [password, setPassword] = useState(null)
    let [isLogged, setLogged] = useState(false)
    const dispatch = useDispatch()

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
            alert("Sai tên đăng nhập hoặc mật khẩu.")
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

    if (isLogged) {
        return <Redirect to="/"/>
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

