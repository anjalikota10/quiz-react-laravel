import React from 'react'
import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import Image from 'react-bootstrap/Image';
import Col from 'react-bootstrap/Col';
import { Link } from 'react-router-dom';  // Import Link for navigation
import "./style.css";
import { useEffect, useState } from 'react';


const Header = () => {
  const [user, setUser] = useState(null);
  useEffect(() => {
    const storedUser = localStorage.getItem("user");
    if (storedUser) {
      setUser(JSON.parse(storedUser));
    }
  }, []);

  // Logout function
  const handleLogout = () => {
    localStorage.removeItem("user"); // Remove user from storage
    setUser(null);
    window.location.href = "/login"; // Redirect to login page
  };
  return (
    <Navbar expand="lg" className="header">
    <Container>
      <Navbar.Brand href="/" className='heading'>QUIZ</Navbar.Brand>
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
      <Navbar.Collapse id="basic-navbar-nav">
      <Nav className="ms-auto">
            {/* Show Register & Login if no user is logged in */}
            {!user ? (
              <>
                <Button as={Link} to="/registration" className="me-3 custom-btn">Register</Button>
                <Button as={Link} to="/login" className="custom-btn">Login</Button>
              </>
            ) : (
              /* Show Profile & Logout if user is logged in */
              <NavDropdown title={user.name} id="basic-nav-dropdown">
              <NavDropdown.Item as={Link} to={`/profile/${user.id}`}>
                <Col xs={2} md={2}>
                  <Image 
                    src={user.image ? user.image : "https://via.placeholder.com/40"} 
                    roundedCircle 
                    width="40"
                    height="40"
                  /> {user.name}
                </Col>
              </NavDropdown.Item>
              <NavDropdown.Item onClick={handleLogout}>Logout</NavDropdown.Item>
            </NavDropdown>
            )}
          </Nav>
    </Navbar.Collapse>
    </Container>
  </Navbar>
  )
}

export default Header