<?php

namespace App\Http\Controllers;

use App\Models\Like;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;

class likeController extends Controller
{

    public function index($id){
        $likes=Like::all()->where('post_id',$id);
        $count=$likes->count();
        $post=Post::find($id);

      return response()->json([
       'post'=>$post,
       'all likes'=>$count,
       'likes'=>$likes
      ]);
    }
    public function like($id){

        $post=Post::where('id',$id);
        $allLikes=Like::where('post_id',$id)->where('user_id',\Auth::user()->id)->get();

                $count=$allLikes->count();
                if($count==0){
                $like=Like::Create([
                    'user_id'=>\Auth::user()->id,
                    'post_id'=>$id,
                    'is_liked'=>1
                    ]);
                return response()->json([
                    'like'=>'post liked',
                    'by'=>\Auth::user()->name
               ]);
            }else{
                return response()->json([
                    'count'=>$count,
                'status'=>false,
                'message '=> 'you liked already'
                ]);
            }
            }
    public function dislike($id){

        $like=Like::where('user_id',\Auth::user()->id)->where('post_id',$id);
        $like->delete();

        return response()->json([
            'status'=>'post disliked',
        ]);
    }



}
