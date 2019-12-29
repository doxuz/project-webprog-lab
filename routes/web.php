<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'FlowersController@index')->name('home');

Route::get('/search',"FlowersController@search");

Route::get('/order/{id}','CartsController@add');

Route::get('/detail/{id}','FlowersController@show');

Route::get('/update/{id}','CartsController@update');

Route::get('/cart',"CartsController@index");

Route::delete('/delete/{id}',"CartsController@destroy");