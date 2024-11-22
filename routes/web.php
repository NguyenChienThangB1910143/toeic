<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\LearnerAuthController;
use App\Http\Controllers\LearnerController;
use App\Http\Controllers\TopicController;
use App\Http\Controllers\LessonController;
use App\Http\Controllers\LessonContentController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\SectionQuestionController;
use App\Http\Controllers\GrammarController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\MaterialController;

// Route nhóm cho phần quản lý Admin
Route::prefix('toeic/admin')->group(function () {
    Route::get('/', [AdminAuthController::class, 'showLoginForm'])->name('admin.login');
    Route::post('/login', [AdminAuthController::class, 'login'])->name('admin.login.post');
    Route::post('/logout', [AdminAuthController::class, 'logout'])->name('admin.logout');

    Route::get('/IndexAdmin', function () {
        return view('backend.IndexAdmin');
    })->name('admin.index')->middleware('auth:admin');
});

// Route cho các chức năng quản lý của Admin
Route::middleware('auth:admin')->group(function () {
    Route::resource('sections', SectionController::class)->except(['show', 'create']);
    Route::resource('lessons', LessonController::class)->except(['show', 'create']);
    Route::resource('lesson_contents', LessonContentController::class)->except(['show', 'create']);
    Route::resource('section_questions', SectionQuestionController::class)->except(['show', 'create']);
    Route::resource('topics', TopicController::class)->except(['show', 'create']);
    Route::resource('grammars', GrammarController::class)->except(['show', 'create']);
    Route::resource('profiles', ProfileController::class)->except(['show', 'create']);
    Route::resource('learners', LearnerController::class)->except(['show', 'create']);
    Route::resource('exams', ExamController::class)->except(['show', 'create']);
    Route::resource('materials', MaterialController::class)->except(['show', 'create']);

    Route::get('/qlprofile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
});

// Route nhóm cho Learner
Route::prefix('learner')->group(function () {
    Route::get('/login', [LearnerAuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LearnerAuthController::class, 'login'])->name('login.submit');
    Route::post('/logout', [LearnerAuthController::class, 'logout'])->name('logout');

    Route::get('/register', [LearnerAuthController::class, 'showRegister'])->name('register');
    Route::post('/register', [LearnerAuthController::class, 'register'])->name('register');

    Route::middleware('auth')->group(function () {
        Route::get('/index', function () {
            return view('frontend.index');
        })->name('learner.index');
    });
});

// Route cho các trang frontend
Route::get('home', function () {
    return view('frontend.home');
})->name('home');

Route::get('practice-listening', function () {
    return view('frontend.practice.practice-listening');
})->name('practice-listening');

Route::get('practice-reading', function () {
    return view('frontend.practice.practice-reading');
})->name('practice-reading');

Route::get('grammar', function () {
    return view('frontend.skill.grammar');
})->name('grammar');

Route::get('topic', function () {
    return view('frontend.skill.topic');
})->name('topic');

Route::get('dictionary', function () {
    return view('frontend.skill.dictionary');
})->name('dictionary');

Route::get('fulltest', function () {
    return view('frontend.fulltest.fulltest');
})->name('fulltest');

Route::get('material', function () {
    return view('frontend.material.material');
})->name('material');

Route::get('feedback', function () {
    return view('frontend.feedback.feedback');
})->name('feedback');

Route::get('tips-listening', function () {
    return view('frontend.tips.tips-listening');
})->name('tips-listening');

Route::get('tips-reading', function () {
    return view('frontend.tips.tips-reading');
})->name('tips-reading');

Route::get('profile', function () {
    return view('frontend.profile.profile');
})->name('profile');

Route::get('learnerroute', function () {
    return view('frontend.learnerroute.learnerroute');
})->name('learnerroute');

Route::get('learner-vocabulary', function () {
    return view('frontend.learner-vocabulary.learner-vocabulary');
})->name('learner-vocabulary');
