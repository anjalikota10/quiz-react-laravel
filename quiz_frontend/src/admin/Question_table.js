import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import Header from './Header';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import  {API_URL} from "./config";

import Button from 'react-bootstrap/Button';

const QuestionTable = () => {
  const [questions, setQuestions] = useState([]);

  // Fetch questions from API
  useEffect(() => {
    const getData = async () => {
      try {
        const res = await axios.get("${API_URL}/api/Question");
        setQuestions(res.data);
      } catch (error) {
        console.error("Error fetching questions:", error);
      }
    };
    getData();
  }, []);

  return (
    <>
      <Header />
      <div className="custom-main-content mt-5">
        <Container className="custom-container">
          <div className="d-flex justify-content-between align-items-center mb-3">
            <h3 className="custom-table-title">Question Details</h3>
            {/* <Link to="/question_form">
              <Button className="custom-btn">Add Question</Button>
            </Link> */}
          </div>
          <div className="custom-table-wrapper">
            <Table striped bordered hover responsive className="custom-course-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Question</th>
                  <th>Answers</th>
                  <th>Correct Answer</th>
                </tr>
              </thead>
              <tbody>
                {questions.length > 0 ? (
                  questions.map((question, index) => (
                    <tr key={index}>
                      <td>{question.id}</td>
                      <td>{question.Questions}</td>
                      <td>{question.Answer}</td>
                      <td>{question.Correct_Answer}</td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="4" className="text-center">No questions available</td>
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

export default QuestionTable;
