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
        $materials = Material::paginate(5); 

        return view('backend.materials.index', compact('materials'));
    }

    public function showMaterials()
    {
        // Lấy tất cả tài liệu từ cơ sở dữ liệu
        $materials = Material::all();  // Hoặc paginate() nếu cần phân trang
        return view('frontend.material.material', compact('materials')); // Truyền 'materials' vào view
    }

    // Lưu material mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        // Xác thực dữ liệu đầu vào
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'file_pdf' => 'required|mimes:pdf', 
        ]);

        // Lưu file PDF vào thư mục 'materials' trên storage và lấy đường dẫn
        $filePath = $request->file('file_pdf')->store('materials', 'public');

        // Tạo material mới trong cơ sở dữ liệu
        Material::create([
            'title' => $request->title,
            'description' => $request->description,
            'file_pdf' => $filePath, // Lưu đường dẫn file PDF vào cơ sở dữ liệu
        ]);

        return redirect()->route('qlmaterial')->with('success', 'Material created successfully!');
    }

    // Hiển thị form chỉnh sửa material
    public function edit($id)
    {
        $material = Material::findOrFail($id);
        return response()->json($material);  // Trả về dữ liệu dạng JSON
    }

    // Cập nhật material trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        $material = Material::findOrFail($id);
        
        // Cập nhật thông tin của material
        $material->title = $request->input('title');
        $material->description = $request->input('description');

        // Nếu có file mới, lưu file mới và xóa file cũ
        if ($request->hasFile('file_pdf')) {
            // Xóa file cũ nếu có
            if ($material->file_pdf) {
                Storage::disk('public')->delete($material->file_pdf);
            }

            // Lưu file mới
            $file = $request->file('file_pdf');
            $path = $file->store('materials', 'public');
            $material->file_pdf = $path; // Cập nhật đường dẫn file mới vào cơ sở dữ liệu
        }

        $material->save();

        return redirect()->route('qlmaterial')->with('success', 'Material cập nhật thành công!');
    }

    // Xóa material khỏi cơ sở dữ liệu
    public function destroy($id)
    {
        $material = Material::findOrFail($id); // Tìm material theo id

        // Xóa file PDF nếu có
        if ($material->file_pdf) {
            Storage::disk('public')->delete($material->file_pdf);
        }

        // Xóa material khỏi cơ sở dữ liệu
        $material->delete();

        return redirect()->route('qlmaterial')->with('success', 'Material deleted successfully!');
    }
}
