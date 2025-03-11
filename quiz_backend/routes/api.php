<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RegController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\IndexController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::apiResource('Reg', RegController::class);
Route::apiResource('Course', CourseController::class);
Route::apiResource('Question', QuestionController::class);
Route::post('login', [IndexController::class, 'login']);
Route::post('submit-quiz', [IndexController::class, 'store']);
Route::get('/user/{id}', [IndexController::class, 'getUser']);
Route::get('/user/{id}/quiz-performance', [IndexController::class, 'getQuizPerformance']);
Route::delete('/delete/{course_id}', [IndexController::class, 'destroy']);
Route::get('/user/{id}/quiz-status/{course_id}', [IndexController::class, 'getQuizStatus']);
Route::get('/check-quiz-attempt', [IndexController::class, 'checkQuizAttempt']);
Route::post('update', [IndexController::class, 'update']);