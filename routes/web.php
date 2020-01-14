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



Route::get('/', 'BlogController@publisedList')->middleware('blogMinify');

Auth::routes();

Route::middleware('auth')->group(function() {
    
    Route::put('/blogPublished/{id}', 'BlogController@blogPublished');
    Route::get('/home', 'HomeController@index')->name('home');
    Route::resource('blog', 'BlogController');
    Route::post('blog/create', 'BlogController@store');
    Route::resource('admin/category', 'CategoryController');
    Route::resource('admin/user-type', 'UserTypeController');
});
Route::redirect('/admin', '/home', 301);
// Route::get('/article/about', function()
// {
//     echo "ok";
// });
Route::get('/{slug}', 'BlogController@show')->middleware('blogMinify');
