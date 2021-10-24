import React from 'react'
import Banner from '../Components/Banner';
import Jobs from '../Components/Jobs';
import CompanyList from '../Components/CompanyList';
import Footer from './Footer';



class Body extends React.Component {
    render() {
        return(
            <>
            <Banner />
            <Jobs />
            <CompanyList />
            <Footer />

            </>
        )
    }
}

export default Body