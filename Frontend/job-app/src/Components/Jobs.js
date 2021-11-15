import React, { useEffect, useState } from 'react';
import { Container, Row } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import API, { endpoints } from '../Configs/API';
import JobCart from './JobCart';
import Loading from './Loading';
import ReactPaginate from "react-paginate";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faAngleRight, faAngleLeft} from '@fortawesome/free-solid-svg-icons';


export default function Jobs() {
    let [posts, setPosts] = useState([])
    let [pageCount, setpageCount] = useState(0);
    let [currentPage, setCurrentPage] = useState(1);
    let [ isLoading, setLoading ] = useState(true)

    useEffect(() => {
        async function getData(currentPage) {
            let res = await API.get(`${endpoints["posts"]}?page=${currentPage}`)
            setPosts(res.data.results)
            let count = res.data.count
            setpageCount(Math.ceil(count / 10))
            setLoading(false)
        }
        getData(currentPage)
    }, [currentPage])


    const handlePageClick = async (data) => {
        let offsets = document.querySelector(".jobs-wrap").getBoundingClientRect();
        setCurrentPage(data.selected + 1);
        setPosts(posts);
        window.scrollTo((offsets.x + window.scrollX), (offsets.y + window.scrollY - 150))
    }

    return (
        <>
        {isLoading ?  (<Loading/>) :
        (<Container>
        <h3 className="section-tittle text-center text-uppercase mt-3">Danh sách việc làm</h3>
        <div className="jobs-container">
            <div className="jobs-wrap">
                <Row>
                    {posts.map(post =><JobCart post={post} key={post.id}/>)}
                </Row>
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
        </div>
        </Container>
        )}
        </>
    )
}

