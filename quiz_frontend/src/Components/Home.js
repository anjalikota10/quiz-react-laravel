import React from 'react'
import Carousel from 'react-bootstrap/Carousel';
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';
import Header from './Header';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import { Link } from 'react-router-dom'; 
import { useState,useEffect } from 'react';
import  {API_URL} from "./config";
import axios from 'axios';

const Home = () => {
  
  const [user, setUser] = useState(null);
    useEffect(() => {
      const storedUser = localStorage.getItem("user");
      if (storedUser) {
        setUser(JSON.parse(storedUser));
      }
    }, []);
  const [fetchdata, setFetch] = useState([]);
  

  
  
    const getdata = () => {
        axios.get('${API_URL}/api/Course')
            .then(res => {
                setFetch(res.data);
            })
            .catch(err => {
                console.log(err);
            });
    };
  
    useEffect(() => {
        getdata();
    }, []);
    

  return (
    <>
    <Header/>
      <Carousel data-bs-theme="dark">
      <Carousel.Item>
        <img
          className="d-block w-100"
          src="/images/c1.webp"
          alt="First slide" 
          height="600px" width="50%"
        />
       
      </Carousel.Item>
      <Carousel.Item>
        <img
          className="d-block w-100"
          src="/images/c+.jpeg"
          alt="First slide" 
          height="600px" width="50%"
        />
       
      </Carousel.Item>
      <Carousel.Item>
        <img
          className="d-block w-100"
          src="/images/java.jpg"
          alt="Second slide"
           height="600px" width="50%"
        />
        {/* <Carousel.Caption>
          <h5>Second slide label</h5>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </Carousel.Caption> */}
      </Carousel.Item>
      <Carousel.Item>
        <img
          className="d-block w-100"
          src="/images/react'.png"
          alt="Third slide"
           height="600px" width="50%"
        />
      
      </Carousel.Item>
      <Carousel.Item>
        <img
          className="d-block w-100"
          src="/images/PHP.webp"
          alt="fourth slide"
           height="600px" width="50%"
        />
      
      </Carousel.Item>
      <Carousel.Item>
        <img
          className="d-block w-100"
          src="/images/python.webp"
          alt="fiveth slide"
           height="600px" width="50%"
        />
      
      </Carousel.Item>
    </Carousel>



    <Container className="mt-4">
  <Row className="g-4">
    {fetchdata.map((item, i) => (
      <Col key={i} md={4} sm={6} xs={12}>
        <Card className="shadow-lg rounded-3 border-0" style={{ width: '100%' }}>
          <Card.Img 
            variant="top" 
            src={`${API_URL}/images/${item.image}`} 
            alt={item.name}
            style={{ height: '200px', objectFit: 'cover' }}
          />
          <Card.Body className="text-center">
            <Card.Title className="fw-bold">{item.name}</Card.Title>
            <Card.Text className="text-muted">{item.description}</Card.Text>
            {!user ? (
              <Button as={Link} to={`/login`} className='custom-btn'>
                Go For Quiz
              </Button>
            ) : (
              <Button as={Link} to={`/Quiz/${item.id}`}  className='custom-btn'>
                Go For Quiz
              </Button>
            )}
          </Card.Body>
        </Card>
      </Col>
    ))}
  </Row>
</Container>   
    </>
  )
}

export default Home;
