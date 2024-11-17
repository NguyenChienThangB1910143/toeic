<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Material;
use Illuminate\Support\Facades\Storage;

class MaterialController extends Controller
{
    // Danh sách các materials
    public function showQLMaterial()
    {
        $materials = Material::all();
        return view('backend.materials.index', compact('materials'));
    }

    // Hiển thị form tạo material mới
    public function create()
    {
        return view('backend.materials.create');
    }

    // Lưu material mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'file_pdf' => 'required|mimes:pdf|max:10240', // 10MB max
        ]);

        $filePath = $request->file('file_pdf')->store('materials', 'public');

        Material::create([
            'title' => $request->title,
            'description' => $request->description,
            'file_pdf' => $filePath,
        ]);

        return redirect()->route('qlmaterial')->with('success', 'Material created successfully!');
    }

    // Hiển thị form chỉnh sửa material
    public function edit($id)
    {
        $material = Material::findOrFail($id);
        return view('backend.materials.edit', compact('material'));
    }

    // Cập nhật material trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'file_pdf' => 'nullable|mimes:pdf|max:10240', // 10MB max
        ]);

        $material = Material::findOrFail($id);

        if ($request->hasFile('file_pdf')) {
            // Xóa file cũ nếu tồn tại
            if ($material->file_pdf) {
                Storage::disk('public')->delete($material->file_pdf);
            }

            // Lưu file PDF mới
            $filePath = $request->file('file_pdf')->store('materials', 'public');
            $material->file_pdf = $filePath;
        }

        $material->update([
            'title' => $request->title,
            'description' => $request->description,
            'file_pdf' => $material->file_pdf,
        ]);

        return redirect()->route('qlmaterial')->with('success', 'Material updated successfully!');
    }

    // Xóa material khỏi cơ sở dữ liệu
    public function destroy($id)
    {
        $material = Material::findOrFail($id);
        
        // Xóa file PDF nếu tồn tại
        if ($material->file_pdf) {
            Storage::disk('public')->delete($material->file_pdf);
        }
        
        $material->delete();

        return redirect()->route('qlmaterial')->with('success', 'Material deleted successfully!');
    }
}
