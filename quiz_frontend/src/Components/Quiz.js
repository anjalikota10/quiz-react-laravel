import React, { useState, useEffect } from "react";
import { useParams} from "react-router-dom";
import axios from "axios";
import { Container, Card, Form, Button } from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import  {API_URL} from "./config";

import Header from "./Header";

const Quiz = () => {
  const { id } = useParams();
  
  const [fetchdata, setFetch] = useState([]);
  const [user, setUser] = useState(null);
  const [selectedOptions, setSelectedOptions] = useState({});
  const [timeLeft, setTimeLeft] = useState(600); // 10 minutes (600 seconds)
  const [hasAttempted, setHasAttempted] = useState(false);

  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      setUser(JSON.parse(storedUser));
    }
  }, []);

  // Check if the user has already attempted the quiz
  useEffect(() => {
    if (user) {
      axios
        .get(`${API_URL}/api/check-quiz-attempt`, {
          params: { user_id: user.id, course_id: id },
        })
        .then((res) => {
          if (res.data.attempted) {
            setHasAttempted(true);
          } else {
            fetchQuestions();
          }
        })
        .catch((err) => console.log(err));
    }
  }, [user, id]);

  // Fetch quiz questions if not attempted
  const fetchQuestions = () => {
    axios
      .get(`${API_URL}/api/Question/${id}`)
      .then((res) => setFetch(res.data))
      .catch((err) => console.log(err));
  };

  // Timer logic
  useEffect(() => {
    if (timeLeft <= 0) {
      handleSubmit(); // Auto-submit when time reaches 0
    }

    const timer = setInterval(() => {
      setTimeLeft((prevTime) => (prevTime > 0 ? prevTime - 1 : 0));
    }, 1000);

    return () => clearInterval(timer);
  }, [timeLeft]);

  const handleOptionChange = (questionId, option) => {
    setSelectedOptions({ ...selectedOptions, [questionId]: option });
  };

  const handleSubmit = async () => {
    if (!user) {
      alert("User not found. Please log in.");
      return;
    }

    const submissionData = {
      Course_id: id,
      req_id: user.id,
      answers: Object.entries(selectedOptions).map(([questionId, answer]) => ({
        Question_id: questionId,
        Selected_ans: answer,
      })),
    };

    try {
      const response = await axios.post("${API_URL}/api/submit-quiz", submissionData);
      alert("Your answers have been submitted successfully!");
      console.log(response.data);
      window.location.href = "/";
    } catch (error) {
      console.error("Error submitting quiz:", error);
      alert("Failed to submit quiz. Please try again.");
    }
  };

  // Convert timeLeft (seconds) into MM:SS format
  const formatTime = (seconds) => {
    const minutes = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${minutes}:${secs < 10 ? "0" : ""}${secs}`;
  };

  return (
    <>
      <Header />
      <Container className="d-flex justify-content-center align-items-center mt-5 bg-light" style={{ minHeight: "100vh" }}>
        <Card className="p-4 shadow-lg" style={{ width: "50rem", borderRadius: "10px" }}>
          <h3 className="text-center">MCQ Test</h3>

          {hasAttempted ? (
            <h5 className="text-center text-danger">
              You have already attempted this quiz. You cannot take it again.
            </h5>
          ) : (
            <>
              <h5 className="text-center text-danger">Time Left: {formatTime(timeLeft)}</h5>
              {fetchdata.length === 0 ? (
                <p className="text-center">No questions available for this course.</p>
              ) : (
                fetchdata.map((item, i) => {
                  const optionsArray = JSON.parse(item.Answer);
                  return (
                    <div key={item.id} className="mb-4">
                      <Card.Title className="mb-2">{i + 1}. {item.Questions}</Card.Title>
                      <Form>
                        <div className="d-flex flex-column">
                          {optionsArray.map((option, index) => (
                            <div key={index} className="d-flex align-items-center mb-2">
                              <Form.Check
                                type="radio"
                                name={`mcq-${item.id}`}
                                id={`option-${item.id}-${index}`}
                                onChange={() => handleOptionChange(item.id, option)}
                                checked={selectedOptions[item.id] === option}
                              />
                              <label htmlFor={`option-${item.id}-${index}`} className="ms-2">{option}</label>
                            </div>
                          ))}
                        </div>
                      </Form>
                    </div>
                  );
                })
              )}
              <Button
                className="mt-3 w-100 custom-btn"
                onClick={handleSubmit}
                disabled={Object.keys(selectedOptions).length === 0}
              >
                Submit
              </Button>
            </>
          )}
        </Card>
      </Container>
    </>
  );
};

export default Quiz;
