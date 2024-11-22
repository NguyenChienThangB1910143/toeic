<?php

namespace App\Http\Controllers;

use App\Models\SectionQuestion;
use Illuminate\Http\Request;

class SectionQuestionController extends Controller
{
    // Hiển thị chi tiết một question
    public function showQLSectionQuestion(Request $request)
    {
        $section_id = $request->input('section_id'); // Lấy section_id từ request
        $types = [
            '[Part 1] Tranh tả người', 
            '[Part 1] Tranh tả vật', 
            '[Part 1] Tranh tả người và vật',
            '[Part 2] Câu hỏi đuôi', 
            '[Part 2] Câu hỏi Yes/No',
            '[Part 2] Câu hỏi trần thuật',
            '[Part 3] Chi tiết cuộc hội thoại',
            '[Part 3] Danh tính người nói', 
            '[Part 3] Chủ đề, mục đích', 
            '[Part 3] Địa điểm hội thoại',
            '[Part 4] Câu hỏi trần thuật',
            
        ];

        // Lấy danh sách câu hỏi dựa trên section_id
        $questions = SectionQuestion::where('section_id', $section_id)->paginate(5);
        return view('backend.section_questions.index', compact('questions', 'section_id', 'types'));
    }
    

    // Xử lý việc lưu question trong cơ sở dữ liệu
    public function store(Request $request)
    {
        $validated = $request->validate([
            'section_id' => 'required|exists:sections,id',
            'question_group_id' => 'required|exists:question_groups,id',
            'content' => 'required|string',
            'optA' => 'required|string',
            'optB' => 'required|string',
            'optC' => 'required|string',
            'optD' => 'required|string',
            'correctOpt' => 'required|string',
            'type' => 'required|string',
            'image' => 'nullable|image',
            'audio' => 'nullable|mimes:mp3,wav',
            'text' => 'nullable|string',
            'script' => 'nullable|string',
        ]);

        // Xử lý upload file
        if ($request->hasFile('image')) {
            $validated['image'] = $request->file('image')->store('images', 'public');
        }
        if ($request->hasFile('audio')) {
            $validated['audio'] = $request->file('audio')->store('audios', 'public');
        }

        SectionQuestion::create($validated);

        return redirect()->route('qlsectionquestion', ['section_id' => $request->section_id])
                        ->with('success', 'Question created successfully!');
    }


    // Hiển thị form chỉnh sửa lesson
    public function edit($id)
    {
        // Lấy question theo ID
        $question = SectionQuestion::findOrFail($id);
    
        // Trả về view với dữ liệu của question
        return response()->json([
            'question' => $question
        ]);
    }
    

    // Xử lý việc cập nhật lesson trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        // Validate dữ liệu
        $validatedData = $request->validate([
            'content' => 'required|string',
            'optA' => 'required|string',
            'optB' => 'required|string',
            'optC' => 'required|string',
            'optD' => 'required|string',
            'correctOpt' => 'required|string|in:A,B,C,D',
            'type' => 'required|string',
            'image' => 'nullable|image',
            'audio' => 'nullable|mimes:mp3,wav',
            'text' => 'nullable|string',
            'script' => 'required|string',
        ]);

        // Lấy question từ DB
        $question = SectionQuestion::findOrFail($id);

        // Cập nhật dữ liệu
        $question->content = $validatedData['content'];
        $question->optA = $validatedData['optA'];
        $question->optB = $validatedData['optB'];
        $question->optC = $validatedData['optC'];
        $question->optD = $validatedData['optD'];
        $question->correctOpt = $validatedData['correctOpt'];
        $question->text = $validatedData['text'];
        $question->type = $validatedData['type'];
        $question->script = $validatedData['script'];

        // Xử lý file upload (nếu có)
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('questions/images', 'public');
            $question->image = $imagePath;
        }

        if ($request->hasFile('audio')) {
            $audioPath = $request->file('audio')->store('questions/audio', 'public');
            $question->audio = $audioPath;
        }

        // Lưu dữ liệu
        $question->save();

        return redirect()->route('qlsectionquestion', ['section_id' => $request->section_id])
                        ->with('success', 'Question updated successfully!');
    }

    // Xóa một lesson khỏi cơ sở dữ liệu
    public function destroy(SectionQuestion $question, Request $request)
    {
        $question->delete();

        return redirect()->route('qlsectionquestion', ['section_id' => $request->section_id])
                        ->with('success', 'Question deleted successfully!');
    }
}