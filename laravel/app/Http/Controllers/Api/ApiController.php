<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class ApiController extends Controller
{

public function index(){
    $users=User::all();

    return response()->json([
        'status' => true,
        'all usres'=>'fetched',
        'data'=>$users
    ]);
}

public function register( Request $request){

    $request->validate([
        "name" => "required",
        "email" => "required|unique:users|email",
        "password" => "required|confirmed",
    ]);

    User::create([
        "name" => $request->name,
        "email"=> $request->email,
        "password"=> Hash::make($request->password)
    ]);

    return response()->json([
     "status" => true,
     "message" => "user Created Successfully"
    ]);

}

public function login(Request $request){
    $request->validate([
     "email" => "required",
     "password" => "required"
    ]);
    $user = User::where("email",$request->email)->first();

    if(!empty($user)){
        if(Hash::check($request->password, $user->password)){
          $token= $user->createToken("myToken")->plainTextToken;

          return response()->json([
            "status" => true,
            "message" => "login successful",
            "token" => $token
          ]);
        }

        return response()->json([
         "status" => false,
         "message" => "password doesnot match"
        ]);

    }

    return response()->json([
     "status" => false,
     "message" => "invalid login details"
    ]);

}

public function profile(){

    $data=auth()->User();

    return response()->json([
        "status" => true,
        "message" => "profile Data",
        "data" => $data
    ]);

}

public function logout(){

    auth()->user()->tokens()->delete();

    return response()->json([
        "status"=> true,
        "message" => "loged out successfully"
    ]);

}
}
