<?php

Route::group(['prefix'=>'painel'], function(){

	Route::get('/', 'Painel\PainelController@index');

	Route::get('/posts', 'Painel\PostController@index');

});

Auth::routes();

Route::get('/', 'Painel\SiteController@index');
/*


Route::get('/home', 'HomeController@index')->name('home');


Route::get('/home/{id}/update', 'HomeController@update');

Route::get('/roles-permissions', 'HomeController@rolesPermissions');
*/