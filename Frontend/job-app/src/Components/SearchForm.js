
import React, {useEffect, useState} from 'react'

import { Button, Form } from 'react-bootstrap';
import { useHistory } from 'react-router';
import API, { endpoints } from '../Configs/API';
// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
// import { faSortDown } from '@fortawesome/free-solid-svg-icons'


export default function SearchForm() {
    let [q, setQ] = useState("")
    // *Danh sách locations, levels gọi từ API
    let [locations, setLocations] = useState([])
    let [levels, setLevels] = useState([])

    // * Location, levels gửi lên API để tìm kiếm
    let [location, setLocation] = useState([])
    let [level, setLevel] = useState([])


    let history = useHistory()

    useEffect(() => {
        async function getLacations() {
            let res = await API.get(endpoints["locations"])
            setLocations(res.data)
        }
        getLacations()
        async function getLevels() {
            let res = await API.get(endpoints["levels"])
            setLevels(res.data)
        }
        getLevels()
    }, [])


    const search = (event) => {
        event.preventDefault()
        history.push(`/search?q=${q}${location}${level}`)
    }


    return (
        <>
        <div className="search-form" style={{display:"flex", justifyContent:"center", marginBottom: "88px"}}>
        <Form onSubmit={search}>
            <div className="inner-form">
            <div className="input-field first-wrap">
                <input id="search" type="text" value={q} onChange={(event) => setQ(event.target.value)} placeholder="Nhập tên công việc, kỹ năng, tên công ty..." /> 
            </div>
            <div className="input-field second-wrap">
                <div className="input-select">
                <select onChange={(event) => setLevel(event.target.value)}>
                <option value="">Tất cả cấp bậc</option>)
                {levels.map(level => {
                    let path = `&level_id=${level.id}`
                    return <option value={path}>{level.name}</option>})}
                </select>
                </div>
            </div>
            <div className="input-field second-wrap">
                <div className="input-select">
                <select onChange={(event) => setLocation(event.target.value)}>
                <option value="">Tất cả địa điểm</option>)
                {/* <FontAwesomeIcon icon={faSortDown}  className="icon icon-dropdown"></FontAwesomeIcon> */}

                {locations.map(l => {
                    let path = `&location_id=${l.id}`
                    return <option value={path}>{l.name}</option>})}
                </select>
                </div>
            </div>
            <div className="input-field third-wrap">
                <Button className="btn btn-search" type="summit">Tìm kiếm</Button>
            </div>
            </div>
        </Form>
        </div>
        </>
    )
}

// class SearchForm extends React.Component {
//     constructor() {
//         super()
//         this.state = {
//             'categories': [],
//         }
//     }
//     componentDidMount() {
//         API.get(endpoints['categories']).then(res => {
//             this.setState({
//                 'categories': res.data.results
//             })
//         })
//     }
//     render() {
//         return (
            // <>
            // <div className="search-form" style={{display:"flex", justifyContent:"center", marginBottom: "88px"}}>
            // <form>
            //     <div className="inner-form">
            //     <div className="input-field first-wrap">
            //         <input id="search" type="text" placeholder="Nhập tên công việc, vị trí..." />
            //     </div>
            //     {/* <div className="input-field second-wrap">
            //         <div className="input-select">
            //         <select data-trigger="" name="choices-single-defaul">
            //             <option placeholder="" value="all">Tất cả ngành nghề</option>
            //             {this.state.categories.map(c => <option value={c.name}>{c.name}</option>)}
            //         </select>
            //         </div>
            //     </div> */}
            //     <div className="input-field second-wrap">
            //         <div className="input-select">
            //         <select data-trigger="" name="choices-single-defaul">
            //             <option placeholder="">Tất cả địa điểm</option>
            //             <option placeholder="" value="Hồ Chí Minh">Hồ Chí Minh</option>
            //             <option placeholder="" value="Hà Nội">Hà Nội</option>
            //             <option placeholder="" value="Đà Nẵng">Đà Nẵng</option>
            //         </select>
            //         </div>
            //     </div>
            //     <div className="input-field third-wrap">
            //         <button className="btn-search" type="button">Tìm kiếm</button>
            //     </div>
            //     </div>
            // </form>
            // </div>
            // </>
//         )
//     }
// }

// export default SearchForm