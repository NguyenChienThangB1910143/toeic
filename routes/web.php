<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TopicController;
use App\Http\Controllers\LessonController;
use App\Http\Controllers\LessonContentController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\SectionQuestionController;
use App\Http\Controllers\GrammarController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\LearnerController;
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

// Route cho quản lý sections
Route::middleware('auth:admin')->group(function () {
    Route::get('/qlsection', [SectionController::class, 'showQLSection'])->name('qlsection');
    Route::post('/qlsection', [SectionController::class, 'store'])->name('sections.store');
    Route::get('/sections/{section_id}/edit', [SectionController::class, 'edit'])->name('sections.edit');
    Route::put('/sections/{section_id}', [SectionController::class, 'update'])->name('sections.update');
    Route::delete('/sections/{section_id}', [SectionController::class, 'destroy'])->name('sections.destroy');
    Route::get('/sections/search', [SectionController::class, 'search'])->name('sections.search');
});

// Route cho quản lý lessons
Route::middleware('auth:admin')->group(function () {
    Route::get('/qllesson', [LessonController::class, 'showQLLesson'])->name('qllesson');
    Route::post('/qllesson', [LessonController::class, 'store'])->name('lessons.store');
    Route::get('/lessons/{id}/edit', [LessonController::class, 'edit'])->name('lessons.edit');
    Route::put('/lessons/{id}', [LessonController::class, 'update'])->name('lessons.update');
    Route::delete('/lessons/{lesson}', [LessonController::class, 'destroy'])->name('lessons.destroy');
});

// Route cho quản lý lesson-content
Route::middleware('auth:admin')->group(function () {
    Route::get('/qllesson_content', [LessonContentController::class, 'showQLLessonContent'])->name('qllesson_content');
    Route::post('/qllesson_content', [LessonContentController::class, 'store'])->name('lesson_contents.store');
    Route::get('/lesson_contents/{id}/edit', [LessonContentController::class, 'edit'])->name('lesson_contents.edit');
    Route::put('/lesson_contents/{id}', [LessonContentController::class, 'update'])->name('lesson_contents.update');
    Route::delete('/lesson_contents/{lesson_content}', [LessonContentController::class, 'destroy'])->name('lesson_contents.destroy');
});

// Route cho quản lý section_question
Route::middleware('auth:admin')->group(function () {
    Route::get('/qlsection_question', [SectionQuestionController::class, 'showQLSectionQuestion'])->name('qlsection_question');
    Route::post('/qlsection_question', [SectionQuestionController::class, 'store'])->name('section_questions.store');
    Route::get('/section_questions/{id}/edit', [SectionQuestionController::class, 'edit'])->name('section_questions.edit');
    Route::put('/section_questions/{id}', [SectionQuestionController::class, 'update'])->name('section_questions.update');
    Route::delete('/section_questions/{section_question}', [SectionQuestionController::class, 'destroy'])->name('section_questions.destroy');
});

// Route cho quản lý topics
Route::middleware('auth:admin')->group(function () {
    Route::get('/qltopic', [TopicController::class, 'showQLTopic'])->name('qltopic');
    Route::post('/qltopic', [TopicController::class, 'store'])->name('topics.store');
    Route::get('/topics/{id}/edit', [TopicController::class, 'edit'])->name('topics.edit');
    Route::put('/topics/{id}', [TopicController::class, 'update'])->name('topics.update');
    Route::delete('/topics/{id}', [TopicController::class, 'destroy'])->name('topics.destroy');
});

// Route cho quản lý grammar
Route::middleware('auth:admin')->group(function () {
    Route::get('/qlgrammar', [GrammarController::class, 'showQLGrammar'])->name('qlgrammar');
    Route::post('/qlgrammar', [GrammarController::class, 'store'])->name('grammars.store');
    Route::get('/grammars/{id}/edit', [GrammarController::class, 'edit'])->name('grammars.edit');
    Route::put('/grammars/{id}', [GrammarController::class, 'update'])->name('grammars.update');
    Route::delete('/grammars/{id}', [GrammarController::class, 'destroy'])->name('grammars.destroy');
});

// Route cho quản lý profile
Route::middleware('auth:admin')->group(function () {
    Route::get('/qlprofile', [ProfileController::class, 'showQLProfile'])->name('qlprofile');
    Route::post('/qlprofile', [ProfileController::class, 'store'])->name('profiles.store');
    route::get('/qlprofile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
});

// Route cho quản lý learner
Route::middleware('auth:admin')->group(function () {
    Route::get('/qllearner', [LearnerController::class, 'showQLLearner'])->name('qllearner');
    Route::post('/qllearner', [LearnerController::class, 'store'])->name('learners.store');
});

// Route cho quản lý exam
Route::middleware('auth:admin')->group(function () {
    Route::get('/qlexam', [ExamController::class, 'showQLExam'])->name('qlexam');
    Route::post('/qlexam', [ExamController::class, 'store'])->name('exams.store');
    Route::get('/exams/{id}/edit', [ExamController::class, 'edit'])->name('exams.edit');
    Route::put('/exams/{id}', [ExamController::class, 'update'])->name('exams.update');
    Route::delete('/exams/{id}', [ExamController::class, 'destroy'])->name('exams.destroy');
});

// Route cho quản lý material
Route::middleware('auth:admin')->group(function () {
    Route::get('/qlmaterial', [MaterialController::class, 'showQLMaterial'])->name('qlmaterial');
    Route::post('/qlmaterial', [MaterialController::class, 'store'])->name('materials.store');
});


