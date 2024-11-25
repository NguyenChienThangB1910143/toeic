<?php
// use Illuminate\Support\Facades\Route;
// use App\Http\Controllers\AdminAuthController;
// use App\Http\Controllers\AdminController;

// // Auth routes
// Route::prefix('toeic/admin')->group(function () {
//     Route::get('/', [AdminAuthController::class, 'showLoginForm'])->name('admin.login');
//     Route::post('/login', [AdminAuthController::class, 'login'])->name('admin.login.post');
//     Route::post('/logout', [AdminAuthController::class, 'logout'])->name('admin.logout');
// });

// // Admin dashboard
// Route::middleware('auth:admin')->group(function () {
//     Route::get('/IndexAdmin', function () {
//         return view('backend.IndexAdmin');
//     })->name('admin.index');

//     Route::resources([
//         'sections' => SectionController::class,
//         'lessons' => LessonController::class,
//         'lesson_contents' => LessonContentController::class,
//         'section_questions' => SectionQuestionController::class,
//         'topics' => TopicController::class,
//         'grammars' => GrammarController::class,
//         'profiles' => ProfileController::class,
//         'learners' => LearnerController::class,
//         'exams' => ExamController::class,
//         'materials' => MaterialController::class,
//     ]);
// });
