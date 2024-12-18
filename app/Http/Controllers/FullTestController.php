<?php

namespace App\Http\Controllers;

use App\Models\Exam;
use App\Models\Auth;
use App\Models\Learner;
use App\Models\ExamTest;
use App\Models\Test;
use App\Models\TestQuestion;
use App\Models\Section;
use App\Models\SectionQuestion;
use App\Models\QuestionGroup;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;

class FullTestController extends Controller
{
    public function showQLExam()
    {
        $examtest= ExamTest::all();
        $exam_id = $examtest->pluck('exam_id');
        $exams = Exam::whereIn('exam_id', $exam_id)->paginate(5);
        return view('frontend.fulltest.fulltest', compact('exams', 'examtest'));
    }
    public function test($exam_id)
{
    // Lấy thông tin bài thi
    $exam = Exam::findOrFail($exam_id);
    // Lấy danh sách các test liên kết với exam
    $examTests = ExamTest::where('exam_id', $exam_id)->first();

    if (!$examTests) {
        return redirect()->back()->with('error', 'Không tìm thấy thông tin bài kiểm tra.');
    }

    // Lấy tất cả test_id từ các cột partX_test_id
    $testIds = collect([
        $examTests->part1_test_id,
        $examTests->part2_test_id,
        $examTests->part3_test_id,
        $examTests->part4_test_id,
        $examTests->part5_test_id,
        $examTests->part6_test_id,
        $examTests->part7_test_id,
    ])->filter(); // Loại bỏ các giá trị null

    // Lấy tất cả câu hỏi từ các test
    $questions = TestQuestion::with(['question.group'])
        ->whereIn('test_id', $testIds)
        ->get()
        ->groupBy('test_id'); // Nhóm câu hỏi theo test_id

    return view('frontend.fulltest.fulltest_test', compact('exam', 'examTests', 'questions'));
}

}