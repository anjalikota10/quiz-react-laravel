<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Registration;
use App\Models\Quiz;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;


class IndexController
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $user = Registration::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['message' => 'Email not registered. Please register first.'], 401);
        } 

    
        if ($request->password !== $user->password) {
            return response()->json(['message' => 'Invalid password. Please try again.'], 401);
        }

    
        $imageUrl = null;
        if ($user->image) {
            $imageUrl = url('Images/' . $user->image); 
        }

        return response()->json([
            'message' => 'Login successful!',
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'address' => $user->address,
                'contact' => $user->contact,
                'image' => $imageUrl
            ]
        ], 200);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'Course_id' => 'required|integer', // Ensure Course ID is valid
            'req_id' => 'required|integer', // Assuming this is the user ID
            'answers' => 'required|array', // Ensure answers array is sent
            'answers.*.Question_id' => 'required|integer', // Validate each question ID
            'answers.*.Selected_ans' => 'required|string', // Validate selected answer
        ]);

        foreach ($data['answers'] as $answer) {
            Quiz::create([
                'Course_id' => $data['Course_id'],
                'req_id' => $data['req_id'], // Store user ID
                'Question_id' => $answer['Question_id'],
                'Selected_ans' => $answer['Selected_ans'],
            ]);
        }

        return response()->json(['message' => 'Quiz submitted successfully'], 200);
    }

    public function getUser($id)
    {
        $user = Registration::find($id);
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
        return response()->json($user);
    }

    public function update(Request $request)
    {
        
        $id = $request->get('id');
        $name = $request->get('name');
        $email = $request->get('email');
        $password =$request->get('password'); 
        $address = $request->get('address');
        $contact = $request->get('contact');
    
        
        $Reg = Registration::find($id);
        if (!$Reg) {
            return response()->json(['error' => 'User not found!'], 404);
        }
    
        $imgtemp = null;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imgtemp = time() . '_' . $image->getClientOriginalName(); 
            $image->move(public_path('images'), $imgtemp); 
        }
    
        $Reg->name = $name;
        $Reg->email = $email;
        $Reg->password = $password;
        $Reg->address = $address;
        $Reg->contact = $contact;
        $Reg->image = $imgtemp;
    
        $Reg->update();
    
        return response()->json(['message' => 'Data updated successfully!'], 200);
    }

    public function getQuizPerformance($id)
    {
        Log::info("Fetching quiz performance for req_id: " . $id);
    
        // First, gather the question count for each course
        $questionCount = DB::table('questions')
            ->select('Course_id', DB::raw('COUNT(*) AS total_questions'))
            ->groupBy('Course_id')
            ->get()
            ->keyBy('Course_id');
    
        // Now, gather the quiz count for each course
        $quizCount = DB::table('quizzes')
            ->select('Course_id', DB::raw('COUNT(*) AS quiz_count'))
            ->where('req_id', $id)
            ->groupBy('Course_id')
            ->get()
            ->keyBy('Course_id');
    
        // Gather the correct answers count for each course
        $correctAnswers = DB::table('quizzes')
            ->join('questions', function ($join) {
                $join->on('quizzes.Selected_ans', '=', 'questions.Correct_Answer')
                     ->on('quizzes.Course_id', '=', 'questions.Course_id');
            })
            ->select('quizzes.Course_id', DB::raw('COUNT(*) AS correct_answers_count'))
            ->where('quizzes.req_id', $id)
            ->groupBy('quizzes.Course_id')
            ->get()
            ->keyBy('Course_id');
    
        // Now, we combine the data into a single result
        $quizData = DB::table('courses')
            ->leftJoin('quizzes', 'courses.id', '=', 'quizzes.Course_id')
            ->leftJoin('questions', 'courses.id', '=', 'questions.Course_id')
            ->where('quizzes.req_id', $id)
            ->select('courses.id AS course_id', 
                     'courses.name AS course_name', 
                     'courses.image AS course_image', 
                     'courses.description', 
                     DB::raw('COUNT(DISTINCT questions.id) AS question_count'),
                     DB::raw('COUNT(DISTINCT quizzes.id) AS quiz_count'),
                     DB::raw('COUNT(DISTINCT CASE WHEN quizzes.Selected_ans = questions.Correct_Answer THEN quizzes.id END) AS correct_answers_count'),
                     DB::raw('COUNT(DISTINCT CASE WHEN quizzes.Selected_ans != questions.Correct_Answer THEN quizzes.id END) AS incorrect_answers_count')
            )
            ->groupBy('courses.id', 'courses.name', 'courses.image', 'courses.description')
            ->get()
            ->map(function ($course) use ($questionCount, $quizCount, $correctAnswers) {
                $course->question_count = $questionCount[$course->course_id]->total_questions ?? 0;
                $course->quiz_count = $quizCount[$course->course_id]->quiz_count ?? 0;
                $course->correct_answers_count = $correctAnswers[$course->course_id]->correct_answers_count ?? 0;
    
                // Calculate the difference and incorrect answers
                $course->difference = $course->question_count - $course->quiz_count;
                $course->incorrect_answers_count = $course->question_count - ($course->correct_answers_count +  $course->difference);
    
                return $course;
            });
    
        Log::info("Quiz Performance Data: ", $quizData->toArray());
    
        if ($quizData->isEmpty()) {
            return response()->json(['message' => 'No quiz performance data found'], 404);
        }
    
        return response()->json($quizData);
    }

    public function destroy($course_id)
    {
        Quiz::where('Course_id', $course_id)->delete();
    return response()->json(['message' => 'Quiz data deleted successfully']);
    }
    
    public function getQuizStatus($id, $course_id)
    {
    Log::info("Fetching quiz status for user: $id, course: $course_id");

    // Query for Correct Answers
    $correctAnswers = DB::table('quizzes')
        ->join('questions', 'quizzes.Question_id', '=', 'questions.id')
        ->select('quizzes.Question_id', 'quizzes.Selected_ans', 'questions.Correct_Answer', 'questions.Questions', 'questions.Course_id', DB::raw("'Correct' AS Status"))
        ->where('quizzes.Selected_ans', '=', DB::raw('questions.Correct_Answer'))
        ->where('quizzes.req_id', $id)
        ->where('questions.Course_id', $course_id)
        ->get();

    // Query for Incorrect Answers
    $incorrectAnswers = DB::table('quizzes')
        ->join('questions', 'quizzes.Question_id', '=', 'questions.id')
        ->select('quizzes.Question_id', 'quizzes.Selected_ans', 'questions.Correct_Answer', 'questions.Questions', 'questions.Course_id', DB::raw("'Incorrect' AS Status"))
        ->where('quizzes.Selected_ans', '!=', DB::raw('questions.Correct_Answer'))
        ->where('quizzes.req_id', $id)
        ->where('questions.Course_id', $course_id)
        ->get();

    // Query for Not Attempted Questions
    $notAttempted = DB::table('questions')
        ->leftJoin('quizzes', 'questions.id', '=', 'quizzes.Question_id')
        ->select('questions.id AS Question_id', DB::raw('NULL AS Selected_ans'), 'questions.Correct_Answer', 'questions.Questions', 'questions.Course_id', DB::raw("'Not Attempted' AS Status"))
        ->whereNull('quizzes.Selected_ans')
        ->where('questions.Course_id', $course_id)
        ->whereIn('questions.Course_id', function($query) use ($id) {
            $query->select('Course_id')
                ->from('quizzes')
                ->where('quizzes.req_id', $id);
        })
        ->get();

    // Merge all the results into a single collection
    $quizStatus = $correctAnswers->merge($incorrectAnswers)->merge($notAttempted);

    Log::info("Quiz Status Data: ", $quizStatus->toArray());

    if ($quizStatus->isEmpty()) {
        return response()->json(['message' => 'No quiz status data found'], 404);
    }

    // Return the quiz status data as a response
    return response()->json($quizStatus);
    }

    public function checkQuizAttempt(Request $request)
{
    $user_id = $request->query('user_id');
    $course_id = $request->query('course_id');

    $attempt = DB::table('quizzes')
        ->where('req_id', $user_id)
        ->where('Course_id', $course_id)
        ->exists();

    return response()->json(['attempted' => $attempt]);
}

}
