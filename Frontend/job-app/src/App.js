import React from 'react'
import {BrowserRouter, Route, Switch} from 'react-router-dom'
import Body from './Layouts/Body';
import Register from './Components/Register';
import Login from './Components/Login';
import JobDetails from './Components/JobDetails';
import Company from './Components/Company';
import Header from './Layouts/Header';
import SearchJobs from './Components/SearchJobs';
import Profile from './Components/Profile';
import SavedJobs from './Components/SavedJobs';
import AppliedJobs from './Components/AppliedJobs';
import RegisterRecruiter from './Components/Recruiter/RegisterRecruiter';
import AddCompany from './Components/Recruiter/AddCompany';
import AddPost from './Components/Recruiter/AddPost';
import PrivateRoute from './Route/PrivateRoute';
import Recruitment from './Components/Recruiter/Recruitment';
import RecruitmentJobs from './Components/Recruiter/RecruitmentJobs';



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
              <Route exact path="/login" component={Login}/>
              <Route exact path="/search" component={SearchJobs}/>
              <Route exact path="/company/:companyId/posts/" component={Company}/>
              <Route exact path="/posts/:postId/" component={JobDetails}/>
              <Route exact path="/profile" component={Profile}/>
              <Route exact path="/saved-jobs" component={SavedJobs}/>
              <Route exact path="/applied-jobs" component={AppliedJobs}/>

              <PrivateRoute exact path="/add-company" component={AddCompany}/>
              <PrivateRoute exact path="/recruitment" component={Recruitment}/>
              <PrivateRoute exact path="/recruitment-jobs" component={RecruitmentJobs}/>
              <PrivateRoute exact path="/add-post" component={AddPost}/>



              
            </Switch>
            {/* <Footer/> */}
        </BrowserRouter>
        {/* </UserContext.Provider> */}
      </>
    )
}


