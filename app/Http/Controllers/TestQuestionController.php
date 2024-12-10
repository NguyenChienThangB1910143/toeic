<?php

namespace App\Http\Controllers;

use App\Models\Test;
use App\Models\TestQuestion;
use App\Models\SectionQuestion;
use Illuminate\Http\Request;
use App\Models\Section;

class TestQuestionController extends Controller
{
    // Hiển thị chi tiết một test
    public function showQLTestQuestion(Request $request)
{
    $section_id = $request->input('section_id');
    $test_id = $request->input('test_id');

    // Lấy thông tin section
    $section = Section::find($section_id);

    // Lấy danh sách câu hỏi, kèm theo thông tin của question_group (nếu có)
    $questions = SectionQuestion::with('group') // Eager load question_group
        ->where('section_id', $section_id)
        ->paginate(54);

    return view('backend.test_question.index', compact('questions', 'section', 'section_id', 'test_id'));
}

    
    // TestQuestionController.php

    public function storeSelectedQuestions(Request $request)
{
    $test_id = $request->input('test_id');
    $selected_questions = $request->input('selected_questions');
    $section_id = $request->input('section_id');

    // Lấy thông tin section để kiểm tra type
    $section = Section::find($section_id);
    // Xác định số lượng câu hỏi cần chọn dựa trên type
    $requiredQuestions = 0;
    if ($section->type === 'part_1') {
        $requiredQuestions = 6;
    } elseif ($section->type === 'part_2') {
        $requiredQuestions = 25;
    }elseif ($section->type === 'part_3') {
        $requiredQuestions = 39;
    }elseif ($section->type === 'part_4') {
        $requiredQuestions = 30;
    }elseif ($section->type === 'part_5') {
        $requiredQuestions = 30;
    }elseif ($section->type === 'part_6') {
        $requiredQuestions = 16;
    }elseif ($section->type === 'part_7') {
        $requiredQuestions = 54;
    }
    // Log dữ liệu thô
    \Log::info('Selected Questions (Raw): ', ['data' => $selected_questions]);

    // Giải mã JSON
    $decoded_questions = json_decode($selected_questions, true);

    // Log dữ liệu sau khi giải mã
    \Log::info('Selected Questions (Decoded): ', ['data' => $decoded_questions]);

    // Kiểm tra số lượng câu hỏi
    if (is_null($decoded_questions) || count($decoded_questions) !== $requiredQuestions) {
        return back()->with('error', "Bạn phải chọn đúng $requiredQuestions câu hỏi.");
    }

    // Lưu các câu hỏi được chọn
    foreach ($decoded_questions as $question_id) {
        TestQuestion::create([
            'test_id' => $test_id,
            'question_id' => $question_id,
        ]);
    }

    return back()->with('success', "Đã thêm $requiredQuestions câu hỏi vào test thành công.");
}


}
