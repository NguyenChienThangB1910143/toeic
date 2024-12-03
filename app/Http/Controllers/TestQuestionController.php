<?php

namespace App\Http\Controllers;

use App\Models\Test;
use App\Models\TestQuestion;
use App\Models\SectionQuestion;
use Illuminate\Http\Request;

class TestQuestionController extends Controller
{
    // Hiển thị chi tiết một test
    public function showQLTestQuestion(Request $request)
    {
        $test_id = $request->input('test_id');

        $question_id = TestQuestion::where('test_id', $test_id)->pluck('question_id')->toArray();

        $questions = SectionQuestion::whereIn('question_id', $question_id)->paginate(5);
        dd($question_id);
        return view('backend.tests.questions.index', compact('questions', 'test_id'));
    }
    
    
    
}
