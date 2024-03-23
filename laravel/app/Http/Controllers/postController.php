<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
class postController extends Controller
{
    //
  public function index(){


   $post=Post::with('comments','likes')->orderBy("created_at","desc")->get();
   return response()->json([
    "data"=> $post
   ]);

  }

  public function show($id){

    $post=Post::where('id',$id)->withCount('comments','likes')->with('comments','likes')->get();

    return response()->json([
        "post"=>$post,
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
    if($post->user_id == \Auth::user()->id){
    $post->update([
        'title'=>$request->title,
        'description'=>$request->description
    ]);} else{
        return response()->json([
          'message'=>'not allowed to update others post'
        ]);
    }

    return response()->json([
     'status'=>'post updated',
     'updated post'=>$post
    ]);
  }

  public function destroy($id){

    $user_id=\Auth()->user()->id;

    $post=Post::find($id);




    if($post->user_id!= $user_id){
        return response()->json([
            'message'=> 'not allowed to delete others post'
        ]);
    }

    $post->comments()->delete();
    $post->comments()->likes();

    $post->delete();


    $post->delete();
    return response()->json([
        'status'=>true,
        'comment'=>'all comments deleted',
        'Post'=>'post deleted'
      ]);
  }
}
