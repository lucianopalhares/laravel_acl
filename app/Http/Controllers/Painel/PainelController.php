<?php

namespace App\Http\Controllers\Painel;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Permission;
use App\Post;
use App\Role;
use App\User;

class PainelController extends Controller
{
    public function index(){

    	$totalPermissions = Permission::count();
    	$totalPosts = Post::count();
    	$totalRoles = Role::count();
    	$totalUsers = User::count();
    	
    	return view('painel.home.index',compact('totalPermissions','totalPosts','totalRoles','totalUsers'));
    }
}
