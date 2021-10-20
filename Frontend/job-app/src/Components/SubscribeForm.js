import {Form} from "react-bootstrap";

export default function SubscribeForm() {
    return (
        <>
        <div>
            <div id="subscribe-form">
                <div className="subscribe-title">Đăng ký theo dõi ngay<br/> để nhận cập nhật cơ hội việc làm mới và phù hợp nhất.</div>
                <Form id="form" className="row">
                    <Form.Control size="lg" type="email" name="email" placeholder="Nhập địa chỉ email của bạn" id="email"
                    className="email-input"
                    />
                    <Form.Control size="lg" type="submit" id="submit" value="Đăng ký ngay"
                    className="btn-submit text-uppercase"
                    />
                </Form>
            </div>
        </div>
        </>
    )
}