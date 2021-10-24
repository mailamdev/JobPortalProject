import { useState, useEffect } from "react"
import API, { endpoints } from '../../Configs/API'
import cookies from 'react-cookies'
import Loading from "../Loading"



export default function RecruitmentJob() {
    let [ isLoading, setLoading ] = useState(true)
    const user = cookies.load('user')
    const userId = user.id
    let [company, setCompany] = useState(null) 
    let [posts, setPosts] = useState(null) 

    console.log(user.id)
    
    useEffect(() => {
        async function getCompany() {
            let res = await API.get(endpoints['recruiter-company'](userId), {
                headers: {
                  'Authorization':  `Bearer ${cookies.load('access_token')}`
                }
            })
            setCompany(res.data)
        }
        getCompany()

        if (company!==null) {
            async function getPosts() {
                let res = await API.get(endpoints["company-jobs"](company.id))
                setPosts(res.data)
            }
            getPosts()
        }
        setLoading(false)
    },[userId])

    return(
        <>
        {isLoading ?  (<Loading/>) : (
            <a href="d">a</a>
        )}
        </>
    )
}