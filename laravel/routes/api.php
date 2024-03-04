<?php

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\commentController;
use App\Http\Controllers\likeController;
use App\Http\Controllers\postController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('register',[ApiController::class,"register"]);
Route::post('login',[ApiController::class,"login"]);

Route::group([
    "middleware"=>["auth:sanctum"]
],function(){

Route::get('profile',[ApiController::class,"profile"]);
Route::get('logout',[ApiController::class,"logout"]);


Route::get('/posts',[postController::class,'index']);
Route::post('/createpost',[postController::class,'store']);
Route::get('posts/{id}',[postController::class,'show']);
Route::put('posts/{id}/update',[postController::class,'update']);
Route::delete('posts/{id}',[postController::class,'destroy']);


Route::get('posts/{id}/comments',[commentController::class,'index']);
Route::post('posts/{id}/comments',[commentController::class,'store']);
Route::put('comments/{id}',[commentController::class,'update']);
Route::delete('/comments/{id}',[commentController::class,'destroy']);

// Route::post('/posts/{id}/like',[likeController::class,'create']);
Route::get('/posts/{id}/likes/',[likeController::class,'index']);
Route::post('/posts/{id}/like/',[likeController::class,'like']);
Route::delete('/posts/{id}/dislike/',[likeController::class,'dislike']);



});
