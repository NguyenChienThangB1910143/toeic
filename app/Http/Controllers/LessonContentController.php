<?php

namespace App\Http\Controllers;

use App\Models\LessonContent;
use Illuminate\Http\Request;

class LessonContentController extends Controller
{
    // Hiển thị chi tiết một lesson
    public function showQLLessonContent(Request $request)
    {
        $lesson_id = $request->input('lesson_id');
    
        if ($lesson_id) {
            $lesson_contents = LessonContent::where('lesson_id', $lesson_id)->paginate(5);
        } else {
            $lesson_contents = LessonContent::paginate(5);
        }
    
        return view('backend.lesson_contents.index', compact('lesson_contents', 'lesson_id'));
    }
    

    // Xử lý việc lưu lesson_content mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        $request->validate([
            'lesson_id' => 'required|int',
            'title' => 'required|string|max:255',
            'content' => 'nullable|string',

        ]);
        LessonContent::create([
            'title' => $request->title,
            'lesson_id' => $request->lesson_id,
            'content' => $request->content
        ]);

        $lesson_id = $request->input('lesson_id');
        return redirect()->route('qllesson_content', ['lesson_id' => $request->lesson_id])->with('success', 'Content created successfully!');
     }

    // Hiển thị form chỉnh sửa lesson_content
    public function edit($id)
    {
        $lesson_content = LessonContent::findOrFail($id);
        return view('backend.lesson_contents.edit', compact('lesson_content'));
    }

    // Xử lý việc cập nhật lesson_content trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        $lesson_content = LessonContent::findOrFail($id);
    
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'nullable|string',
        ]);
    
        $lesson_content->update([
            'title' => $request->title,
            'content' => $request->content
        ]);
    
        // Lấy lesson_id từ request để chuyển hướng về đúng trang
        $lesson_id = $request->input('lesson_id');
        return redirect()->route('qllesson_content', ['lesson_id' => $request->lesson_id])->with('success', 'Content updated successfully!');
    }
    

    // Xóa một lesson_content khỏi cơ sở dữ liệu
    public function destroy(LessonContent $lesson_content, Request $request)
    {
        // Xóa lesson_content
        $lesson_content->delete();
    
        // Lấy lesson_id từ URL để chuyển hướng về đúng lesson
        $lessonId = $request->input('lesson_id');
    
        // Chuyển hướng về trang qllesson_content với lesson_id
        return redirect()->route('qllesson_content', ['lesson_id' => $lessonId])
                         ->with('success', 'Content deleted successfully!');
    }
}
