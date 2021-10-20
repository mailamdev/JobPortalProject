import { Col } from "react-bootstrap";
import { Link } from "react-router-dom";

export default function CompanyCard(props) {
    let path = `/company/${props.company.id}/posts/`
    return ( 
        <>
        <Col xs={12} md={6} lg={3}>
                <Link to={path} className="company-item">
                    <div className="company-item-logo">
                        <img src={props.company.image} alt={props.company.name}/>

                    </div>
                    <div className="company-item-name">
                        {props.company.name}
                    </div>
                    {/* <div className="company-positions">
                        <span className="number">{this.props.item.jobs}</span>
                        <span> Việc làm</span>
                    </div> */}
                </Link>
            </Col>
        </>
    )
}