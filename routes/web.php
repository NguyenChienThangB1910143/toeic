<?php

use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TopicController;

Route::prefix('toeic/admin')->group(function () {
    Route::get('/', [AdminAuthController::class, 'showLoginForm'])->name('admin.login');
    Route::post('/login', [AdminAuthController::class, 'login'])->name('admin.login.post');
    Route::post('/logout', [AdminAuthController::class, 'logout'])->name('admin.logout');

    Route::get('IndexAdmin', function () {
        return view('backend.IndexAdmin');
    })->name('admin.index')->middleware('auth:admin');
});
Route::get('/qltopic', [TopicController::class, 'showQLTopic'])->name('qltopic');
Route::post('/qltopic', [TopicController::class, 'store'])->name('topics.store');
