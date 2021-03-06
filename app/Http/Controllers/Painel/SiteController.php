<?php

namespace App\Http\Controllers\Painel;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Post;
use App\User;
use Gate;
use App\Http\Controllers\Controller;

class SiteController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Post $post)
    {
        //$posts = $post->all();
        //$posts = $post->where('user_id',auth()->user()->id)->get();
        //return view('home',compact('posts'));

        return view('portal.home.index');
    }
    public function update($id){

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
    }
}
