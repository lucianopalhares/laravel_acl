<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Post;
<<<<<<< HEAD
=======
use App\User;
>>>>>>> test
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
<<<<<<< HEAD
        ///$posts = $post->all();    get all data without filters
        $posts = $post->where('user_id', auth()->user()->id)->get();

=======
        $posts = $post->all();
        //$posts = $post->where('user_id',auth()->user()->id)->get();
>>>>>>> test
        return view('home',compact('posts'));
    }
    public function update($id){

<<<<<<< HEAD
        $post = Post::find($id);//encontra o post com este id

        //$this->authorize('update_post',$post);///passando ele aqui verifica se esta autorizado pegar as informacoes
        if( Gate::denies('update_post',$post))
            abort(403,'Nao autorizado');
        return $id;
=======
        $post = Post::find($id);

        $this->authorize('updatePost',$post);

        if(Gate::denies('updatePost',$post))
            abort(403,'Nao autorizado');

        return $post->title;
    }
    public function rolesPermissions(){
        $name = auth()->user()->name;

        foreach (auth()->user()->roles as $role) {
            echo $role->name;
            echo '<---------->';
            echo '<br>';

            foreach ($role->permissions as $permission) {
                echo '<br>';
                echo $permission->name;

            }
        }
>>>>>>> test
    }
}
