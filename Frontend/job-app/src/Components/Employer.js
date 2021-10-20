import React from 'react'
// import Header from './Header';
import Footer from '../Layouts/Footer';
import banner2 from '../img/banner2.jpg'
import { Button, Container, Image } from 'react-bootstrap';
export default function App(props) {
    
    // const [user, setUser] = useState(null)
  
    
  
      return (
        <>
            {/* <Header /> */}
            <Container>
            <div className="row banner" style={{height: '50vh'}}>
                <div className="col-md-8">
                <div style={{background: "transparent"}} className="jumbotron">   
                    <h1 className="display-4 main-heading">Đăng tin tuyển dụng</h1>    
                    <p className="lead sub-heading">
                    Tìm Đúng Người, Trao Đúng Việc
                    </p>
                    <div>
                    <Button variant="primary" size="lg" style={{marginTop:'16px'}}>
                    Đăng tin ngay
                    </Button>
                    </div>
                </div>
                </div>
                <div className="col-md-4">
                <Image className="img-fluid" src={banner2} alt="Hiring Image" style={{width: "100%", height: "auto"}}/>
                </div>
            </div>
            </Container>
            <Footer />

            </>
      )
  }