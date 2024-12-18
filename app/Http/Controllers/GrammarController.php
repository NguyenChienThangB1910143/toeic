<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Grammar;
use App\Models\GrammarContent;
use Illuminate\Support\Facades\Storage;

class GrammarController extends Controller
{
    public function showQLGrammar()
    {
        $grammars = Grammar::paginate(5);
        return view('backend.grammars.index', compact('grammars'));
    }
    public function showGrammars()
    {
        // Lấy tất cả grammar từ database
        $grammars = Grammar::all(); 

        // Trả về view với dữ liệu
        return view('frontend.skill.grammar', compact('grammars'));
    }
    public function grammarContent($grammar_id)
    {
        // Lấy Grammar hiện tại
        $current_grammar = Grammar::findOrFail($grammar_id);
    
        // Lấy các grammar khác
        $grammars = Grammar::where('grammar_id', '!=', $grammar_id)->get();
    
        // Lấy nội dung của grammar hiện tại
        $grammars_content = GrammarContent::where('grammar_id', $grammar_id)->get();
    
        // Truyền dữ liệu ra view
        return view('frontend.skill.grammar-content', compact('current_grammar', 'grammars', 'grammars_content'));
    }
    

    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        //tạo mới grammar
        Grammar::create([
            'name' => $request->name,
        ]);

        return redirect()->route('qlgrammar')->with('success', 'Grammar created successfully.');
    }

    public function edit($id)
    {
        $grammar = Grammar::findOrFail($id);
        return view('backend.grammars.edit', compact('grammars'));    
    }

    public function update(Request $request, $id)
    {
        //Tìm grammar theo ID
        $grammar = Grammar::findOrFail($id);

        // Validate dữ liệu đầu vào
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $grammar->update([
            'name' => $request->name,
        ]);

        return redirect()->route('qlgrammar')->with('success', 'Grammar updated successfully.');
    }

    // Xóa grammar
    public function destroy($id)
    {
        $grammar = Grammar::findOrFail($id);
        $grammar->delete();

        return redirect()->route('qlgrammar')->with('success', 'Grammar deleted successfully.');
    }
    
}
