<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\LearnerAuthController;
use App\Http\Controllers\LearnerController;
use App\Http\Controllers\TopicController;
use App\Http\Controllers\VocabularyController;
use App\Http\Controllers\LessonController;
use App\Http\Controllers\LessonContentController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\SectionQuestionController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\GrammarController;
use App\Http\Controllers\GrammarContentController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\MaterialController;
use App\Http\Controllers\FeedbackController;
use App\Http\Controllers\DictionaryController;
use App\Http\Controllers\TestQuestionController;
use App\Http\Controllers\ExamTestController;
use App\Http\Controllers\PracticeController;
use App\Http\Controllers\FullTestController;



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
        'vocabularies' => VocabularyController::class,
        'grammars' => GrammarController::class,
        'grammar_contents' => GrammarContentController::class,
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
   
    Route::resource('tests', TestController::class)->except(['show', 'create']);
    Route::get('/qltest', [TestController::class, 'showQLTest'])->name('qltest');
    Route::get('/qltest_question', [TestQuestionController::class, 'showQLTestQuestion'])->name('qltest_question');
    Route::get('/view_test/{section_id}/{test_id}', [TestQuestionController::class, 'viewTest'])->name('view_test');


    Route::post('/qltest', [TestQuestionController::class, 'storeSelectedQuestions'])->name('store_test_questions');


    



    Route::resource('topics', TopicController::class)->except(['show', 'create']);
    Route::get('/qltopic', [TopicController::class, 'showQLTopic'])->name('qltopic');

    Route::resource('vocabularies', VocabularyController::class)->except(['show', 'create']);
    Route::get('/qlvocabulary', [VocabularyController::class, 'showQLVocabulary'])->name('qlvocabulary');
    Route::post('/vocabularies/store', [VocabularyController::class, 'store'])->name('vocabularies.store');

    Route::resource('grammars', GrammarController::class)->except(['show', 'create']);
    Route::get('/qlgrammar', [GrammarController::class, 'showQLGrammar'])->name('qlgrammar');
    Route::resource('grammar_contents', GrammarContentController::class)->except(['show', 'create']);
    Route::get('/qlgrammar_content', [GrammarContentController::class, 'showQLGrammarContent'])->name('qlgrammar_content');

    Route::resource('profiles', ProfileController::class)->except(['show', 'create']);
    Route::resource('learners', LearnerController::class)->except(['show', 'create']);
    Route::get('/qllearner', [LearnerController::class, 'showQLLearner'])->name('qllearner');
    Route::get('/qllearner/{learner_id}/status', [LearnerController::class, 'status'])->name('learner.status');

    Route::resource('exams', ExamController::class)->except(['show', 'create']);
    Route::get('/qlexam', [ExamController::class, 'showQLExam'])->name('qlexam');

    Route::get('/exam_test', [ExamTestController::class, 'ExamTestIndex'])->name('exam.test');
    Route::post('/exam_test', [ExamTestController::class, 'store'])->name('exam_test.store');
    Route::get('/qlexam/{exam_id}/details', [ExamController::class, 'viewExamDetails'])->name('exam.details');




    Route::resource('materials', MaterialController::class)->except(['show', 'create']);
    Route::get('/qlmaterial', [MaterialController::class, 'showQLMaterial'])->name('qlmaterial');
    Route::post('/materials', [MaterialController::class, 'store'])->name('materials.store');
    Route::get('materials/{material}/edit', [MaterialController::class, 'edit'])->name('materials.edit');
    Route::put('materials/{material}', [MaterialController::class, 'update'])->name('materials.update');
    Route::get('/materials', [MaterialController::class, 'showMaterials'])->name('materials.show');


    Route::get('/qlprofile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
});

// Route nhóm cho Learner

Route::prefix('learner')->group(function () {
    
    Route::get('/login', [LearnerAuthController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LearnerAuthController::class, 'login'])->name('login.submit');
    Route::post('/logout', [LearnerAuthController::class, 'logout'])->name('logout');
    Route::get('/home', [LearnerController::class, 'index'])->name('home');

    Route::get('/register', [LearnerAuthController::class, 'showRegister'])->name('register');
    Route::post('/register', [LearnerAuthController::class, 'register'])->name('register');
    Route::middleware(['auth'])->group(function () {
        Route::get('/profile', [LearnerController::class, 'profile'])->name('profile');
        Route::post('/profile/update', [LearnerController::class, 'update'])->name('profile.update');
        Route::post('/profile/update-photo', [LearnerController::class, 'updatePhoto'])->name('profile.updatePhoto');
        Route::post('/profile/change-password', [LearnerController::class, 'changePassword'])->name('profile.changePassword');

        route::get('/feedback',[FeedbackController::class,'create'])->name('feedback.feedback');
        route::post('/feedback/create',[FeedbackController::class,'store'])->name('feedback.store');
    });

    Route::get('/dictionary', [DictionaryController::class, 'index']);
    Route::post('/search', [DictionaryController::class, 'search']);
    
    Route::get('/fulltest', [FullTestController::class, 'showQLExam'])->name('fulltest');
    Route::get('/fulltest/{exam_id}/test', [FullTestController::class, 'test'])->name('fulltest.test');
});


Route::get('practice', [PracticeController::class, 'index'])->name('practice');
Route::get('/practice/section/{id}', [PracticeController::class, 'show'])->name('practice.section');
Route::get('/practice/section/lesson/{id}', [PracticeController::class, 'lesson'])->name('practice.lesson');
Route::get('/practice/test/{id}', [PracticeController::class, 'test'])->name('practice.test');

Route::get('grammar', [GrammarController::class, 'showGrammars'])->name('grammar');
Route::get('/grammar/content/{grammar_id}', [GrammarController::class, 'grammarContent'])->name('grammar.content');


Route::get('topic', [TopicController::class, 'showTopics'])->name('topic');
Route::get('/topics/{id}/vocabularies', [VocabularyController::class, 'showVocabulariesByTopic'])->name('topic.vocabularies');
Route::get('/vocabularies/{topic_id}/page/{page}', [VocabularyController::class, 'getVocabularyPage'])->name('vocabulary.page');


Route::get('dictionary', function () {
    return view('frontend.skill.dictionary');
})->name('dictionary');


Route::get('material',[MaterialController::class,'showMaterials'])->name('material');

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
