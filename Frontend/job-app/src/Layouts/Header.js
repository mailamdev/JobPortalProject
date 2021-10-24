import React, {useEffect, useState} from 'react'
import logo from '../img/logo.png';
import { NavLink } from 'react-router-dom'
import cookies from 'react-cookies'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSortDown, faUserCircle } from '@fortawesome/free-solid-svg-icons';
import { useStore } from 'react-redux';
import { NavDropdown } from 'react-bootstrap';
import { DropdownSubmenu, NavDropdownMenu} from "react-bootstrap-submenu";
import API, { endpoints } from '../Configs/API';


export default function Header() {
    const [click, setClick] = useState(false);
    const handleClick = () => setClick(!click);
    const closeMobileMenu = () => setClick(false);

    // * Lấy thông tin user từ store
    const store = useStore()
    const auth = store.getState()
    let user = auth
    if (cookies.load('user') != null) {
        user = cookies.load('user')
        
    }
    // * Đăng xuất
    const logout = (event) => {
        cookies.remove('access_token')
        cookies.remove('user')
        window.location.href = '/';
    }

    // * Lấy danh sách kỹ năng, thành phố, cấp bậc
    const [skills, setSkills] = useState([])
    const [locations, setLocations] = useState([])
    const [levels, setLevels] = useState([])

    
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
    }, [])

    let dropdownMenu = <>
    <ul className='user-dropdown'>
        <li>
            <NavLink to='/profile' className="user-dropdown-link">Quản lý tài khoản</NavLink>
        </li>
        <li>
            <div onClick={logout} className="user-dropdown-link">Đăng xuất</div>
        </li>
    </ul> 
    </>
   
    if (user != null && user.is_recruiter === true) {
        dropdownMenu =  <>
        <ul className='user-dropdown'>
            <li>
                <NavLink to='/profile' className="user-dropdown-link">Quản lý tài khoản</NavLink>
            </li>
            <li>
                <NavLink to='/recruitment' className="user-dropdown-link">Quản lý tuyển dụng</NavLink>
            </li>
            <li>
                <div onClick={logout} className="user-dropdown-link">Đăng xuất</div>
            </li>
        </ul> 
        </>
    }


    let navbarMenu = <>
        <NavLink to='/login' className='nav-links btn btn-info btn-md' onClick={closeMobileMenu}>
            Đăng nhập
        </NavLink>
        <NavLink to='/register' className='nav-links btn btn-outline-success btn-md' onClick={closeMobileMenu}>
            Đăng ký
        </NavLink>
        
    </>
    
    
    if (user != null) {
        navbarMenu = <> 
        <div className='user'>
        <FontAwesomeIcon icon={faUserCircle}  className="icon"></FontAwesomeIcon>
        <span className='user-name'>{user.last_name} {user.first_name}</span>
        <FontAwesomeIcon icon={faSortDown}  className="icon icon-dropdown"></FontAwesomeIcon>
        {dropdownMenu}
        
        </div>
        </>
    } 

    

    return (
        <>

        {/* <Container fluid> */}
            <nav className="navbar justify-content-md-center">
                <div className="navbar-container">
                    <NavLink to="/" className="navbar-logo"><img src={logo} alt=""/></NavLink>
                    <div className="menu-icon" onClick={handleClick}>
                        <i className={click ? 'fas fa-times' : 'fas fa-bars'}></i>
                    </div>
                    <div className={click ? 'nav-menu active' : 'nav-menu'}>
                        <div className="navbar-list-left">
                            <NavLink to='/' className='nav-links' onClick={closeMobileMenu}>
                                Trang chủ
                            </NavLink>
                            <NavDropdownMenu title="Tất cả việc làm" id="basic-nav-dropdown" className='nav-links'>
                            <DropdownSubmenu title="Việc làm theo kỹ năng" id="dropdown-skill">
                                {skills.map((skill, i) => {
                                let path = `search?skill_id=${skill.id}`
                                return <NavDropdown.Item href={path} key={i} >{skill.name}
                                </NavDropdown.Item>})}
                            </DropdownSubmenu>
                            <NavDropdown.Divider />
                            <DropdownSubmenu title="Việc làm theo thành phố">
                                {locations.map((location, i) => {
                                let path = `search?location_id=${location.id}`
                                return <NavDropdown.Item href={path} key={i}>{location.name}</NavDropdown.Item>})}
                            </DropdownSubmenu>
                            <NavDropdown.Divider />
                            <DropdownSubmenu title="Việc làm theo cấp bậc">
                                {levels.map((level, i) => {
                                let path = `search?level_id=${level.id}`
                                return <NavDropdown.Item href={path} key={i}>{level.name}</NavDropdown.Item>
                                })}
                            </DropdownSubmenu>
                            </NavDropdownMenu>
                        </div>
                        <div className="navbar-list-right">
                            
                            {navbarMenu}
                            
                        </div>
                    </div>
                </div> 
            </nav>
        {/* </Container> */}
        </>
    );
}

