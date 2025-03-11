import { BrowserRouter, Routes, Route } from 'react-router-dom';
import './App.css';
import Home from './Components/Home';
import Registration from './Components/Registration';
import Quiz  from './Components/Quiz';
import Login from './Components/Login';
import Profile from './Components/Profile';
import QuizStatus from './Components/QuizStatus';
import UserInfo from './Components/User_info';
import Forgot from './Components/Forgot';
//admin import
import Admin_home from './admin/Admin_home';
import Course_form from './admin/Course_form';
import Course_table from './admin/Course_table';
import Question_form from './admin/Question_form';
import Question_table from './admin/Question_table';
import Quiz_details from './admin/Quiz_details';
import Quiz_form from './admin/Quiz_form';
import Status from './admin/Status';

import Registration_details  from'./admin/Registration_details';





function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/profile/:id" element={<Profile />} />
          <Route path="/user/:id/quiz-status/:course_id" element={<QuizStatus />} />
          <Route path="/registration" element={<Registration/>} />
          <Route path="/login" element={<Login/>} />
          <Route path="/Quiz/:id" element={<Quiz />} /> {/* Dynamic Route */}
          <Route path="/Profile" element={<Profile/>} />
          <Route path="/UserInfo/:id" element={<UserInfo />} />
          <Route path="/forget" element={<Forgot/>} />


          <Route path="/admin" element={<Admin_home/>} />
          <Route path="/course_form" element={<Course_form/>}/>
          <Route path="/course_table" element={<Course_table/>}/>
          <Route path="/question_form" element={<Question_form/>}/>
          <Route path="/question_table" element={<Question_table/>}/>
          <Route path="/registration_details" element={<Registration_details/>}/>
          <Route path="/quiz_details" element={<Quiz_details/>}/>
          <Route path="/quiz_form" element={<Quiz_form/>}/>
          <Route path="/Status/:id" element={<Status/>}/>

        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
