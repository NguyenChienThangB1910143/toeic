<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Grammar;
use Illuminate\Support\Facades\Storage;

class GrammarController extends Controller
{
    public function showQLGrammar()
    {
        $grammars = Grammar::paginate(5);
        return view('backend.grammars.index', compact('grammars'));
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
