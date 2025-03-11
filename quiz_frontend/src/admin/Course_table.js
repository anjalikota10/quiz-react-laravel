import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import Header from './Header';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import  {API_URL} from "./config";
import Button from 'react-bootstrap/Button';

const CourseTable = () => {
  const [courses, setCourses] = useState([]);

  // Fetch courses data from API
  useEffect(() => {
    const getData = async () => {
      try {
        const res = await axios.get("${API_URL}/api/Course");
        setCourses(res.data);
      } catch (error) {
        console.error("Error fetching course data:", error);
      }
    };
    getData();
  }, []);

  return (
    <>
      <Header />
      <div className="custom-main-content">
        <Container className="custom-course-container">
          <div className="d-flex justify-content-between align-items-center mb-3">
            <h3 className="custom-table-title">Course Details</h3>
            <Link to="/course_form">
              <Button className="custom-btn">Add Course</Button>
            </Link>
          </div>
          <div className="custom-table-wrapper">
            <Table striped bordered hover responsive className="custom-course-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Course Name</th>
                  <th>Image</th>
                  <th>Description</th>
                </tr>
              </thead>
              <tbody>
                {courses.length > 0 ? (
                  courses.map((course, index) => (
                    <tr key={index}>
                      <td>{course.id}</td>
                      <td>{course.name}</td>
                      <td><img src={`${API_URL}/images/${course.image}`}  style={{ height: '50px',width: '100px', objectFit: 'cover' }}/></td>
                      <td>{course.description}</td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="4" className="text-center">No courses available</td>
                  </tr>
                )}
              </tbody>
            </Table>
          </div>
        </Container>
      </div>
    </>
  );
};

export default CourseTable;
