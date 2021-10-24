import React, { useEffect, useState } from 'react';
import { Container, Pagination, Row } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Link } from 'react-router-dom';
import API, { endpoints } from '../Configs/API';
import JobCart from './JobCart';
import { useLocation } from "react-router";
import Loading from './Loading';



export default function Jobs() {
    let [posts, setPosts] = useState([])
    let [count, setCount] = useState(0)
    let location = useLocation()
    let [ isLoading, setLoading ] = useState(true)


    useEffect(() => {
        async function getData(page="?page=1") {
            let res = await API.get(`${endpoints["posts"]}${page}`)
            setPosts(res.data.results)
            setCount(res.data.count)
            setLoading(false)
        }
        getData(location.search)
    }, [location])

    let items = []
    for (let i = 0; i < Math.ceil(count/6); i++) {
        items.push (
            <Pagination.Item><Link to={"/?page=" + (i + 1)} >{i + 1}</Link></Pagination.Item>
        )
    }


        return (
            <>
            {isLoading ?  (<Loading/>) :
        (<Container>
        <h3 className="section-tittle text-center text-uppercase mt-3">Danh sách việc làm</h3>
        <Pagination>
            {items}
        </Pagination>
        <div className="jobs-wrap">
         
            <Row>
                {posts.map(post =><JobCart post={post} key={post.id}/>)}
            </Row>
        
        </div>
        </Container>
        )}
        </>
        )
}

