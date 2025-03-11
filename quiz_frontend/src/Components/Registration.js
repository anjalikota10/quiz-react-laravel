import Button from 'react-bootstrap/Button';
import Col from 'react-bootstrap/Col';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';
import Header from './Header';
import axios from "axios";
import  {API_URL} from "./config";
import React, { useEffect, useState } from 'react';

function Registration() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [address, setAddress] = useState("");
  const [contact, setContact] = useState("");
  const [image, setImage] = useState(null);
  const [user, setUser] = useState(null);  // To set user Information
  useEffect(() => {
    // Retrieve user details from localStorage
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      setUser(JSON.parse(storedUser));
    }
  }, []);

  function handleSubmit(event) {
    event.preventDefault(); // Prevents page refresh

    const formData = new FormData();
    formData.append("name", name);
    formData.append("email", email);
    formData.append("password", password);
    formData.append("address", address);
    formData.append("contact", contact);
    if (image) {
      formData.append("image", image);
    }
    console.log(formData);

    axios.post("${API_URL}/api/Reg", formData, {
      headers: {
        "Content-Type": "multipart/form-data",
      },
    })
      .then(res => {
        alert("Registration successful! Please login.");
        window.location.href="/login";
      })
      .catch(err => {
        console.log(err);
      });
  }

  return (
    <>
      <Header />
      <Container className="d-flex justify-content-center align-items-center vh-100">
        <div className="p-4 bg-white rounded shadow-lg border" style={{ width: '50%' }}>
          <h3 className="text-center mb-4">Registration Form</h3>
          <Form onSubmit={handleSubmit}>

            <Form.Group className="mb-3" controlId="formGridName">
              <Row>
              <Col sm={4}><Form.Label>{user ? user.name : "Name"}</Form.Label></Col>

                <Col sm={8}>
                  <Form.Control type="text" value={name} onChange={(e) => setName(e.target.value)} placeholder="Enter Name" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridEmail">
              <Row>
                <Col sm={4}><Form.Label>Email</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Enter Email" required />
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

            <Form.Group className="mb-3" controlId="formGridAddress">
              <Row>
                <Col sm={4}><Form.Label>Address</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="text" value={address} onChange={(e) => setAddress(e.target.value)} placeholder="Enter Address" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridContact">
              <Row>
                <Col sm={4}><Form.Label>Contact</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="text" value={contact} onChange={(e) => setContact(e.target.value)} placeholder="Enter Contact" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridImage">
              <Row>
                <Col sm={4}><Form.Label>Upload Image</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="file" accept="image/*" onChange={(e) => setImage(e.target.files[0])} />
                </Col>
              </Row>
            </Form.Group>

            <div className="text-center">
              <Button variant="primary" type="submit" className='custom-btn'>
                Register
              </Button>
            </div>

          </Form>
        </div>
      </Container>
    </>
  );
}

export default Registration;
