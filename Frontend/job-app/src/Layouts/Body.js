import React from 'react'
import Banner from '../Components/Banner';
// import SearchForm from './SearchForm';
import Jobs from '../Components/Jobs';
import CompanyList from '../Components/CompanyList';
import { Container } from 'react-bootstrap';
// import SubscribeForm from '../Components/SubscribeForm';
import Footer from './Footer';
// import PopularCategory from '../Components/PopularCategory';
// import Header from './Header';
// import SearchJobs from '../Components/SearchJobs'
// import PopularCategory from '../Components/PopularCategory';



class Body extends React.Component {
    render() {
        return(
            <>
            {/* <Container> */}
            <Banner />
            <Jobs />
            <CompanyList />
            {/* <SearchJobs /> */}
            {/* <SubscribeForm /> */}
            {/* </Container> */}
            <Footer />

            </>
        )
    }
}

export default Body