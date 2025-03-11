import React, { useState, useEffect } from 'react';
import Header from './Header';
import { Link } from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import axios from 'axios';
import  {API_URL} from "./config";

const RegistrationDetails = () => {
  const [registrations, setRegistrations] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const res = await axios.get("${API_URL}/api/Reg");
        setRegistrations(res.data);
      } catch (err) {
        console.error("Error fetching data:", err);
      }
    };
    fetchData();
  }, []);

  return (
    <>
      <Header />
      <div className="custom-main-content mt-5">
        <Container className="custom-course-container">
          <h3 className="custom-table-title ">Registration Details</h3>
          <div className="custom-table-wrapper">
            <Table striped bordered hover responsive className="custom-course-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Address</th>
                  <th>Contact</th>
                  <th>Image</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {registrations.length > 0 ? (
                  registrations.map((reg, index) => (
                    <tr key={index}>
                      <td>{reg.id}</td>
                      <td>{reg.name}</td>
                      <td>{reg.email}</td>
                      <td>{reg.address}</td>
                      <td>{reg.contact}</td>
                      <td><img src={`${API_URL}/images/${reg.image}`}  style={{ height: '50px',width: '100px', objectFit: 'cover' }}/></td>
                      <td>
                        <Link to={`/status/${reg.id}`}>
                          <Button className="custom-btn">Status</Button>
                        </Link>
                      </td>

                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="6" className="text-center">No records found</td>
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

export default RegistrationDetails;
