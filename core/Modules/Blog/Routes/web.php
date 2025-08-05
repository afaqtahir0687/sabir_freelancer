<?php

use Modules\Blog\Http\Controllers\Frontend\BlogController;


//backend routes
Route::group(['as'=>'admin.','prefix'=>'admin','middleware' => ['auth:admin','setlang']], function () {
    Route::controller(\Modules\Blog\Http\Controllers\Admin\BlogController::class)->group(function () {
        Route::get('blog', 'all_blog')->name('blog.all')->permission('blog-list');
        Route::get('blog/create','create')->name('blog.create')->permission('blog-add');
        Route::post('blog/store','store')->name('blog.store')->permission('blog-add');
        Route::get('blog/edit/{id}','edit')->name('blog.edit')->permission('blog-edit');
        Route::post('blog/update/{id}','update')->name('blog.update')->permission('blog-edit');
        Route::post('blog/delete/{id}','destroy')->name('blog.destroy')->permission('blog-delete');
        Route::get('blog/paginate/data', 'pagination')->name('blog.paginate.data');
        Route::get('blog/search/blog', 'search_blog')->name('blog.search');
    });
});


//frontend routes
Route::group(['middleware' => ['globalVariable', 'maintains_mode','setlang']], function () {
    Route::controller(BlogController::class)->group(function(){
        Route::get('blogs/all', 'blog')->name('blog.all');
        Route::get('blogs/all/pagination', 'pagination')->name('blog.pagination');
        Route::get('blogs/filter', 'blog_filter')->name('blog.filter');
        Route::get('blogs/{slug}', 'blog_details')->name('blog.details');
    });
});

