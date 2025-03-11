import React from 'react';
import Header from './Header';
import Form from 'react-bootstrap/Form';
// import { Link } from 'react-router';
import Container from "react-bootstrap/Container";
import Button from 'react-bootstrap/Button';
import { useState } from 'react';
import axios from 'axios';
import "./Form.css";

const Question_form = () => {
const [question,setquestion]=useState("");
const [course,setcourse]=useState("");
const [answer,setanswer]=useState("");
const [correct,setcorrect]=useState("");

function handleClick(){
    const data={
        question:question,
         course:course,
        answer:answer,
        correct:correct
    }
    console.log(data)

  axios.post("",data)
  .then(res=>{

  }).catch(err=>{
    console.log(err);
  })
}


  return (
    <>
      <Header/>
      <div className="form-wrapper mt-5">
        <div className="form-container">
          <h2 className="form-title">Question Form</h2>
          <Form>
            <Container>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput3">
                <Form.Label>Question</Form.Label>
                <Form.Control type="text" name="question" onChange={(e)=>setquestion(e.target.value)} placeholder="Enter Question" />
              </Form.Group>

              <Form.Group className="mb-3" controlId="exampleForm.ControlSelect1">
                <Form.Label>Select Course Category</Form.Label>
                <Form.Select name="course" >
                    <option value="" onChange={(e)=>setcourse(e.target.value)} >Select Category</option>
                    {/* <option value="web-development">Web Development</option>
                    <option value="data-science">Data Science</option>
                    <option value="design">Design</option>
                    <option value="marketing">Marketing</option> */}
                 </Form.Select>
              </Form.Group>


              <Form.Group className="mb-3" controlId="exampleForm.ControlInput3">
                <Form.Label>Answer</Form.Label>
                <Form.Control type="text" name="answer"  onChange={(e)=>setanswer(e.target.value)} placeholder="Enter Answers" />
              </Form.Group>

              <Form.Group className="mb-3" controlId="exampleForm.ControlInput3">
                <Form.Label>Correct Answer</Form.Label>
                <Form.Control type="text" name="correct" onChange={(e)=>setcorrect(e.target.value)} placeholder="Enter Correct Answers" />
              </Form.Group>

              <Button className='custom-btn' onClick={()=>handleClick()}>Add Question</Button>
            </Container>
          </Form>
        </div>
      </div>
    </>
  );
};

export default Question_form;
