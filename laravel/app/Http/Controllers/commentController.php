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
        $comments =  Comment::where('post_id',$id)->get();
        return response()->json([
            'post'=>$post,
            'comments'=>$comments
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

    public function update($id , Request $request){
        $comment=Comment::find($id);
        $authuUser_id=\Auth()->user()->id;
        $commentUserID=$comment->user_id;
        if($commentUserID==$authuUser_id){
            $comment->comment=$request->comment;
        return response()->json([
            'status'=> true,
            'message'=>'comment updated successfull',
            'updated comment'=>$comment
        ]);
        }else{
            return response()->json([
                'status'=> false,
                'message'=>'this comment can only be updated by  it creator'
            ]);
        }
    }

    public function destroy($id){
       $comment=Comment::where('id',$id);
       $comment->delete();

       return response()->json([
       'comment deleted'
       ]);
    }
}
