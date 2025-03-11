import React, { useEffect, useState } from 'react';
import Button from 'react-bootstrap/Button';
import Col from 'react-bootstrap/Col';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';
  import { useParams } from 'react-router-dom';
import  {API_URL} from "./config";
import Header from './Header';
import axios from "axios";

function User_info() {
  const { id } = useParams();
  const [name, setName] = useState("test");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [address, setAddress] = useState("");
  const [contact, setContact] = useState("");
  const [image, setImage] = useState("");
  

  const getdata = () => {
    axios.get(`${API_URL}/api/Reg/` + id)
      .then(res => {
        const data = res.data;
        setName(data.name);
        setEmail(data.email);
        setPassword(data.password);
        setAddress(data.address);
        setContact(data.contact);

      })
      .catch(err => {
        console.error("Error fetching data:", err.response || err);
      });
  }
  

//   function handleSubmit(event) { 
//     event.preventDefault(); // Prevents page refresh

//     const data={
//       name:name,
//       email:email,
//       password:password,
//       address:address,
//       contact:contact,
//       id:id,
//     }
//      console.log(data);

//      axios.put(`${API_URL}/api/Reg/${id}`, data, {
//       headers: {
//         "Content-Type": "application/json",
//       },
//     })
//       .then(res => {
//         alert("Data Updated successful!");

//         console.log(res);
//       })
//       .catch(err => {
//         console.log("Error:", err.response);
//         alert("An error occurred while updating. Please try again.");
//       });
//     }

function handleSubmit(event) {
  event.preventDefault(); // Prevents page refresh

  const formData = new FormData();
  formData.append("name", name);
  formData.append("email", email);
  formData.append("password", password);
  formData.append("address", address);
  formData.append("contact", contact);
  formData.append("id",id);

  if (image) {
    formData.append("image", image);
  }
  axios.post(`${API_URL}/api/update`, formData, {
    headers: {
      "Content-Type": "multipart/form-data",
    },
  })
    .then(res => {
      alert("Update successful!");
      console.log(res);
    })
    .catch(err => {
      alert("Data Not Update successful!");
      console.log(err);
    });
}
  
useEffect(() => {
  getdata();
}, [id]);
 
 
  return (
    <>
      <Header />
      <Container className="d-flex justify-content-center align-items-center vh-100">
        <div className="p-4 bg-white rounded shadow-lg border" style={{ width: '50%' }}>
          <h3 className="text-center mb-4">User Information Form</h3>
          <Form onSubmit={handleSubmit}>

            <Form.Group className="mb-3" controlId="formGridName">
              <Row>
                <Col sm={4}><Form.Label>Name</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="text" name="name" value={name} onChange={(e) => {setName(e.target.value);}} placeholder="Enter Name" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridEmail">
              <Row>
                <Col sm={4}><Form.Label>Email</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="email" name="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Enter Email" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridPassword">
              <Row>
                <Col sm={4}><Form.Label>Password</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="password" name="password" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Enter Password" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridAddress">
              <Row>
                <Col sm={4}><Form.Label>Address</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="text" name="address" value={address} onChange={(e) => setAddress(e.target.value)} placeholder="Enter Address" required />
                </Col>
              </Row>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formGridContact">
              <Row>
                <Col sm={4}><Form.Label>Contact</Form.Label></Col>
                <Col sm={8}>
                  <Form.Control type="text" name="contact" value={contact} onChange={(e) => setContact(e.target.value)} placeholder="Enter Contact" required />
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
                Submit
              </Button>
            </div>
          </Form>
        </div>
      </Container>
    </>
  );
}

export default User_info;
