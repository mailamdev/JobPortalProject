import { useEffect, useState } from "react";
import { Alert, Container, Row } from "react-bootstrap";
import { useLocation } from "react-router";
import API, { endpoints } from "../Configs/API";
import JobCart from "./JobCart";
import Loading from "./Loading";

export default function SearchJobs() {
    let [posts, setPosts] = useState([])
    let [ isLoading, setLoading ] = useState(true)
    let location = useLocation()

    useEffect(() => {
        async function getData() {
            let query = location.search
            let res = await API.get(`${endpoints["posts"]}${query}`)
            setPosts(res.data.results)
            setLoading(false)
        }
        getData()
    },[location])
    

    return (
        <>
        {isLoading ?  (<Loading/>) : (
        <Container>
        <div className="main">
        {posts.length > 0 ? (<Row>
            {posts.map(post =><JobCart post={post}/>)}
        </Row>) : (
            <Alert variant="info" className="mt-3">
                Chưa có việc làm phù hợp
            </Alert>
        )}
        </div>
        </Container> )}
        </>
    )
}