import logo from '../img/logo.png';
import API, { endpoints } from '../Configs/API';
import React, {useEffect, useState} from 'react'
import { Link } from 'react-router-dom';


export default function Footer() {
    const [locations, setLocations] = useState([])
    useEffect(() => {
        async function getLacation() {
            let res = await API.get(endpoints["locations"])
            setLocations(res.data)
        }
        getLacation()
    }, [])
    
    return(
        <>
        <footer>
            <div id="footer">
                <div className="footer-item">
                    <img src={logo} alt="logo" id="footer-img"/>
                </div>  
                <div className="footer-item">
                    <ul>
                        <h5>Thông tin liên hệ</h5>
                        <li><i className="fas fa-phone"></i> +256 774 897645</li>
                        <li><i className="fas fa-envelope"></i> contact@itjobs.com</li>
                    </ul>
                </div>
                <div className="footer-item">
                    <ul>
                        <h5>Việc làm IT theo khu vực</h5>
                        {locations.map((location, i) => {
                        let path = `search?location_id=${location.id}`
                        return <li key={i}><Link to={path}>{location.name}</Link></li>})}
                       
                    </ul>
                </div>
                <div className="footer-item">
                    <ul>
                        <h5>Trung tâm trợ giúp</h5>
                        <li>Về Jobhub</li>
                        <li>Thỏa thuận sử dụng</li>
                        <li>Quy định bảo mật</li>
                        <li>Chính Sách BV Thông Tin</li>
                        <li>Trợ giúp</li>
                    </ul>
                </div>
            </div>
        </footer>
        {/* <div id="copyright">
            <span>&copy; 2021. Developed by Mai Lam </span>
        </div> */}
        </>
    )
}