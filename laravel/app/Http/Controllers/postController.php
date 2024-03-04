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


   $post=Post::orderBy("created_at","desc")->get();
   return response()->json([
    "posts"=> $post
   ]);

  }

  public function show($id){

    $comments=Comment::where('post_id',$id)->get()->all();
    $post=Post::where('id',$id)->withCount('comments','likes')->get();

    return response()->json([
        "post"=>$post,
        "comments"=>$comments
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
    // $post->comments->delete();
    // $post->likes->delete();
    $comments=Comment::where('post_id',$id)->get()->all();
    $likes=Comment::where('post_id',$id)->get()->all();




    if($post->user_id!= $user_id){
        return response()->json([
            'message'=> 'not allowed to delete others post'
        ]);
    }

    foreach($comments as $comments){
        $comments->delete();
        }
    $post->delete();
    return response()->json([
        'status'=>true,
        'comment'=>'all comments deleted',
        'Post'=>'post deleted'
      ]);
  }




}
