<?php

namespace App\Http\Controllers;

use App\Models\SectionQuestion;
use App\Models\Section;
use App\Models\QuestionGroup;
use Illuminate\Http\Request;

class SectionQuestionController extends Controller
{
    // Hiển thị chi tiết một question
    public function showQLSectionQuestion(Request $request)
{
    $section_id = $request->input('section_id'); // Lấy section_id từ request
    $type = $request->input('type'); // Lấy type từ request

    // Lấy danh sách câu hỏi dựa trên section_id và type (nếu cần)
    $questions = SectionQuestion::where('section_id', $section_id);

    $questions = $questions->paginate(5);
    if ($type=="part_1") {
        return view('backend.section_questions.part_1.index1', compact('questions', 'section_id', 'type'));
    }elseif ($type=="part_2") {
        return view('backend.section_questions.part_2.index2', compact('questions', 'section_id', 'type'));
    }elseif ($type=="part_3") {
        return view('backend.section_questions.part_3.index3', compact('questions', 'section_id', 'type'));
    }elseif ($type=="part_4") {
        return view('backend.section_questions.part_4.index4', compact('questions', 'section_id', 'type'));    
    }elseif ($type=="part_5") {
        return view('backend.section_questions.part_5.index5', compact('questions', 'section_id', 'type'));
    }elseif ($type=="part_6") {
        return view('backend.section_questions.part_6.index6', compact('questions', 'section_id', 'type'));
    }elseif ($type=="part_7") {
        return view('backend.section_questions.part_7.index7', compact('questions', 'section_id', 'type'));
    }
}

    

    // Xử lý việc lưu question trong cơ sở dữ liệu
    public function store(Request $request)
    {
        // Lấy section_id từ request
        $section = $request->input('section_id');
        
        // Tìm thông tin type từ table Section (dựa vào section_id)
        $sectionData = Section::find($section);
        $type = $sectionData ? $sectionData->type : null;

        if ($type=="part_1") {
            
            // Validate dữ liệu
            $request->validate([
                'section_id' => 'required|int',
                'content' => 'required|string',
                'option1' => 'required|string',
                'option2' => 'required|string',
                'option3' => 'required|string',
                'option4' => 'required|string',
                'correct_option' => 'required|in:A,B,C,D',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'audio' => 'nullable|mimes:mp3,wav',
            ]);
    
            // Xử lý ảnh nếu có
            $imagePath = null;
            if ($request->hasFile('image')) {
                $imagePath = $request->file('image')->store('questions/images', 'public');
            }
    
            // Xử lý audio nếu có
            $audioPath = null;
            if ($request->hasFile('audio')) {
                $audioPath = $request->file('audio')->store('questions/audio', 'public');
            }
    
            // Tạo câu hỏi mới
            $question = SectionQuestion::create([
                'content' => $request->input('content'),
                'option1' => $request->input('option1'),
                'option2' => $request->input('option2'),
                'option3' => $request->input('option3'),
                'option4' => $request->input('option4'),
                'correct_option' => $request->input('correct_option'),
                'image' => $imagePath,
                'audio' => $audioPath,
                'section_id' => $request->input('section_id'), // Truyền section_id từ form
            ]);
            // Redirect về trang showQLSectionQuestion với section_id và type
            return redirect()->route('qlsection_question', ['section_id' => $section, 'type' => $type])
                            ->with('success', 'Question đã được thêm thành công.');
        }
        elseif ($type=="part_2") {
            // Validate dữ liệu
            $request->validate([
                'section_id' => 'required|int',
                'content' => 'required|string',
                'option1' => 'required|string',
                'option2' => 'required|string',
                'option3' => 'required|string',
                'correct_option' => 'required|in:A,B,C',
                'audio' => 'nullable|mimes:mp3,wav',
            ]);
            // Xử lý audio nếu có
            $audioPath = null;
            if ($request->hasFile('audio')) {
                $audioPath = $request->file('audio')->store('questions/audio', 'public');
            }
    
            // Tạo câu hỏi mới
            $question = SectionQuestion::create([
                'content' => $request->input('content'),
                'option1' => $request->input('option1'),
                'option2' => $request->input('option2'),
                'option3' => $request->input('option3'),
                'correct_option' => $request->input('correct_option'),
                'audio' => $audioPath,
                'section_id' => $request->input('section_id'), // Truyền section_id từ form
            ]);
            return redirect()->route('qlsection_question', ['section_id' => $section, 'type' => $type])
                            ->with('success', 'Question added successfully!');
        }
        elseif ($type == "part_3") {
            // Validate dữ liệu
            $request->validate([
                'section_id' => 'required|int',
                'audio' => 'nullable|mimes:mp3,wav',
                'questions' => 'required|array|min:3|max:3',
                'questions.*.content' => 'required|string',
                'questions.*.option1' => 'required|string',
                'questions.*.option2' => 'required|string',
                'questions.*.option3' => 'required|string',
                'questions.*.correct_option' => 'required|in:A,B,C',
            ]);
        
            // Xử lý audio nếu có
            $audioPath = null;
            if ($request->hasFile('audio')) {
                $audioPath = $request->file('audio')->store('questions/audio', 'public');
            }
        
            // Tạo một QuestionGroup mới
            $questionGroup = QuestionGroup::create([
                'audio' => $audioPath,
                // Các cột khác trong bảng QuestionGroup có thể để null nếu không được nhập
                'image' => null,
                'passage' => null,
                'script' => null,
                'text' => null,
            ]);
        
            // Lặp qua từng câu hỏi để lưu vào SectionQuestion
            foreach ($request->input('questions') as $questionData) {
                SectionQuestion::create([
                    'content' => $questionData['content'],
                    'option1' => $questionData['option1'],
                    'option2' => $questionData['option2'],
                    'option3' => $questionData['option3'],
                    'correct_option' => $questionData['correct_option'],
                    'section_id' => $request->input('section_id'),
                    'question_group_id' => $questionGroup->question_group_id, // Gắn group_id vào câu hỏi
                ]);
            }
        
            // Chuyển hướng về trang quản lý câu hỏi
            return redirect()->route('qlsection_question', ['section_id' => $section, 'type' => $type])
                             ->with('success', '3 câu hỏi đã được thêm thành công cho Part 3.');
        }
        
        
        elseif ($type=="part_4") {
            // Validate dữ liệu
            $request->validate([
                'section_id' => 'required|int',
                'audio' => 'nullable|mimes:mp3,wav',
                'questions' => 'required|array|min:3|max:3',
                'questions.*.content' => 'required|string',
                'questions.*.option1' => 'required|string',
                'questions.*.option2' => 'required|string',
                'questions.*.option3' => 'required|string',
                'questions.*.option4' => 'required|string',
                'questions.*.correct_option' => 'required|in:A,B,C,D',
            ]);
        
            // Xử lý audio nếu có
            $audioPath = null;
            if ($request->hasFile('audio')) {
                $audioPath = $request->file('audio')->store('questions/audio', 'public');
            }
        
            // Tạo một QuestionGroup mới
            $questionGroup = QuestionGroup::create([
                'audio' => $audioPath,
                // Các cột khác trong bảng QuestionGroup có thể để null nếu không được nhập
                'image' => null,
                'passage' => null,
                'script' => null,
                'text' => null,
            ]);
        
            // Lặp qua từng câu hỏi để lưu vào SectionQuestion
            foreach ($request->input('questions') as $questionData) {
                SectionQuestion::create([
                    'content' => $questionData['content'],
                    'option1' => $questionData['option1'],
                    'option2' => $questionData['option2'],
                    'option3' => $questionData['option3'],
                    'option4' => $questionData['option4'],
                    'correct_option' => $questionData['correct_option'],
                    'section_id' => $request->input('section_id'),
                    'question_group_id' => $questionGroup->question_group_id, // Gắn group_id vào câu hỏi
                ]);
            }
        
            // Chuyển hướng về trang quản lý câu hỏi
            return redirect()->route('qlsection_question', ['section_id' => $section, 'type' => $type])
                             ->with('success', '3 câu hỏi đã được thêm thành công cho Part 4.');
        }
        elseif ($type=="part_5") {
            return redirect()->route('qlsection_question', ['section_id' => $section, 'type' => $type])
                            ->with('success', 'Question added successfully!');
        }
        elseif ($type=="part_6") {
            return redirect()->route('qlsection_question', ['section_id' => $section, 'type' => $type])
                            ->with('success', 'Question added successfully!');
        }
        elseif ($type=="part_7") {
            return redirect()->route('qlsection_question', ['section_id' => $section, 'type' => $type])
                            ->with('success', 'Question added successfully!');
        }
    }



// Hiển thị form chỉnh sửa question
public function edit($question_id)
{
    $question = SectionQuestion::find($question_id);

    if (!$question) {
        return response()->json(['error' => 'Câu hỏi không tồn tại.'], 404);
    }

    return response()->json($question);
}


public function update(Request $request, $question_id)
{
    $question = SectionQuestion::find($question_id);

    if (!$question) {
        return redirect()->route('qlsection_question', [
            'section_id' => $request->section_id, 
            'type' => $request->type
        ])->with('error', 'Câu hỏi không tồn tại.');
    }
    if($request->type=="part_1") {
        
        $request->validate([
            'content' => 'required|string',
            'option1' => 'required|string',
            'option2' => 'required|string',
            'option3' => 'required|string',
            'option4' => 'required|string',
            'correct_option' => 'required|in:A,B,C,D',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'audio' => 'nullable|mimes:mp3,wav',
        ]);
    
        $question->content = $request->input('content');
        $question->option1 = $request->input('option1');
        $question->option2 = $request->input('option2');
        $question->option3 = $request->input('option3');
        $question->option4 = $request->input('option4');
        $question->correct_option = $request->input('correct_option');
    
        if ($request->hasFile('image')) {
            if ($question->image) {
                Storage::delete('public/' . $question->image);
            }
            $question->image = $request->file('image')->store('questions/images', 'public');
        }
    
        if ($request->hasFile('audio')) {
            if ($question->audio) {
                Storage::delete('public/' . $question->audio);
            }
            $question->audio = $request->file('audio')->store('questions/audio', 'public');
        }
    
        $question->save();
    
        return redirect()->route('qlsection_question', [
            'section_id' => $request->section_id, 
            'type' => $request->type
        ])->with('success', 'Question updated successfully!');
    }
    elseif($request->type=="part_2") {
        $request->validate([
            'content' => 'required|string',
            'option1' => 'required|string',
            'option2' => 'required|string',
            'option3' => 'required|string',
            'correct_option' => 'required|in:A,B,C',
            'audio' => 'nullable|mimes:mp3,wav',
        ]);
    
        $question->content = $request->input('content');
        $question->option1 = $request->input('option1');
        $question->option2 = $request->input('option2');
        $question->option3 = $request->input('option3');
        $question->correct_option = $request->input('correct_option');

    
        if ($request->hasFile('audio')) {
            if ($question->audio) {
                Storage::delete('public/' . $question->audio);
            }
            $question->audio = $request->file('audio')->store('questions/audio', 'public');
        }
    
        $question->save();
    
        return redirect()->route('qlsection_question', [
            'section_id' => $request->section_id, 
            'type' => $request->type
        ])->with('success', 'Question updated successfully!');
    }
    elseif($request->type=="part_3") {
        $request->validate([
            'content' => 'required|string',
            'option1' => 'required|string',
            'option2' => 'required|string',
            'option3' => 'required|string',
            'correct_option' => 'required|in:A,B,C',
        ]);
    
        $question->content = $request->input('content');
        $question->option1 = $request->input('option1');
        $question->option2 = $request->input('option2');
        $question->option3 = $request->input('option3');
        $question->correct_option = $request->input('correct_option');
    
        $question->save();
    
        return redirect()->route('qlsection_question', [
            'section_id' => $request->section_id, 
            'type' => $request->type
        ])->with('success', 'Question updated successfully!');
    }
    elseif($request->type=="part_4") {
        $request->validate([
            'content' => 'required|string',
            'option1' => 'required|string',
            'option2' => 'required|string',
            'option3' => 'required|string',
            'option4' => 'required|string',
            'correct_option' => 'required|in:A,B,C,D',
        ]);
    
        $question->content = $request->input('content');
        $question->option1 = $request->input('option1');
        $question->option2 = $request->input('option2');
        $question->option3 = $request->input('option3');
        $question->option4 = $request->input('option4');
        $question->correct_option = $request->input('correct_option');
    
        $question->save();
    
        return redirect()->route('qlsection_question', [
            'section_id' => $request->section_id, 
            'type' => $request->type
        ])->with('success', 'Question updated successfully!');
    }
}



public function destroy($id, Request $request)
{
    $question = SectionQuestion::findOrFail($id);  // Sử dụng findOrFail

    // Xóa câu hỏi
    $question->delete();

    \Log::info("Deleted question with ID: " . $id);

    return redirect()->route('qlsection_question', [
        'section_id' => $request->section_id, 
        'type' => $request->type
    ])->with('success', 'Question deleted successfully!');
}





}