<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exam;
use Illuminate\Support\Facades\Storage;

class ExamController extends Controller
{
    // Danh sách các exam
    public function showQLExam()
    {
        $exams = Exam::paginate(5);
        return view('backend.exams.index', compact('exams'));
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
}
