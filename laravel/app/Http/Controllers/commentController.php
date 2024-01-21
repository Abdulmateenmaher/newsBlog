<?php

namespace App\Http\Controllers;

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
}
