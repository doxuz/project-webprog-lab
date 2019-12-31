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



Route::get('/', 'FlowersController@index');

Auth::routes();


// Home and cart routes
Route::get('/home', 'FlowersController@index')->name('home');

Route::get('/search',"FlowersController@search");

Route::get('/order/{id}','CartsController@add');

Route::get('/detail/{id}','FlowersController@show');

Route::get('/update/{id}','CartsController@update');

Route::get('/cart',"CartsController@index");

Route::delete('/delete/{id}',"CartsController@destroy");

Route::get('/checkout/{id}',"CartsController@checkout");


// Manage flowers route
Route::get('/manageFlower', 'FlowersController@manageFlowerIndex');

Route::get('/searchManage',"FlowersController@searchManage");

Route::get('/insertFlower',"FlowersController@create");

Route::post('/createFlower',"FlowersController@store");

Route::delete('/deleteFlower/{id}',"FlowersController@destroy");

Route::get('/editFlower/{id}','FlowersController@edit');

Route::put('/updateFlower/{id}','FlowersController@update');


// Manage flower types route
Route::get('/manageFlowerTypes', 'FlowerTypesController@index');

Route::get('/searchType',"FlowerTypesController@search");

Route::delete('/deleteFlowerType/{id}',"FlowerTypesController@destroy");

Route::get('/insertFlowerType',"FlowerTypesController@create");

Route::post('/createFlowerType',"FlowerTypesController@store");

Route::get('/editFlowerType/{id}','FlowerTypesController@edit');

Route::put('/updateFlowerType/{id}','FlowerTypesController@update');


// Manage couriers route
Route::get('/manageCouriers', 'CouriersController@index');

Route::get('/searchCourier',"CouriersController@search");

Route::delete('/deleteCourier/{id}',"CouriersController@destroy");

Route::get('/insertCourier',"CouriersController@create");

Route::post('/createCourier',"CouriersController@store");

Route::get('/editCourier/{id}','CouriersController@edit');

Route::put('/updateCourier/{id}','CouriersController@update');


// Profile and manage users route
Route::get('/profile',"UsersController@show");

Route::put('/updateProfile/{id}','UsersController@update');

Route::get('/manageUsers', 'UsersController@index');

Route::delete('/deleteUser/{id}',"UsersController@destroy");

Route::get('/editUser/{id}','UsersController@edit');

Route::put('/updateUser/{id}','UsersController@adminUpdate');


// Transaction history route
Route::get('/history', 'CartHistoriesController@index');