import React, { useState, useEffect } from 'react';

import axios from 'axios';
import Header from './Header';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import  {API_URL} from "./config";

import { useParams } from "react-router-dom";

const Status = () => {
  const [Quiz, setQuizData] = useState([]);
  const { id } = useParams();
  // Fetch courses data from API
  useEffect(() => {
    axios
    .get(`${API_URL}/api/user/${id}/quiz-performance`)
    .then((res) => {
      console.log("Quiz Performance Data:", res.data);
      setQuizData(res.data);
    })
    .catch((err) => console.log("Quiz Fetch Error:", err));
}, [id]);

  return (
    <>
      <Header />
      <div className="custom-main-content mt-5">
        <Container className="custom-course-container">
          <div className="d-flex justify-content-between align-items-center mb-3">
            <h3 className="custom-table-title">Course Details</h3>

          </div>
          <div className="custom-table-wrapper">
            <Table striped bordered hover responsive className="custom-course-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Course Name</th>
                  <th>Image</th>
                  <th>Total Question</th>
                  <th>Correct Answer</th>
                  <th>Wrong Answer</th>
                  <th>Not Attempted</th>
                
                </tr>
              </thead>
              <tbody>
              {
        Quiz.map(function(item,i){
            return(
                <tr>
                    <td>{item.course_id}</td>
                    <td>{item.course_name}</td>
                    <td><img src={`${API_URL}/images/${item.course_image}`}  style={{ height: '50px',width: '100px', objectFit: 'cover' }}/></td>
                    <td>{item.question_count}</td>
                    <td>{item.correct_answers_count}</td>
                    <td>{item.incorrect_answers_count}</td>
                    <td>{item.difference}</td>
                   
                </tr>
            )
        })
        }
              </tbody>
            </Table>
          </div>
        </Container>
      </div>
    </>
  );
};

export default Status;
