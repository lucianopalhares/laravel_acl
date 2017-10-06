<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
	public function roles(){///(pega rodas as 'roles' dessa 'permission') vai ser pego na model User
    	return $this->belongsToMany(\App\Role::Class);
	}
}
