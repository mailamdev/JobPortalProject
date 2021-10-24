import React, { useEffect, useState } from 'react';
import {Container, Row } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import API, { endpoints } from '../Configs/API';
import CompanyCard from './CompanyCard';
import Loading from './Loading';




export default function CompanyList() {
    let [companies, setCompanies] = useState([])
    let [ isLoading, setLoading ] = useState(true)

    // let [count, setCount] = useState(0)
    // let location = useLocation()

    useEffect(() => {
        async function getData() {
            let res = await API.get(endpoints["companies"])
            setCompanies(res.data)
            setLoading(false)

            // setCount(res.data.count)
        }
        getData()
        // location.search
    }, [])
    // location

    // let items = []
    // for (let i = 0; i < Math.ceil(count/6); i++) {
    //     items.push (
    //         <Pagination.Item><Link to={"/?page=" + (i + 1)}>{i + 1}</Link></Pagination.Item>
    //     )
    // }

        return (
            <>
            {isLoading ?  (<Loading/>) : (
        <Container>
            <h3 className="section-tittle text-center text-uppercase mt-3">Danh sách công ty</h3>
        {/* <Pagination>
            {items} 
        </Pagination> */}
        <Row>
            <div className="company-wrap">
                {companies.map(company =><CompanyCard company={company} key={company.id}/>)}
            </div>
        </Row>
        </Container>
        )}
        </>
        )
}

