<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class CheckApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */

    public function handle($request, Closure $next)
{
    if(!empty(trim($request->input('api_token')))){

        $is_exists = User::where('id' , Auth::guard('api')->id())->exists();
        if($is_exists){
            return $next($request);
        }
    }
        return response()->json('Invalid Token', 401);
}
}
