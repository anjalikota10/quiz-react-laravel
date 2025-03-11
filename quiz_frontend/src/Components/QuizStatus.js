import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';
import { Container, Card, Row} from 'react-bootstrap';
import Header from './Header';
import  {API_URL} from "./config";

const QuizStatus = () => {
  const { id, course_id } = useParams();
  const [statusData, setStatusData] = useState([]);
  const [loading, setLoading] = useState(true);
  function getStatusClass(status) {
    if (status === 'Correct') {
      return 'correct';
    } else if (status === 'Incorrect') {
      return 'incorrect';
    } else if (status === 'Not Attempted') {
      return 'not-attempted';
    }
    return '';
  }
  

  useEffect(() => {
    axios
      .get(`${API_URL}/api/user/${id}/quiz-status/${course_id}`)
      .then((res) => {
        setStatusData(res.data);
        setLoading(false);
      })
      .catch((err) => {
        console.error("Error fetching quiz status:", err);
        setLoading(false);
      });
  }, [id, course_id]);

  if (loading) {
    return <p>Loading...</p>;
  }

  return (
    <>
    <Header/>
    <Container className="mt-5">
  <h3 className="text-center">Quiz Status</h3>
  <Row className="g-3">
    {statusData.length > 0 ? (
      statusData.map((status, index) => (
        <div key={index} md={4} className="status-card">
          <Card.Title className="mb-2">{status.Questions}</Card.Title>
          <Card.Text>
            <strong>Selected Answer: </strong>{status.Selected_ans}
          </Card.Text>
          <Card.Text>
            <strong>Correct Answer: </strong> 
            {status.Correct_Answer}
          </Card.Text>
          <Card.Text>

            <strong>Status: </strong> 
            <span className={`correct-answer ${getStatusClass(status.Status)}`}>
            {status.Status}
            </span>
            
          </Card.Text>
        </div>
      ))
    ) : (
      <p>No status data available.</p>
    )}
  </Row>
</Container>
</>

  );
};

export default QuizStatus;
