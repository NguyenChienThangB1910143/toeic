<?php

namespace App\Http\Controllers;

use App\Models\Lesson;
use Illuminate\Http\Request;

class LessonController extends Controller
{
    // Hiển thị chi tiết một lesson
    public function showQLLesson(Request $request)
    {
        $section_id = $request->input('section_id');
    
        if ($section_id) {
            $lessons = Lesson::where('section_id', $section_id)->paginate(5);
        } else {
            $lessons = Lesson::paginate(5);
        }
    
        return view('backend.lessons.index', compact('lessons', 'section_id'));
    }
    

    // Xử lý việc lưu lesson mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        $request->validate([
            'section_id' => 'required|int',
            'name' => 'required|string|max:255',
        ]);
        Lesson::create([
            'name' => $request->name,
            'section_id' => $request->section_id,
        ]);

        // Lesson::create($request->all());
        $section_id = $request->input('section_id');
        return redirect()->route('qllesson', ['section_id' => $section_id])->with('success', 'Lesson created successfully!');
    }

    // Hiển thị form chỉnh sửa lesson
    public function edit($id)
    {
        $lesson = Lesson::findOrFail($id);
        return view('backend.lessons.edit', compact('lesson'));
    }

    // Xử lý việc cập nhật lesson trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        $lesson = Lesson::findOrFail($id);
    
        $request->validate([
            'name' => 'required|string|max:255',
        ]);
    
        $lesson->update([
            'name' => $request->name,
        ]);
    
        // Lấy section_id từ request để chuyển hướng về đúng trang
        $section_id = $request->input('section_id');
        return redirect()->route('qllesson', ['section_id' => $section_id])->with('success', 'Lesson updated successfully!');
    }
    

    // Xóa một lesson khỏi cơ sở dữ liệu
    public function destroy(Lesson $lesson, Request $request)
    {
        // Xóa lesson
        $lesson->delete();
    
        // Lấy section_id từ URL để chuyển hướng về đúng section
        $sectionId = $request->input('section_id');
    
        // Chuyển hướng về trang qllesson với section_id
        return redirect()->route('qllesson', ['section_id' => $sectionId])
                         ->with('success', 'Lesson deleted successfully!');
    }
    
    
}
