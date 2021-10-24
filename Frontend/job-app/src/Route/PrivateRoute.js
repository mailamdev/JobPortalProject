import React from 'react';
import { Route, Redirect } from 'react-router-dom';
import cookies from 'react-cookies'

const PrivateRoute = ({component: Component, ...rest}) => {
    // let [user, setUser] = useState(null) 

    // useEffect(() => {
    //     async function getUser() {
    //         let res = await API.get(endpoints['current-user'], {
    //             headers: {
    //               'Authorization':  `Bearer ${cookies.load('access_token')}`
    //             }
    //         })
    //         console.log(res.data.is_recruiter)
    //         setUser(res.data.is_recruiter)
            
    //     }
    //     getUser()
    // }, [])
    var isRecruiter = false
    const user = cookies.load('user')
    if (user !== undefined) {
        isRecruiter = user.is_recruiter
    }
    return (

        // Show the component only when the user is logged in
        // Otherwise, redirect the user to /signin page
        <Route {...rest} render={props => (
            isRecruiter === true ?
                <Component {...props} />
            : <Redirect to="/" />
        )} />
    );
};

export default PrivateRoute;