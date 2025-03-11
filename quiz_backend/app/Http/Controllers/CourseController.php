<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Course;
use Illuminate\Support\Facades\Validator;

class CourseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Course::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
           
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'description' => 'nullable|string',
            
        ]);
    
       
        $name = $request->get('name');
        
        $description = $request->get('description');
       

       
    
       
        $imgtemp = null;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imgtemp = time() . '_' . $image->getClientOriginalName(); 
            $image->move(public_path('images'), $imgtemp); 
        }
    
       
        $Course = new Course([
            'name' => $name,
            'image' => $imgtemp,
            'description' => $description,
            
        ]);
        $Course->save();
    
        return response()->json(['message' => 'data added successful!'], 201);
    
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
