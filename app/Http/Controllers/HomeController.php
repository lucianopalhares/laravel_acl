<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Post;
use App\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Post $post)
    {
        //$posts = $post->all();
        $posts = $post->where('user_id',auth()->user()->id)->get();
        return view('home',compact('posts'));
    }
    public function update($id){
        
        $post = Post::find($id);

        $this->authorize('update_post',$post);

        return $post->title;
    }
}
