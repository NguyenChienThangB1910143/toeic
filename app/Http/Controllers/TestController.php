<?php

namespace App\Http\Controllers;

use App\Models\Test;
use Illuminate\Http\Request;

class TestController extends Controller
{
    // Hiển thị chi tiết một test
    public function showQLTest(Request $request)
    {
        $section_id = $request->input('section_id');
    
        if ($section_id) {
            $tests = Test::where('section_id', $section_id)->paginate(5);
        } else {
            $tests = Test::paginate(5);
        }
    
        return view('backend.tests.index', compact('tests', 'section_id'));
    }
    

    // Xử lý việc lưu test mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        $request->validate([
            'section_id' => 'required|int',
            'name' => 'required|string|max:255',
        ]);
        Test::create([
            'name' => $request->name,
            'section_id' => $request->section_id,
        ]);

        // test::create($request->all());
        $section_id = $request->input('section_id');
        return redirect()->route('qltest', ['section_id' => $section_id])->with('success', 'Test created successfully!');
    }

    // Hiển thị form chỉnh sửa test
    public function edit($id)
    {
        $test = Test::findOrFail($id);
        return view('backend.tests.edit', compact('test'));
    }

    // Xử lý việc cập nhật test trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        $test = Test::findOrFail($id);
    
        $request->validate([
            'name' => 'required|string|max:255',
        ]);
    
        $test->update([
            'name' => $request->name,
        ]);
    
        // Lấy section_id từ request để chuyển hướng về đúng trang
        $section_id = $request->input('section_id');
        return redirect()->route('qltest', ['section_id' => $section_id])->with('success', 'Test updated successfully!');
    }
    

    // Xóa một test khỏi cơ sở dữ liệu
    public function destroy(Test $test, Request $request)
    {
        // Xóa test
        $test->delete();
    
        // Lấy section_id từ URL để chuyển hướng về đúng section
        $sectionId = $request->input('section_id');
    
        // Chuyển hướng về trang qltest với section_id
        return redirect()->route('qltest', ['section_id' => $sectionId])
                         ->with('success', 'Test deleted successfully!');
    }
    
    
}
