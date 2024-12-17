<?php

namespace App\Http\Controllers;

use App\Models\Vocabulary;
use Illuminate\Http\Request;
use App\Models\Topic;

class VocabularyController extends Controller
{
    // Hiển thị chi tiết một Vocabulary
    public function showQLVocabulary(Request $request)
    {
        $topic_id = $request->input('topic_id');
    
            $vocabularies = Vocabulary::where('topic_id', $topic_id)->paginate(5);
        return view('backend.vocabularies.index', compact('vocabularies', 'topic_id'));
    }
    public function showVocabulariesByTopic(Request $request, $id)
    {
        // Lấy danh sách từ vựng theo topic_id
        $vocabularies = Vocabulary::where('topic_id', $id)->paginate(1); // Assuming you're paginating by 1 vocabulary per page
        $vocabulary = $vocabularies->first(); // Get the first vocabulary if exists
        $topic=Topic::find($id);

        // Return the view with the necessary data
        return view('frontend.skill.flashcards', [
            'vocabulary' => $vocabulary,
            'vocabularies' => $vocabularies,  // Pass $vocabularies for pagination controls
            'currentPage' => $vocabularies->currentPage(),
            'totalPages' => $vocabularies->lastPage(),
            'topic' => $topic
        ]);
    }    
    
    public function getVocabularyPage($topic_id, $page)
    {
        // Fetch paginated vocabularies
        $vocabularies = Vocabulary::where('topic_id', $topic_id)->paginate(1, ['*'], 'page', $page);
        $vocabulary = $vocabularies->first(); // Get the first vocabulary of the current page
    
        // Return the partial view for updating flashcards
        return view('frontend.skill.flashcard_partial', compact('vocabulary', 'vocabularies'));
    }
    
    // Xử lý việc lưu vocabulary mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        $request->validate([
            'topic_id' => 'required|int',
            'word'	=> 'required|string|max:255',
            'ipa'=> 'required|string|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg', // Thêm kiểm tra kích thước ảnh
            'meaning'=> 'required|string|max:1024',
            'example_sentence'=> 'required|string|max:1024',
        ]);
        // Lưu ảnh vào thư mục public/storage/images
        $imagePath = $request->file('image')->store('images', 'public');

        Vocabulary::create([
            'topic_id' => $request->topic_id,
            'word'	=> $request->word,
            'ipa'=> $request->ipa,
            'image' => $imagePath,
            'meaning'=> $request->meaning,
            'example_sentence'=> $request->example_sentence
        ]);

        // Vocabulary::create($request->all());
        $topic_id = $request->input('topic_id');
        return redirect()->route('qlvocabulary', ['topic_id' => $topic_id])->with('success', 'Vocabulary created successfully!');
    }

    // Hiển thị form chỉnh sửa Vocabulary
    public function edit($id)
    {
        $vocabulary = Vocabulary::findOrFail($id);
        return view('backend.vocabularies.edit', compact('vocabulary'));
    }

    // Xử lý việc cập nhật vocabulary trong cơ sở dữ liệu
    public function update(Request $request, $id)
    {
        $vocabulary = Vocabulary::findOrFail($id);
    
        $request->validate([
            'word' => 'required|string|max:255',
            'ipa' => 'required|string|max:255',
            'meaning' => 'required|string|max:1024',
            'example_sentence' => 'required|string|max:1024',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg', // Kiểm tra nếu có ảnh mới
        ]);
        // Nếu có ảnh mới, cập nhật ảnh
        if ($request->hasFile('image')) {
            // Kiểm tra và xóa ảnh cũ nếu tồn tại
            if ($vocabulary->image && Storage::disk('public')->exists($vocabulary->image)) {
                Storage::disk('public')->delete($vocabulary->image);
            }
            // Lưu ảnh mới và cập nhật thông tin ảnh
            $imagePath = $request->file('image')->store('images', 'public');
            $vocabulary->image = $imagePath;
        }
    
        $vocabulary->update([
            'word' => $request->word, 
            'ipa' => $request->ipa, 
            'meaning' => $request->meaning, 
            'example_sentence' => $request->example_sentence, 
        ]);
    
        // Lấy topic_id từ request để chuyển hướng về đúng trang
        $topic_id = $request->input('topic_id');
        return redirect()->route('qlvocabulary', ['topic_id' => $topic_id])->with('success', 'Vocabulary updated successfully!');
    }
    

    // Xóa một vocabulary khỏi cơ sở dữ liệu
    public function destroy(Vocabulary $vocabulary, Request $request)
    {
        // Xóa vocabulary
        $vocabulary->delete();
    
        // Lấy topic_id từ URL để chuyển hướng về đúng topic
        $topicId = $request->input('topic_id');
    
        // Chuyển hướng về trang qlvocabulary với topic_id
        return redirect()->route('qlvocabulary', ['topic_id' => $topicId])
                         ->with('success', 'Vocabulary deleted successfully!');
    }
}
