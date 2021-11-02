import React from 'react';
import {
    Container,
    Row,
    Col,
    Form,
    Button,
  } from 'react-bootstrap';

import API, { endpoints } from '../Configs/API';
import { Redirect } from 'react-router';

  
class Register extends React.Component {
    constructor() {
        super()
        this.user = {
            'email': '',
            'first_name': '',
            'last_name': '',
            'username': '',
            'phone_number': '',
            'password': '',
            'comfirmpw': '',
            
            // 'role': '',
        }
        this.state = {
            'user': this.user
        }
    }

    change = (field, event) => {
        this.user[field] = event.target.value
        this.setState({'user': this.user})
        console.log(this.user)
    }

    register = (event) => {
        if (this.state.user.email === "" ||  this.state.user.username === ""  ||
        this.state.user.password === "" || this.state.user.phone_number === "" ) {
            alert('Vui lòng nhập đủ thông tin!')
        }
        else {
            if (this.state.user.password === this.state.user.comfirmpw) {
                const formData = new FormData()
                for (let k in this.state.user)
                    if (k !== 'confirmpw') 
                        formData.append(k, this.state.user[k])
                API.post(endpoints['users'], formData)
                .then((res) => {
                    alert('Đăng ký thành công.')
                    return <Redirect to="/login" />
                })
                .catch(err => console.error(err))
            }
            else {
                alert('Mật khẩu không khớp!')
            }
        }
        event.preventDefault()
    }

    render() {
        return (
            <>
           <Container>
            <div className="main">
            <Row className="justify-content-md-center" lg={2}>
                <Col md="6">
                    <h1 className="section-tittle text-uppercase text-center">Đăng ký người dùng</h1>
                    
                    <Form onSubmit={this.register}>
                        <RegisterForm 
                        id="email" 
                        label="Email" 
                        type="email" 
                        field={this.state.user.email} 
                        change={this.change.bind(this, 'email')}
                        />
                        <RegisterForm 
                        id="username" 
                        label="Tên đăng nhập" 
                        type="text" 
                        field={this.state.user.username} 
                        change={this.change.bind(this, 'username')}/>
                        <Row>
                            <Col style={{ paddingRight: 0 }}>
                            <RegisterForm 
                            id="last_name" 
                            label="Họ" 
                            type="text" 
                            field={this.state.user.last_name} 
                            change={this.change.bind(this, 'last_name')}
                            />
                            </Col>
                            <Col>
                            <RegisterForm 
                            id="first_name" 
                            label="Tên" 
                            type="text" 
                            field={this.state.user.first_name} 
                            change={this.change.bind(this, 'first_name')}
                            style={{paddingLeft:"0"}}
                            />
                            </Col>
                        </Row>
                        <RegisterForm 
                        id="phone_number" 
                        label="Số điện thoại" 
                        type="text" 
                        field={this.state.user.phone_number} 
                        change={this.change.bind(this, 'phone_number')}/>
                        <RegisterForm 
                        id="password" 
                        label="Mật khẩu" 
                        type="password" 
                        field={this.state.user.password} 
                        change={this.change.bind(this, 'password')}
                        />
                        <RegisterForm 
                        id="comfirmpw" 
                        label="Xác nhận mật khẩu" 
                        type="password"
                        field={this.state.user.comfirmpw} 
                        change={this.change.bind(this, 'comfirmpw')}
                        />

                        {/* <Form.Group as={Row} > */}
                        {/* <div className="form-group"> 
                        <span style={{fontSize:"18px"}}>Bạn là:</span>
                        <Form.Control
                            as="select"
                            className="my-1 mr-sm-2"
                            value={this.state.user.role}
                            onChange={this.change.bind(this, 'role')}
                            style={{ fontSize: 18, height: "52px"}}

                        >  
                            <option value="">---</option>
                            <option value="Ứng viên">Ứng viên tìm việc</option>
                            <option value="Nhà tuyển dụng">Nhà tuyển dụng</option>

                        </Form.Control>
                        </div> */}
                        
                        {/* </Form.Group> */}

                        
                        
                        {/* <Col style={{ paddingLeft: 0, paddingRight: 0 }} className="d-flex justify-content-between" > */}
                        {/* <span>Đã có tài khoản? <a href="/login">Đăng nhập</a></span> */}
                        <span>Bạn là nhà tuyển dụng? <a href="/register-recruiter">Đăng ký tuyển dụng</a></span>
                        <Button type="submit" className="btn btn-info btn-block text-uppercase" style={{ fontSize: 18, height: "48px", marginTop: "32px"}}>Đăng ký</Button>
                        {/* </Col> */}
                    </Form>
                </Col>
            </Row>
                    
                    
                <Row lg={2} className='d-flex justify-content-center'>
                    <Col>
                    
                    </Col>
                </Row>
            </div>
            </Container>
            </>
        )
    }
}

export class RegisterForm extends React.Component {
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

export default Register