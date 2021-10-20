import React from 'react'

import "../css/base.css"
import "../css/main.css"
import { Container, Image } from 'react-bootstrap'
// import SearchForm from './SearchForm'
import banner from '../img/banner.png'
import SearchForm from './SearchForm'

class Banner extends React.Component {
    render() {
        return (
            <>
            <div className="slider">
            <Container>
            <div className="row banner">
                <div className="col-md-8">
                <div style={{background: "transparent"}} className="jumbotron">   
                    <h1 className="display-4 main-heading">Tìm việc làm ngay</h1>    
                    <p className="lead sub-heading">
                    Cùng khám phá những việc làm CNTT tốt nhất trên ITJobs
                    </p>
                </div>
                </div>
                <div className="col-md-4">
                <Image className="img-fluid" src={banner} alt="Hiring Image" style={{width: "100%", height: "auto"}}/>
                </div>
            </div>
            <SearchForm />
            </Container>
            </div>
            

            
            </>
        )
    }
}

export default Banner