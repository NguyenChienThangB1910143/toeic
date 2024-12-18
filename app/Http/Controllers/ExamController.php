<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exam;
use App\Models\ExamTest;
use Illuminate\Support\Facades\Storage;
use App\Models\Test;
use App\Models\TestQuestion;
use App\Models\Section;
use App\Models\SectionQuestion;
use App\Models\QuestionGroup;

class ExamController extends Controller
{
    // Danh sách các exam
    public function showQLExam()
    {
        $exams = Exam::paginate(5);
        $examtest= ExamTest::all();
        return view('backend.exams.index', compact('exams', 'examtest'));
    }

    // Lưu exam mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'duration' => 'required|string',
        ]);

        Exam::create([
            'name' => $request->name,
            'duration' => $request->duration,
        ]);

        return redirect()->route('qlexam')->with('success', 'Exam created successfully!');
    }

    // Hiển thị form chỉnh sửa exam
    public function edit($id)
    {
        $exam = Exam::findOrFail($id);
        return view('backend.exams.edit', compact('exam'));
    }

    // Cập nhật exam trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        // Tìm exam theo ID
        $exam = Exam::findOrFail($id);

        // Validate dữ liệu đầu vào
        $request->validate([
            'name' => 'required|string|max:255',
            'duration' => 'required|string',
        ]);

        $exam->update([
            'name' => $request->name,
            'duration' => $request->duration,
        ]);

        return redirect()->route('qlexam')->with('success', 'Exam uppdated successfully!');
    }

    // Xóa exam khỏi cơ sở dữ liệu
    public function destroy($id)
    {
        $exam = Exam::findOrFail($id);
        $exam->delete();

        return redirect()->route('qlexam')->with('success', 'Exam deleted successfully!');
    }
    public function viewExamDetails($exam_id)
{
    // Lấy thông tin bài thi
    $exam = Exam::findOrFail($exam_id);

    // Lấy danh sách các test liên kết với exam
    $examTests = ExamTest::where('exam_id', $exam_id)->first();

    if (!$examTests) {
        return redirect()->back()->with('error', 'Không tìm thấy thông tin bài kiểm tra.');
    }

    // Tạo danh sách test_id kèm theo thứ tự part
    $testsByPart = [
        'Part 1' => $examTests->part1_test_id,
        'Part 2' => $examTests->part2_test_id,
        'Part 3' => $examTests->part3_test_id,
        'Part 4' => $examTests->part4_test_id,
        'Part 5' => $examTests->part5_test_id,
        'Part 6' => $examTests->part6_test_id,
        'Part 7' => $examTests->part7_test_id,
    ];

    // Loại bỏ các phần không có test_id
    $testsByPart = collect($testsByPart)->filter();

    // Lấy tất cả câu hỏi từ các test
    $questions = TestQuestion::with(['question.group'])
        ->whereIn('test_id', $testsByPart->values())
        ->get()
        ->groupBy('test_id'); // Nhóm câu hỏi theo test_id

    return view('backend.exams.view_exam_details', compact('exam', 'examTests', 'questions', 'testsByPart'));
}

}
