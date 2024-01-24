<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
class postController extends Controller
{
    //
  public function index(){


   $post=Post::all();
   return response()->json([
    "posts"=> $post
   ]);

  }

  public function show($id){
    $post=Post::where('id',$id)->withCount('comments','likes')->get();

    return response()->json([
        "post"=>$post
    ]);
  }

  public function store(Request $request){

   $request->validate([
    "title"=>"required",
    "description"=>"required|string"
   ]);

   $post=Post::create([
    'title'=> $request->title,
    'description'=> $request->description,
    'user_id'=>auth()->user()->id

   ]);
   $post->save();

   return response()->json([
    'message' => 'post created',
    'post description'=>$post,
    'created with'=> User::find(1)->name,
    'email'=> User::find(1)->email,
   ]);

  }

  public function update($id , Request $request){

    $post=Post::find($id);
    $request->validate([
        'title'=>'string',
        'description'=>'required|string',
    ]);
    $post->update([
        'title'=>$request->title,
        'descriptiono'=>$request->description
    ]);

    return response()->json([
     'status'=>'post updated',
     'updated post'=>$post
    ]);
  }

  public function destroy($id){
    $user_id=auth()->user()->id;
    $post=Post::where('id',$id)->where('user_id',$user_id);

    // $post->comments->delete();
    // $post->likes->delete();
    $post->delete();
    return response()->json([
        'status'=>'post deleted'
      ]);
  }




}
