<?php
// use Illuminate\Support\Facades\Route;
// use App\Http\Controllers\LearnerAuthController;
// use App\Http\Controllers\LearnerController;

// Route::prefix('learner')->group(function () {
//     Route::get('/login', [LearnerAuthController::class, 'showLoginForm'])->name('login');
//     Route::post('/login', [LearnerAuthController::class, 'login'])->name('login.submit');
//     Route::post('/logout', [LearnerAuthController::class, 'logout'])->name('logout');

//     Route::get('/register', [LearnerAuthController::class, 'showRegister'])->name('register');
//     Route::post('/register', [LearnerAuthController::class, 'register'])->name('register.submit');

//     Route::middleware(['auth','verified'])->group(function () {
//         Route::get('/profile', [LearnerController::class, 'profile'])->name('profile');
//         Route::post('/profile/update', [LearnerController::class, 'update'])->name('profile.update');
//         Route::post('/profile/photo', [LearnerController::class, 'updatePhoto'])->name('profile.photo');
//         Route::post('/profile/update-photo', [LearnerController::class, 'updatePhoto'])->name('profile.updatePhoto');

//         Route::post('/profile/password', [LearnerController::class, 'changePassword'])->name('profile.password');
//     });
    
// });
