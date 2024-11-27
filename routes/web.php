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
});
// Admin dashboard
Route::middleware('auth:admin')->group(function () {
    Route::get('/IndexAdmin', function () {
        return view('backend.IndexAdmin');
    })->name('admin.index');

    Route::resources([
        'sections' => SectionController::class,
        'lessons' => LessonController::class,
        'lesson_contents' => LessonContentController::class,
        'section_questions' => SectionQuestionController::class,
        'topics' => TopicController::class,
        'grammars' => GrammarController::class,
        'profiles' => ProfileController::class,
        'learners' => LearnerController::class,
        'exams' => ExamController::class,
        'materials' => MaterialController::class,
    ]);
});

// Route cho các chức năng quản lý của Admin
Route::middleware('auth:admin')->group(function () {
    Route::resource('sections', SectionController::class)->except(['show', 'create']);
    Route::get('/qlsection', [SectionController::class, 'showQLSection'])->name('qlsection');

    Route::resource('lessons', LessonController::class)->except(['show', 'create']);
    Route::get('/qllesson', [LessonController::class, 'showQLLesson'])->name('qllesson');

    Route::resource('lesson_contents', LessonContentController::class)->except(['show', 'create']);
    Route::get('/qllesson_content', [LessonContentController::class, 'showQLLessonContent'])->name('qllesson_content');

    //questions
    Route::resource('section_questions', SectionQuestionController::class)->except(['show', 'create']);
    Route::get('/qlsection_question', [SectionQuestionController::class, 'showQLSectionQuestion'])->name('qlsection_question');
    Route::post('/section_questions', [SectionQuestionController::class, 'store'])->name('section_questions.store');
    Route::get('/section_questions/{question_id}/edit', [SectionQuestionController::class, 'edit'])->name('section_questions.edit');
    Route::put('/section_questions/{question_id}', [SectionQuestionController::class, 'update'])->name('section_questions.update');
// Route vẫn cần sử dụng đúng ID
Route::delete('/section_questions/{question}', [SectionQuestionController::class, 'destroy'])->name('section_questions.destroy');
   
    



    



    Route::resource('topics', TopicController::class)->except(['show', 'create']);
    Route::get('/qltopic', [TopicController::class, 'showQLTopic'])->name('qltopic');

    Route::resource('grammars', GrammarController::class)->except(['show', 'create']);
    Route::get('/qlgrammar', [GrammarController::class, 'showQLGrammar'])->name('qlgrammar');

    Route::resource('profiles', ProfileController::class)->except(['show', 'create']);
    Route::resource('learners', LearnerController::class)->except(['show', 'create']);
    Route::get('/qllearner', [LearnerController::class, 'showQLLearner'])->name('qllearner');

    Route::resource('exams', ExamController::class)->except(['show', 'create']);
    Route::get('/qlexam', [ExamController::class, 'showQLExam'])->name('qlexam');

    Route::resource('materials', MaterialController::class)->except(['show', 'create']);
    Route::get('/qlmaterial', [MaterialController::class, 'showQLMaterial'])->name('qlmaterial');

    Route::get('/qlprofile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
});

// Route nhóm cho Learner

Route::prefix('learner')->group(function () {
    
    Route::get('/login', [LearnerAuthController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LearnerAuthController::class, 'login'])->name('login.submit');
    Route::post('/logout', [LearnerAuthController::class, 'logout'])->name('logout');

    Route::get('/register', [LearnerAuthController::class, 'showRegister'])->name('register');
    Route::post('/register', [LearnerAuthController::class, 'register'])->name('register');
    Route::middleware(['auth'])->group(function () {
        Route::get('/home', [LearnerController::class, 'index'])->name('home');
        Route::get('/profile', [LearnerController::class, 'profile'])->name('profile');
        Route::post('/profile/update', [LearnerController::class, 'update'])->name('profile.update');
        Route::post('/profile/update-photo', [LearnerController::class, 'updatePhoto'])->name('profile.updatePhoto');
        Route::post('/profile/change-password', [LearnerController::class, 'changePassword'])->name('profile.changePassword');
    });
});


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

Route::get('learningroute', function () {
    return view('frontend.learningroute.learningroute');
})->name('learningroute');

Route::get('learner-vocabularies', function () {
    return view('frontend.learner-vocabularies.learner-vocabularies');
})->name('learner-vocabularies');
