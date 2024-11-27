<?php

namespace App\Http\Controllers;

use App\Models\Section;
use App\Models\Lesson;
use App\Models\SectionQuestion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SectionController extends Controller
{
    // Hiển thị danh sách sections (phân trang)
    public function showQLSection()
    {
        $sections = Section::paginate(5);
        return view('backend.sections.index', compact('sections'));
    }

    // Thêm mới section
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
            'description' => 'required|string',
            'type' => 'required|string',
        ]);

        try {
            $imagePath = $request->file('image')->store('images', 'public');
            Section::create([
                'name' => $validated['name'],
                'image' => $imagePath,
                'description' => $validated['description'],
                'type' => $validated['type'],
            ]);
            return redirect()->route('qlsection')->with('success', 'Section added successfully!');
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Failed to add section: ' . $e->getMessage()]);
        }
    }

    // Hiển thị thông tin chỉnh sửa section
    public function edit($id)
    {
        try {
            $section = Section::findOrFail($id);
            return response()->json($section);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Section not found.'], 404);
        }
    }

    // Cập nhật thông tin section
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'type' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        try {
            $section = Section::findOrFail($id);

            if ($request->hasFile('image')) {
                if ($section->image) {
                    Storage::disk('public')->delete($section->image);
                }
                $imagePath = $request->file('image')->store('images', 'public');
                $section->image = $imagePath;
            }

            $section->update([
                'name' => $validated['name'],
                'description' => $validated['description'],
                'type' => $validated['type'],
            ]);

            return redirect()->route('qlsection')->with('success', 'Section updated successfully!');
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Failed to update section: ' . $e->getMessage()]);
        }
    }

    // Xóa section
    public function destroy($id)
    {
        try {
            $section = Section::findOrFail($id);

            // Kiểm tra liên kết với Lesson, SectionQuestion, hoặc Test
            if (
                Lesson::where('section_id', $section->section_id)->exists() ||
                SectionQuestion::where('section_id', $section->section_id)->exists()
            ) {
                return redirect()->route('qlsection')
                    ->with('error', 'Cannot delete section as it is linked with other data.');
            }

            // Xóa ảnh nếu tồn tại
            if ($section->image) {
                Storage::disk('public')->delete($section->image);
            }

            $section->delete();
            return redirect()->route('qlsection')->with('success', 'Section deleted successfully!');
        } catch (\Exception $e) {
            return redirect()->route('qlsection')->with('error', 'Failed to delete section: ' . $e->getMessage());
        }
    }

    // Tìm kiếm section
    public function search(Request $request)
    {
        $keyword = $request->input('keyword');
        $sections = Section::where('name', 'LIKE', "%{$keyword}%")->paginate(5);

        return response()->json($sections);
    }
}
