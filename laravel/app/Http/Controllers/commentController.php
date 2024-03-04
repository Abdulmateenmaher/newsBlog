<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use Illuminate\Http\Request;

class commentController extends Controller
{
    //
    public function index($id){
        $post=Post::find($id);



        return response()->json([
            'post'=>$post->comments()->with('user:id,name,image'),
        ]);

    }

    public function store($id, Request $request){
        $request->validate([
            'comment'=>'required|string'
        ]);
        $comment=Comment::create([
          'comment'=>$request->comment,
          'user_id'=>\Auth::user()->id,
          'post_id'=>$id

        ]);

        return response()->json([
            'status'=>'comment created',
            'comment'=>$comment
        ]);
    }

    public function destroy($id){
       $comment=Comment::where('id',$id);
       $comment->delete();

       return response()->json([
       'comment deleted'
       ]);
    }
}
