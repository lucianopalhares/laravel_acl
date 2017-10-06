<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Gate;

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
        ///$posts = $post->all();    get all data without filters
        $posts = $post->where('user_id', auth()->user()->id)->get();

        return view('home',compact('posts'));
    }
    public function update($id){

        $post = Post::find($id);//encontra o post com este id

        //$this->authorize('update_post',$post);///passando ele aqui verifica se esta autorizado pegar as informacoes
        if( Gate::denies('update_post',$post))
            abort(403,'Nao autorizado');
        return $id;
    }
}
