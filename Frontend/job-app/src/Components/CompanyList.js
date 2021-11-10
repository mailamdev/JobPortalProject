import React, { useEffect, useState } from 'react';
import {Container, Row } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import API, { endpoints } from '../Configs/API';
import CompanyCard from './CompanyCard';
import Loading from './Loading';
import ReactPaginate from "react-paginate";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faAngleRight, faAngleLeft} from '@fortawesome/free-solid-svg-icons';


export default function CompanyList() {
    let [companies, setCompanies] = useState([])
    let [ isLoading, setLoading ] = useState(true)

    // let [items, setItems] = useState([]);
    let [pageCount, setpageCount] = useState(0);
    // let [count, setCount] = useState(0)
    let [currentPage, setCurrentPage] = useState(1);

    // let total  = 10;
  
    // let [count, setCount] = useState(0)
    // let location = useLocation()

    useEffect(() => {
        async function getData(currentPage) {
            let res = await API.get(`${endpoints["companies"]}?page=${currentPage}`)
            setCompanies(res.data.results)
            let count  = res.data.count
            setpageCount(Math.ceil(count / 6))
            setLoading(false)

        }
        getData(currentPage)
        // location.search
    }, [currentPage])

    const handlePageClick = async (data) => {
        setCurrentPage(data.selected + 1);
        setCompanies(companies);
    }

        return (
            <>
            {isLoading ?  (<Loading/>) : (
        <Container>
            <h3 className="section-tittle text-center text-uppercase mt-3">Danh sách công ty</h3>
            
        <Row className="company-container">
            <div className="company-wrap">
                {companies.map(company =><CompanyCard company={company} key={company.id}/>)}
            </div>
            <ReactPaginate
            previousLabel={<FontAwesomeIcon icon={faAngleLeft} className="icon"></FontAwesomeIcon>}
            nextLabel={<FontAwesomeIcon icon={faAngleRight} className="icon"></FontAwesomeIcon>}
            breakLabel={"..."}
            pageCount={pageCount}
            marginPagesDisplayed={2}
            pageRangeDisplayed={3}
            onPageChange={handlePageClick}
            containerClassName={"pagination justify-content-center"}
            pageClassName={"page-item"}
            pageLinkClassName={"page-link"}
            previousClassName={"page-item"}
            previousLinkClassName={"page-link"}
            nextClassName={"page-item"}
            nextLinkClassName={"page-link"}
            breakClassName={"page-item"}
            breakLinkClassName={"page-link"}
            activeClassName={"active"}
        />
        </Row>
        
        </Container>
        )}
        </>
        )
}

