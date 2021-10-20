import React from 'react'
import {BrowserRouter, Route, Switch} from 'react-router-dom'


import Body from './Layouts/Body';
import Register from './Components/Register';
import Login from './Components/Login';
import JobDetails from './Components/JobDetails';
// import Jobs from './Components/Jobs';
import Company from './Components/Company';

// import { PrivateRoute } from './Components/PrivateRoute';
// import EmployerPage from './Components/EmployerPage';
import Header from './Layouts/Header';
import SearchJobs from './Components/SearchJobs';
import Profile from './Components/Profile';
import SavedJobs from './Components/SavedJobs';
import AppliedJobs from './Components/AppliedJobs';
import RegisterRecruiter from './Components/RegisterRecruiter';
import AddCompany from './Components/AddCompany';
import PrivateRoute from './Route/PrivateRoute';

// import Footer from './Layouts/Footer';


export let UserContext = React.createContext()



export default function App(props) {
  // const [user, setUser] = useState(null)
    return (
      <>
      {/* <UserContext.Provider value={{user, login}} > */}
        <BrowserRouter>
            <Header/>
            <Switch>
              <Route exact path="/" component={Body}/>
              <Route exact path="/register" component={Register}/>
              <Route exact path="/register-recruiter" component={RegisterRecruiter}/>
              <PrivateRoute exact path="/add-company" component={AddCompany}/>


              <Route exact path="/login" component={Login}/>
              {/* <Route exact path="/jobs" component={Jobs}/> */}
              <Route exact path="/search" component={SearchJobs}/>
              {/* <PrivateRoute exact path="/employer" component={EmployerPage}/> */}
              <Route exact path="/company/:companyId/posts/" component={Company}/>
              <Route exact path="/posts/:postId/" component={JobDetails}/>
              <Route exact path="/profile" component={Profile}/>
              <Route exact path="/saved-jobs" component={SavedJobs}/>
              <Route exact path="/applied-jobs" component={AppliedJobs}/>

              
            </Switch>
            {/* <Footer/> */}
        </BrowserRouter>
        {/* </UserContext.Provider> */}
      </>
    )
}


