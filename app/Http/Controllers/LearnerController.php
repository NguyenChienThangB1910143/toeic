<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Learner;

class LearnerController extends Controller
{
    // Phương thức hiển thị danh sách học viên
    public function showqlLearner()
    {
        $learners = Learner::paginate(5);
        return view('backend.learners.index', compact('learners'));
    }

}

Route::prefix('learner')->group(function () {
    Route::get('/login', [LearnerAuthController::class, 'showLoginForm'])->name('learner.login');
    Route::post('/login', [LearnerAuthController::class, 'login'])->name('learner.login.post');
    Route::post('/logout', [LearnerAuthController::class, 'logout'])->name('learner.logout');

    Route::get('/index', function () {
        return view('fontend.index');
    })->name('learner.index')->middleware('auth');
});

