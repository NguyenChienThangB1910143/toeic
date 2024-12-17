<?php

namespace App\Http\Controllers;

use App\Models\GrammarContent;
use Illuminate\Http\Request;

class GrammarContentController extends Controller
{
    // Hiển thị chi tiết một grammar
    public function showQLGrammarContent(Request $request)
    {
        $grammar_id = $request->input('grammar_id');
    
        if ($grammar_id) {
            $grammar_contents = GrammarContent::where('grammar_id', $grammar_id)->paginate(5);
        } else {
            $grammar_contents = GrammarContent::paginate(5);
        }
    
        return view('backend.grammars_contents.index', compact('grammar_contents', 'grammar_id'));
    }
    

    // Xử lý việc lưu grammar_content mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        $request->validate([
            'grammar_id' => 'required|int',
            'title' => 'required|string|max:255',
            'content' => 'nullable|string',
        ]);
        GrammarContent::create([
            'title' => $request->title,
            'grammar_id' => $request->grammar_id,
            'content' => $request->content
        ]);

        $grammar_id = $request->input('grammar_id');
        return redirect()->route('qlgrammar_content', ['grammar_id' => $request->grammar_id])->with('success', 'Content created successfully!');
     }

    // Hiển thị form chỉnh sửa grammar_content
    public function edit($id)
    {
        $grammar_content = GrammarContent::findOrFail($id);
        return view('backend.grammars_contents.edit', compact('grammar_content'));
    }

    // Xử lý việc cập nhật grammar_content trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        $grammar_content = GrammarContent::findOrFail($id);
    
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'nullable|string',
        ]);
    
        $grammar_content->update([
            'title' => $request->title,
            'content' => $request->content
        ]);
    
        // Lấy grammar_id từ request để chuyển hướng về đúng trang
        $grammar_id = $request->input('grammar_id');
        return redirect()->route('qlgrammar_content', ['grammar_id' => $request->grammar_id])->with('success', 'Content updated successfully!');
    }
    
    // Xóa một grammar_content khỏi cơ sở dữ liệu
    public function destroy(GrammarContent $grammar_content, Request $request)
    {
        // Xóa grammar_content
        $grammar_content->delete();
    
        // Lấy grammar_id từ URL để chuyển hướng về đúng grammar
        $grammarId = $request->input('grammar_id');
    
        // Chuyển hướng về trang qlgrammar_content với grammar_id
        return redirect()->route('qlgrammar_content', ['grammar_id' => $grammarId])
                         ->with('success', 'Content deleted successfully!');
    }
}
