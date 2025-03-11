<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Registration;
use Illuminate\Support\Facades\Validator;

class RegController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Registration::all();
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
            'email' => 'required|string|email|max:100',
            'password' => 'required|min:6',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'address' => 'nullable|string',
            'contact' => 'required|digits:10',
        ]);
    
       
        $name = $request->get('name');
        $email = $request->get('email');
        $password =$request->get('password'); 
        $address = $request->get('address');
        $contact = $request->get('contact');

        if (Registration::where('email', $request->email)->exists()) {
            return response()->json(['message' => 'You have already registered. Please go to login.'], 400);
        }
    
       
        $imgtemp = null;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imgtemp = time() . '_' . $image->getClientOriginalName(); 
            $image->move(public_path('images'), $imgtemp); 
        }
    
       
        $Reg = new Registration([
            'name' => $name,
            'email' => $email,
            'password' => $password,
            'image' => $imgtemp,
            'address' => $address,
            'contact' => $contact,
        ]);
        $Reg->save();
    
        return response()->json(['message' => 'Registration successful!'], 201);
    }
    

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = Registration::find($id);
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
        return response()->json($user);
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
    public function update(Request $request, $id)
    {
        $Reg = Registration::find($id);
    
        if (!$Reg) {
            return response()->json(['error' => 'User not found!'], 404);
        }
    
       
        $name = $request->get('name');
        $email = $request->get('email');
        $password = $request->get('password');
        $address = $request->get('address');
        $contact = $request->get('contact');
        $image = $request->file('image');
    
        
    
        // Image handling
        $imgtemp = null;
        if ($image) {
            $imgtemp = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('images'), $imgtemp);
        }
    
        // Update the user
        $Reg->name = $name;
        $Reg->email = $email;
        $Reg->password = $password;
        $Reg->address = $address;
        $Reg->contact = $contact;
        $Reg->image = $imgtemp;
    
        // Save updated user data
        $Reg->Update();
    
        return response()->json([
            'message' => 'Data updated successfully!',
            'user' => $Reg
        ], 200);
    }
    
    
    
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $reg = Registration::findOrFail($id);

        if ($reg->image) {
            unlink(public_path('images/' . $reg->image));
        }

        $reg->delete();

        return response()->json(['message' => 'Registration deleted successfully']);
    }
}