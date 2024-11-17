<?php
namespace App\Http\Controllers;

use App\Models\Section;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Lesson;
use App\Models\SectionQuestion;

class SectionController extends Controller
{
    // Hiển thị danh sách các section
    public function showQLSection()
    {
        // Lấy tất cả các sections, phân trang 5 mục một trang
        $sections = Section::paginate(5);

        return view('backend.sections.index', compact('sections'));
    }

    // Hiển thị form thêm câu hỏi theo Section
    public function addSectionQuestionForm($section_id)
    {
        $section = Section::findOrFail($section_id);
        return view('backend.section_questions.add', compact('section'));
    }
    private function uploadFile(Request $request, $field, $folder)
    {
        if ($request->hasFile($field)) {
            return $request->file($field)->store($folder, 'public');
        }
        return null;
    }

    // Lưu câu hỏi mới vào Section
    public function storeSectionQuestion(Request $request, $section_id)
    {
        $section = Section::findOrFail($section_id);

        $request->validate([
            'content' => 'nullable|string',
            'question_group_id' => 'required|exists:question_groups,id',
            'optA' => 'nullable|string',
            'optB' => 'nullable|string',
            'optC' => 'nullable|string',
            'optD' => 'nullable|string',
            'audio' => 'nullable|url', // Áp dụng cho Listening
            'image' => 'nullable|url', // Áp dụng cho phần 1
            'text' => 'nullable|string',  // Áp dụng cho Reading
            'script' => 'nullable|string',
            'correct_option' => 'nullable|string',
        ]);
        $imagePath = $this->uploadFile($request, 'image', 'questions/images');
        $audioPath = $this->uploadFile($request, 'audio', 'questions/audios');
        Question::create([
            'section_id' => $section_id,
            'question_group_id' => $request->question_group_id,
            'content' => $request->content,
            'optA' => $request->optA,
            'optB' => $request->optB,
            'optC' => $request->optC,
            'optD' => $request->optD,
            'text' => $request->text,
            'audio' => $audioPath,
            'image' => $imagePath,
            'script' => $request->script,
            'correct_option' => $request->correct_option,
        ]);

        return redirect()->route('sections.show', $section_id)->with('success', 'Câu hỏi đã được thêm!');
    }

    // Lưu section mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg', // Thêm kiểm tra kích thước ảnh
            'description' => 'required|string',
            'type' => 'required|string',
        ]);

        // Lưu ảnh vào thư mục public/storage/images
        $imagePath = $request->file('image')->store('images', 'public');

        // Tạo mới section
        Section::create([
            'name' => $request->name,
            'image' => $imagePath,
            'description' => $request->description,
            'type' => $request->type,
        ]);

        // Redirect với thông báo thành công
        return redirect()->route('qlsection')->with('success', 'Section added successfully!');
    }

    // Hiển thị form chỉnh sửa section
    public function edit($id)
    {
        // Lấy section cần chỉnh sửa
        $section = Section::findOrFail($id);
        return response()->json($section);

        // return view('backend.sections.edit', compact('section'));
    }

    // Cập nhật thông tin section
    public function update(Request $request, $id)
    {
        // Tìm section theo ID
        $section = Section::findOrFail($id);

        // Validate dữ liệu đầu vào
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'type' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg', // Kiểm tra nếu có ảnh mới
        ]);

        // Nếu có ảnh mới, cập nhật ảnh
        if ($request->hasFile('image')) {
            // Kiểm tra và xóa ảnh cũ nếu tồn tại
            if ($section->image) {
                Storage::disk('public')->delete($section->image);
            }
            // Lưu ảnh mới và cập nhật thông tin ảnh
            $imagePath = $request->file('image')->store('sections', 'public');
            $section->image = $imagePath;
        }
        // Cập nhật các trường còn lại
        $section->name = $request->name;
        $section->type = $request->type;
        $section->description = $request->description;
        $section->save();
        // // Cập nhật các thông tin khác
        // $section->update([
        //     'name' => $request->name,
        //     'description' => $request->description,
        //     'type' => $request->type,
        // ]);

        return redirect()->route('qlsection')->with('success', 'Section updated successfully!');
    }

    // Xóa một section

    public function destroy($id)
    {
        // Tìm section theo ID
        $section = Section::findOrFail($id);
    
        // Kiểm tra nếu tồn tại lesson liên kết với section
        if (Lesson::where('section_id', $section->section_id)->exists()) {
            return redirect()->route('qlsection')
                ->with('error', 'Không thể xóa section vì vẫn còn lesson liên kết.');
        }
        // Kiểm tra nếu tồn tại question liên kết với section
        if (SectionQuestion::where('section_id', $section->section_id)->exists()) {
            return redirect()->route('qlsection')
                ->with('error', 'Không thể xóa section vì vẫn còn question liên kết.');
        }
        // Kiểm tra nếu tồn tại test liên kết với section
        if (Test::where('section_id', $section->section_id)->exists()) {
            return redirect()->route('qlsection')
                ->with('error', 'Không thể xóa section vì vẫn còn test liên kết.');
        }
        // Kiểm tra và xóa ảnh nếu tồn tại
        if ($section->image ) {
            Storage::disk('public')->delete($section->image);
        }
    
        // Xóa section khỏi cơ sở dữ liệu
        $section->delete();
    
        return redirect()->route('qlsection')->with('success', 'Section deleted successfully!');
    }
    // Tìm kiếm section
    public function search(Request $request)
    {
        $keyword = $request->input('keyword');
        $sections = Section::where('name', 'LIKE', "%{$keyword}%")->get();

        return response()->json($sections); // Trả về dữ liệu dạng JSON
    }
}
