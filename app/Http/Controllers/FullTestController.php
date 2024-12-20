<?php

namespace App\Http\Controllers;

use App\Models\Exam;
use App\Models\Learner;
use App\Models\ExamTest;
use App\Models\Test;
use App\Models\TestQuestion;
use App\Models\Section;
use App\Models\SectionQuestion;
use App\Models\QuestionGroup;
use App\Models\LearnerExam;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class FullTestController extends Controller
{
    public function showQLExam()
    {
        $examtest= ExamTest::all();
        $exam_id = $examtest->pluck('exam_id');
        $exams = Exam::whereIn('exam_id', $exam_id)->paginate(5);
        $learner = Auth::user();
        return view('frontend.fulltest.fulltest', compact('exams', 'examtest', 'learner'));
    }
    public function test($exam_id)
{
    //Lấy thông tin learner
    $learner = Auth::user();
    // Lấy thông tin bài thi
    $exam = Exam::findOrFail($exam_id);

    // Lấy danh sách các test liên kết với exam
    $examTests = ExamTest::where('exam_id', $exam_id)->first();

    if (!$examTests) {
        return redirect()->back()->with('error', 'Không tìm thấy thông tin bài kiểm tra.');
    }

    // Tạo mảng thứ tự theo part
    $parts = [
        'part1' => $examTests->part1_test_id,
        'part2' => $examTests->part2_test_id,
        'part3' => $examTests->part3_test_id,
        'part4' => $examTests->part4_test_id,
        'part5' => $examTests->part5_test_id,
        'part6' => $examTests->part6_test_id,
        'part7' => $examTests->part7_test_id,
    ];

    // Lấy tất cả test_id từ các cột partX_test_id
    $testIds = collect($parts)->filter(); // Loại bỏ giá trị null

    // Lấy tất cả câu hỏi từ các test
    $questions = TestQuestion::with(['question.group'])
        ->whereIn('test_id', $testIds)
        ->get()
        ->groupBy('test_id');

    // Sắp xếp câu hỏi theo thứ tự part
    $sortedQuestions = collect($parts)
        ->filter()
        ->mapWithKeys(function ($testId, $part) use ($questions) {
            return [$part => $questions->get($testId, collect())];
        });

    return view('frontend.fulltest.fulltest_test', compact('exam', 'examTests', 'sortedQuestions', 'learner'));
}
public function submitTest(Request $request, $exam_id)
{
    // Lấy thông tin learner
    $learner = Auth::user();

    // Lấy thông tin bài thi
    $exam = Exam::findOrFail($exam_id);

    // Tính tổng thời gian làm bài
    $completionTime = Carbon::now()->diffInSeconds($learner->created_at);  // Giả sử thời gian bắt đầu bài thi là thời gian người dùng đăng nhập.

    // Các mảng để lưu trữ kết quả
    $numListenCorrectAns = 0;
    $listenScore = 0;
    $numReadCorrectAns = 0;
    $readScore = 0;
    $numCorrectAns = 0;
    $numWrongAns = 0;
    $numSkipAns = 0;

    // Lặp qua tất cả câu hỏi
    foreach ($request->all() as $questionId => $answer) {
        if (str_contains($questionId, 'answer_')) {
            $questionId = str_replace('answer_', '', $questionId);  // Lấy ID câu hỏi

            // Lấy câu hỏi từ cơ sở dữ liệu
            $question = SectionQuestion::findOrFail($questionId);
            $correctOption = $question->correct_option;

            // Kiểm tra xem người dùng đã chọn đáp án hay chưa
            if ($answer == $correctOption) {
                $numCorrectAns++; // Tăng số câu trả lời đúng
                $section_id = $question->section_id;
                $section=Section::find($section_id);
                if (in_array($section->type, ['part_1', 'part_2', 'part_3', 'part_4'])) {
                    // Phần nghe (Part 1-4)
                    $numListenCorrectAns++;
                } else {
                    // Phần đọc (Part 5-7)
                    $numReadCorrectAns++;
                }
            } elseif ($answer) {
                $numWrongAns++; // Tăng số câu trả lời sai nếu người dùng có chọn đáp án
            } else {
                $numSkipAns++; // Tăng số câu bỏ qua nếu người dùng không chọn đáp án
            }
        }
    }

    // Tính điểm phần Nghe
    if ($numListenCorrectAns =0) {
        $listenScore = 5;
    } else {
        if( $numListenCorrectAns =1) {
            $listenScore =15;
        }else{
            if($numListenCorrectAns <=96){
                $listenScore = 15 + ($numListenCorrectAns - 1) * 5;
            } else {
                $listenScore = 495;
            }
        }
    }

    // Tính điểm phần Đọc
    if ($numReadCorrectAns <= 2) {
        $readScore = 5;
    } else {
        $readScore = 5 + ($numReadCorrectAns-2) * 5; 
    }

    // Tính điểm tổng
    $totalScore = $listenScore + $readScore;

    // Lưu kết quả vào bảng LearnerExam
    $numSkipAns= 200-($numCorrectAns+$numWrongAns);
    LearnerExam::create([
        'learner_id' => $learner->learner_id,
        'exam_id' => $exam->exam_id,
        'completion_time' => now(),  // Thời gian hoàn thành bài thi
        'num_listen_correct_ans' => $numListenCorrectAns,
        'listen_score' => $listenScore,
        'num_read_correct_ans' => $numReadCorrectAns,
        'read_score' => $readScore,
        'total_score' => $totalScore,
        'num_correct_ans' => $numCorrectAns,
        'num_wrong_ans' => $numWrongAns,
        'num_skip_ans' => $numSkipAns,
    ]);

    return redirect()->route('fulltest')->with('success', 'Bạn đã nộp bài thành công!');
}



}