import React, { useState } from 'react';
import Header from './Header';
import Form from 'react-bootstrap/Form';
import Container from "react-bootstrap/Container";
import Button from 'react-bootstrap/Button';
import  {API_URL} from "./config";
import axios from 'axios';

const CourseForm = () => {
  const [name, setName] = useState("");
  const [desc, setDesc] = useState("");
  const [image, setImage] = useState(null);

  function handleClick() {
    const formData = new FormData();
    formData.append("name", name);
    formData.append("description", desc);
    if (image) {
      formData.append("image", image);
    }

    axios.post("${API_URL}/api/Course", formData, {
      headers: {
        "Content-Type": "multipart/form-data",
      },
    })
    .then(res => {
      alert("Course added successfully!");
      setName("");
      setDesc("");
      setImage(null);
    })
    .catch(err => {
      alert("Error adding course!");
      console.error(err);
    });
  }

  return (
    <>
      <Header />
      <div className="form-wrapper mt-5">
        <div className="form-container">
          <h2 className="form-title">Course Form</h2>
          <Form>
            <Container>
              <Form.Group className="mb-3" controlId="courseName">
                <Form.Label>Course Name</Form.Label>
                <Form.Control
                  type="text"
                  name="name"
                  placeholder="Enter Course Name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                />
              </Form.Group>

              <Form.Group className="mb-3" controlId="courseDesc">
                <Form.Label>Enter Description</Form.Label>
                <Form.Control
                  as="textarea"
                  name="desc"
                  placeholder="Enter Course Description"
                  value={desc}
                  onChange={(e) => setDesc(e.target.value)}
                />
              </Form.Group>

              <Form.Group className="mb-3" controlId="courseImage">
                <Form.Label>Upload Image</Form.Label>
                <Form.Control
                  type="file"
                  accept="image/*"
                  name="image"
                  onChange={(e) => setImage(e.target.files[0])}
                />
              </Form.Group>

              <Button className="custom-btn" onClick={handleClick}>
                Add Course
              </Button>
            </Container>
          </Form>
        </div>
      </div>
    </>
  );
};

export default CourseForm;
