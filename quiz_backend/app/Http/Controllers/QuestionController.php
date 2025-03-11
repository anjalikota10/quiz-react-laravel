<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Questions;

class QuestionController
{
    
    public function index()
    {
        return Questions::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
       
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $Questions = $request->get('Questions');
        $Course_id = $request->get('Course_id');
        $Answer = $request->get('Answer'); 
        $Correct_answer = $request->get('Correct_answer');


        $Answer = json_encode($Answer);

        $Que = new Questions([
            'Questions' => $Questions,
            'Course_id' => $Course_id,
            'Answer' => $Answer,
            'Correct_answer' => $Correct_answer,
        ]);

        $Que->save();
    
    }
    /**
     * Display the specified resource.
     */
    public function show(Request $request,string $id)
    {
        $questions = Questions::where('Course_id', $id)->get();

    if ($questions->isEmpty()) {
        return response()->json(['message' => 'No questions found for this Course ID'], 404);
    }

    return response()->json($questions);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
       
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
   
    $question = Questions::find($id);

    if (!$question) {
        return response()->json(['message' => 'Question not found'], 404);
    }

    
    $request->validate([
        'Questions' => 'required|string',
        'Course_id' => 'required|integer',
        'Answer' => 'required|array',
        'index' => 'required|integer|min:0',
        'new_answer' => 'required|string',
        'Correct_answer' => 'required|string'
    ]);

   
    $existingAnswers = json_decode($question->Answer, true) ?? [];

    
    $index = $request->get('index');

    
    if (!isset($existingAnswers[$index])) {
        return response()->json(['message' => 'Invalid index'], 400);
    }

    
    $existingAnswers[$index] = $request->get('new_answer');

   
    $question->Questions = $request->get('Questions');
    $question->Course_id = $request->get('Course_id');
    $question->Answer = json_encode($existingAnswers);
    $question->Correct_answer = $request->get('Correct_answer');

    $question->save();

    return response()->json([
        'message' => 'Question updated successfully',
        'updated_answers' => $existingAnswers
    ]);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        
    }
}
