import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import { Link } from 'react-router-dom'; 
import { FaUserEdit } from "react-icons/fa";
import { Row, Col, Container, Card, Button } from "react-bootstrap";
import Header from "./Header";
import  {API_URL} from "./config";
import "./style.css";


const Profile = () => {
  const { id } = useParams(); // Get user ID from URL
  const [userData, setUserData] = useState(null);
  const [quizData, setQuizData] = useState([]); // Store quiz performance data

  useEffect(() => {
    // Fetch user details
    axios
      .get(`${API_URL}/api/user/${id}`)
      .then((res) => {
        console.log("User Data:", res.data);
        setUserData(res.data);
      })
      .catch((err) => console.log("User Fetch Error:", err));

    // Fetch quiz performance
    axios
      .get(`${API_URL}/api/user/${id}/quiz-performance`)
      .then((res) => {
        console.log("Quiz Performance Data:", res.data);
        setQuizData(res.data);
      })
      .catch((err) => console.log("Quiz Fetch Error:", err));
  }, [id]);
  const handleDelete = (courseId) => {
    axios
      .delete(`${API_URL}/api/delete/${courseId}`)
      .then((res) => {
        console.log(res.data.message);
        setQuizData(quizData.filter((quiz) => quiz.course_id !== courseId)); // Remove deleted quiz from UI
      })
      .catch((err) => console.log("Delete Error:", err));
  };

  return (
    <>
      <Header />
      <Container className="mt-5">
        <Card className="p-4 shadow-lg">
          {userData ? (
            <>
              <h3 className="text-center">{userData.name}'s Profile   <Link to={`/UserInfo/${userData.id}`} className="mr-2 text-center">
                <FaUserEdit size={25} /></Link></h3>
              <p className="text-center">Email: {userData.email}</p>
            </>
          ) : (
            <p className="text-center">Loading user data...</p>
          )}

          <h4 className="mt-4">Quiz Performance</h4>

          {quizData.length > 0 ? (
            <Row className="g-3">
              {quizData.map((quiz, index) => (
                <Col key={index} md={4}>
                  <Card style={{ width: "18rem" }}>
                  <Card.Img
                    variant="top"
                    src={`http://127.0.0.1:8000/images/${quiz.course_image}`}
                    alt={quiz.name}
                    style={{
                      height: '200px', // Adjust to your desired height
                      objectFit: 'cover', // This ensures the image covers the area and maintains aspect ratio
                      width: '100%', // Ensures the image spans the full width of the card
                    }}
                  />
                    <Card.Body>
                      <Card.Title>{quiz.course_name}</Card.Title>
                      <Card.Text>
                        <strong>Over All Question</strong> {quiz.question_count}
                      </Card.Text>
                      <Card.Text>
                        <strong>Correct Answers:</strong> {quiz.correct_answers_count}
                      </Card.Text>
                      <Card.Text>
                        <strong>Wrong Answers:</strong> {quiz.incorrect_answers_count}
                      </Card.Text>
                      <Card.Text>
                        <strong>Not attempted Question</strong> {quiz.difference}
                      </Card.Text>
                      
                      <Button variant="danger" onClick={() => handleDelete(quiz.course_id)}>
                        Delete </Button>
                        <Button
                        variant="primary"
                        className="mx-2"
                        onClick={() => window.location.href = `/user/${id}/quiz-status/${quiz.course_id}`}
                      >
                        Status
                      </Button>
                    </Card.Body>
                  </Card>
                </Col>
              ))}
            </Row>
          ) : (
            <p className="text-center">No quiz performance data available.</p>
          )}
        </Card>
      </Container>
    </>
  );
};

export default Profile;
