import Button from 'react-bootstrap/Button';
import Col from 'react-bootstrap/Col';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';
import Header from './Header';
import  {API_URL} from "./config";
import axios from "axios";
import { useState } from 'react';


function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  

  function handleSubmit(event) {
    event.preventDefault(); // Prevent form from refreshing the page

    const data = { 
      email: email,
      password: password,
    };

    axios.post("${API_URL}/api/login", data)
      .then(res => {
        alert("Login successful!");
       
        localStorage.setItem("user", JSON.stringify(res.data.user));

        window.location.href="/";
      })
      .catch(err => {
        alert("Invalid login credentials! Please register.");
        window.location.href="/registration"; 
      });
  }

  return (
    <>
      <Header />
      <Container className="d-flex justify-content-center align-items-center vh-100">
        <div className="p-4 bg-white rounded shadow-lg border" style={{ width: '50%' }}>
          <h3 className="text-center mb-4">Login Form</h3>
          <Form onSubmit={handleSubmit}>
            <Form.Group className="mb-3" controlId="formGridEmail">
              <Row>
                <Col sm={4}><Form.Label>Email</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Enter email" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridPassword">
              <Row>
                <Col sm={4}><Form.Label>Password</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="password" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Enter Password" required />
                </Col>
              </Row>
              
            </Form.Group>
            <div className="text-center">
              <Button type="submit" className='custom-btn'>
                Login
              </Button>
            </div>
          </Form>
        </div>
      </Container>
    </>
  );
}

export default Login;
