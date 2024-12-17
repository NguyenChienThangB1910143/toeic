<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Section;
use App\Models\Lesson;
use App\Models\LessonContent;
use App\Models\Test;
use Illuminate\Support\Facades\Storage;


class PracticeController extends Controller
{
    public function index()
    {
        // Lấy dữ liệu từ database
        $sections = Section::all(); // Lấy tất cả sections 
        // $lessons = Lesson::all(); // Lấy tất cả lessons
        // $tests = Test::all(); // Lấy tất cả tests

        // Truyền dữ liệu ra view
        return view('frontend.practice.practice', compact('sections'));
    }
    public function show($id)
    {
        // Lấy thông tin section dựa trên ID
        $current_section = Section::findOrFail($id);
        // Lấy danh sách các section (khác section hiện tại)
        $sections = Section::where('section_id', '!=', $id)->get();

        // Lấy các lessons và tests liên quan
        $lessons = Lesson::where('section_id', $id)->get();
        $tests = Test::where('section_id', $id)->get();

        // Truyền dữ liệu ra view
        return view('frontend.practice.section', compact('current_section', 'sections', 'lessons', 'tests'));
    }
    public function lesson($id)
    {
        $section_id = Lesson::find($id)->section_id;
        // Lấy thông tin lesson dựa trên ID
        $current_lesson = Lesson::findOrFail($id);
        // Lấy danh sách các lesson (khác lesson hiện tại nhưng cùng section)
        $lessons = Lesson::where('section_id', $section_id)->where('lesson_id', '!=', $id)->get();
        
        $lessons_content = LessonContent::where('lesson_id', $id)->get();

        // Truyền dữ liệu ra view
        return view('frontend.practice.lesson', compact('current_lesson', 'lessons', 'lessons_content'));
        
    }
    public function test($id)
    {
        
    }
}