import React from "react";
import { Navbar, Nav, Dropdown, Image } from "react-bootstrap";
import { Link } from "react-router";
import "./Header.css";

const Header = () => {
  return (
    <div>
      <div className="custom-sidebar">
        <Nav.Link as={Link} to="/" className="custom-sidebar-link">
          Home
        </Nav.Link>
        <Nav.Link as={Link} to="/registration_details" className="custom-sidebar-link">
          Registration Details
        </Nav.Link>
        <Nav.Link as={Link} to="/course_table" className="custom-sidebar-link">
          Course Details
        </Nav.Link>
        <Nav.Link as={Link} to="/question_table" className="custom-sidebar-link">
          Question Details
        </Nav.Link>
       
      </div>

      <div style={{ marginLeft: "250px" }}>
        <Navbar bg="white" expand="lg" className="shadow-sm custom-header">
          <div className="container-fluid">
            <Navbar.Brand href="#" className="ms-3">
              <span className="custom-navbar-brand-text">Quiz</span>
            </Navbar.Brand>
            <Navbar.Collapse id="navbarNav" className="justify-content-end">
              <Nav className="custom-navbar-nav">
                <Dropdown align="end">
                  <Dropdown.Toggle
                    as={Nav.Link}
                    id="dropdown-profile"
                    className="custom-dropdown-profile-link"
                  >
                    Profile
                  </Dropdown.Toggle>
                  <Dropdown.Menu className="custom-dropdown-menu">
                    <Dropdown.Item href="#">
                      <Image
                        src="https://via.placeholder.com/30"
                        roundedCircle
                        className="me-2"
                      />
                      Name
                    </Dropdown.Item>
                    <Dropdown.Divider />
                    <Dropdown.Item href="#">Logout</Dropdown.Item>
                  </Dropdown.Menu>
                </Dropdown>
              </Nav>
            </Navbar.Collapse>
          </div>
        </Navbar>
      </div>
    </div>
  );
};

export default Header;
