import React, { useState} from "react";
import { Container, Form, Row, Col, Button } from 'react-bootstrap';
import Header from "./Header";

function Forgot() {
   
    const [password, setPassword] = useState("");
    const [email, setEmail] = useState("");

    const submitemail = async (e) => {
        e.preventDefault(); 
        alert("Your new password send to your email");
        window.location.href="/login";
        
        };
  return (
    <>
     <Header />
      <Container className="d-flex justify-content-center align-items-center vh-100">
        <div className="p-4 bg-white rounded shadow-lg border" style={{ width: '50%' }}>
          <h3 className="text-center mb-4">Forget Password</h3>
          <Form onSubmit={submitemail}>

          <Form.Group className="mb-3" controlId="formGridPassword">
              <Row>
                <Col sm={4}><Form.Label>Email</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="email"   value={email} onChange={(e)=>setEmail(e.target.value)} placeholder="Enter Email Address" required />
                </Col>
              </Row>
            </Form.Group>
            
            <Form.Group className="mb-3" controlId="formGridPassword">
              <Row>
                <Col sm={4}><Form.Label>Password</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="password"   value={password} onChange={(e)=>setPassword(e.target.value)} placeholder="Enter Password" required />
                </Col>
              </Row>
            </Form.Group>

            <div className="text-center">
              <Button variant="primary" type="submit" className='custom-btn'>
                Submit
              </Button>
            </div>
          </Form>
        </div>
      </Container>
    </>
  )
}

export default Forgot