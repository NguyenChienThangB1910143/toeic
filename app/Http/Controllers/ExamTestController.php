<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exam;
use App\Models\Test;
use App\Models\TestQuestion;
use App\Models\Section;
use App\Models\SectionQuestion;
use App\Models\QuestionGroup;
use App\Models\ExamTest;
class ExamTestController extends Controller
{

    public function ExamTestIndex(Request $request)
{
    $exam_id = $request->input('exam_id');
    $exam = Exam::find($exam_id);

    // Lấy Section mặc định cho các part (1-6)
    $part1_section = Section::where('type', 'part_1')->first();
    $part2_section = Section::where('type', 'part_2')->first();
    $part3_section = Section::where('type', 'part_3')->first();
    $part4_section = Section::where('type', 'part_4')->first();
    $part5_section = Section::where('type', 'part_5')->first();
    $part6_section = Section::where('type', 'part_6')->first();  // Thêm phần Part 6
    $part7_section = Section::where('type', 'part_7')->first();  // Lấy phần Part 7

    // Xử lý phần test của từng phần (1-7)
    $part1_tests = $part1_section ? Test::where('section_id', $part1_section->section_id)->get() : [];
    $part2_tests = $part2_section ? Test::where('section_id', $part2_section->section_id)->get() : [];
    $part3_tests = $part3_section ? Test::where('section_id', $part3_section->section_id)->get() : [];
    $part4_tests = $part4_section ? Test::where('section_id', $part4_section->section_id)->get() : [];
    $part5_tests = $part5_section ? Test::where('section_id', $part5_section->section_id)->get() : [];
    $part6_tests = $part6_section ? Test::where('section_id', $part6_section->section_id)->get() : [];  // Lấy test cho Part 6
    $part7_tests = $part7_section ? Test::where('section_id', $part7_section->section_id)->get() : [];  // Lấy test cho Part 7

    // Lấy các test ID được chọn
    $part1_test_id = $request->input('part1_test_id');
    $part2_test_id = $request->input('part2_test_id');
    $part3_test_id = $request->input('part3_test_id');
    $part4_test_id = $request->input('part4_test_id');
    $part5_test_id = $request->input('part5_test_id');
    $part6_test_id = $request->input('part6_test_id');  // Thêm test_id cho Part 6
    $part7_test_id = $request->input('part7_test_id');  // Thêm test_id cho Part 7

    // Lấy câu hỏi cho từng phần
    $part1_questions = [];
    if ($part1_test_id) {
        $part1_test_questions = TestQuestion::where('test_id', $part1_test_id)->get();
        $part1_questions = SectionQuestion::whereIn('question_id', $part1_test_questions->pluck('question_id'))->get();
    }

    $part2_questions = [];
    $part2_audio = null; // Audio cho Part 2
    if ($part2_test_id) {
        $part2_test_questions = TestQuestion::where('test_id', $part2_test_id)->get();
        $part2_questions = SectionQuestion::whereIn('question_id', $part2_test_questions->pluck('question_id'))->get();

        // Lấy audio cho Part 2 từ QuestionGroup
        $group_id = SectionQuestion::whereIn('question_id', $part2_test_questions->pluck('question_id'))->value('question_group_id');
        if ($group_id) {
            $part2_audio = QuestionGroup::where('question_group_id', $group_id)->value('audio');
        }
    }

    // Lấy câu hỏi và audio cho Part 3
    $part3_questions = collect([]);
    $part3_groups = [];
    if ($part3_test_id) {
        $part3_test_questions = TestQuestion::where('test_id', $part3_test_id)->get();
        $part3_questions = SectionQuestion::whereIn('question_id', $part3_test_questions->pluck('question_id'))->get();

        // Lấy các nhóm câu hỏi cho Part 3
        $group_ids = $part3_questions->pluck('question_group_id')->unique();
        foreach ($group_ids as $group_id) {
            $part3_groups[] = [
                'group_id' => $group_id,
                'audio' => QuestionGroup::where('question_group_id', $group_id)->value('audio'),
                'questions' => $part3_questions->where('question_group_id', $group_id)
            ];
        }
    }

    // Lấy câu hỏi và audio cho Part 4
    $part4_questions = collect([]);
    $part4_groups = [];
    if ($part4_test_id) {
        $part4_test_questions = TestQuestion::where('test_id', $part4_test_id)->get();
        $part4_questions = SectionQuestion::whereIn('question_id', $part4_test_questions->pluck('question_id'))->get();

        // Lấy các nhóm câu hỏi cho Part 4
        $group_ids = $part4_questions->pluck('question_group_id')->unique();
        foreach ($group_ids as $group_id) {
            $part4_groups[] = [
                'group_id' => $group_id,
                'audio' => QuestionGroup::where('question_group_id', $group_id)->value('audio'),
                'questions' => $part4_questions->where('question_group_id', $group_id)
            ];
        }
    }

    // Lấy câu hỏi và text cho Part 5
    $part5_questions = collect([]);
    $part5_groups = [];
    if ($part5_test_id) {
        $part5_test_questions = TestQuestion::where('test_id', $part5_test_id)->get();
        $part5_questions = SectionQuestion::whereIn('question_id', $part5_test_questions->pluck('question_id'))->get();

        // Lấy các nhóm câu hỏi cho Part 5 và lấy text từ QuestionGroup
        $group_ids = $part5_questions->pluck('question_group_id')->unique();
        foreach ($group_ids as $group_id) {
            $part5_groups[] = [
                'group_id' => $group_id,
                'text' => QuestionGroup::where('question_group_id', $group_id)->value('text'),
                'questions' => $part5_questions->where('question_group_id', $group_id)
            ];
        }
    }

    // Lấy câu hỏi cho Part 6
    $part6_questions = collect([]);
    $part6_groups = [];
    if ($part6_test_id) {
        $part6_test_questions = TestQuestion::where('test_id', $part6_test_id)->get();
        $part6_questions = SectionQuestion::whereIn('question_id', $part6_test_questions->pluck('question_id'))->get();
    
        // Lấy nhóm câu hỏi cho Part 6
        $group_ids = $part6_questions->pluck('question_group_id')->unique();
        foreach ($group_ids as $group_id) {
            $part6_groups[] = [
                'group_id' => $group_id,
                'text' => QuestionGroup::where('question_group_id', $group_id)->value('text'),
                'questions' => $part6_questions->where('question_group_id', $group_id)
            ];
        }
    }

    // Lấy câu hỏi cho Part 7
    $part7_questions = collect([]);
    $part7_groups = [];
    if ($part7_test_id) {
        $part7_test_questions = TestQuestion::where('test_id', $part7_test_id)->get();
        $part7_questions = SectionQuestion::whereIn('question_id', $part7_test_questions->pluck('question_id'))->get();
    
        // Lấy nhóm câu hỏi cho Part 7
        $group_ids = $part7_questions->pluck('question_group_id')->unique();
        foreach ($group_ids as $group_id) {
            $part7_groups[] = [
                'group_id' => $group_id,
                'text' => QuestionGroup::where('question_group_id', $group_id)->value('text'),
                'questions' => $part7_questions->where('question_group_id', $group_id)
            ];
        }
    }

    // Truyền dữ liệu vào view
    return view('backend.exams.exam_test', compact(
        'exam',
        'exam_id',
        'part1_tests',
        'part2_tests',
        'part3_tests',
        'part4_tests',
        'part5_tests',
        'part6_tests',
        'part7_tests',
        'part1_questions',
        'part2_questions',
        'part3_groups',
        'part4_groups',
        'part5_groups',
        'part6_groups',
        'part7_groups',
        'part2_audio',
        'part1_test_id',
        'part2_test_id',
        'part3_test_id',
        'part4_test_id',
        'part5_test_id',
        'part6_test_id',
        'part7_test_id'
    ));
}

public function store(Request $request)
{
    // Kiểm tra nếu có dữ liệu từ form
    $validated = $request->validate([
        'exam_id' => 'required|integer',
        'part1_test_id' => 'nullable|integer',
        'part2_test_id' => 'nullable|integer',
        'part3_test_id' => 'nullable|integer',
        'part4_test_id' => 'nullable|integer',
        'part5_test_id' => 'nullable|integer',
        'part6_test_id' => 'nullable|integer',
        'part7_test_id' => 'nullable|integer',
    ]);

    // Tạo một đối tượng ExamTest mới và lưu thông tin
    $examTest = new ExamTest();
    $examTest->exam_id = $validated['exam_id'];
    
    // Kiểm tra nếu key tồn tại trong request trước khi gán
    $examTest->part1_test_id = $request->has('part1_test_id') ? $request->part1_test_id : null;
    $examTest->part2_test_id = $request->has('part2_test_id') ? $request->part2_test_id : null;
    $examTest->part3_test_id = $request->has('part3_test_id') ? $request->part3_test_id : null;
    $examTest->part4_test_id = $request->has('part4_test_id') ? $request->part4_test_id : null;
    $examTest->part5_test_id = $request->has('part5_test_id') ? $request->part5_test_id : null;
    $examTest->part6_test_id = $request->has('part6_test_id') ? $request->part6_test_id : null;
    $examTest->part7_test_id = $request->has('part7_test_id') ? $request->part7_test_id : null;

    // Lưu vào cơ sở dữ liệu
    $examTest->save();

    // Chuyển hướng về trang bài kiểm tra hoặc thông báo thành công
    return redirect()->route('exam.test')->with('success', 'Thông tin bài kiểm tra đã được lưu.');
}


}
