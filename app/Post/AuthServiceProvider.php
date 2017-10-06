<?php

namespace App\Providers;

use Illuminate\Contracts\Auth\Access\Gate as GateContract;
<<<<<<< HEAD:app/Post/AuthServiceProvider.php
=======
use Illuminate\Support\Facades\Gate;
>>>>>>> test:app/Providers/AuthServiceProvider.php
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use App\Post;
use App\User;
use App\Permission;
use App\Policies\PostPolicy;///pegando a policy

use App\Post;
use App\User;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        Post::class => PostPolicy::class,
        //'App\Model => App\Policies\ModelPolicy,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot(GateContract $gate)
    {
        $this->registerPolicies();

<<<<<<< HEAD:app/Post/AuthServiceProvider.php
        $gate->define('update_post',function(User $user,Post $post){
            return $user->id == $post->user_id;
        });
=======
        /*$gate->define('updatePost', function(User $user,Post $post){
            return $post->user_id == $user->id;
        });*/
        $permissions = Permission::with('roles')->get();

        foreach ($permissions as $permission) {
            $gate->define($permission->name, function(User $user) use ($permission){
                return $user->hasPermission($permission);
            });
        }
>>>>>>> test:app/Providers/AuthServiceProvider.php
    }
}
