<?php
namespace App\Http\Controllers;

use App\Models\Topic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class TopicController extends Controller
{
    // Hiển thị danh sách các topic
    public function showQLTopic()
    {
        // Lấy tất cả các topics, phân trang 10 mục một trang
        $topics = Topic::paginate(5); 

        return view('backend.topics.index', compact('topics'));
    }

    // Hiển thị form tạo topic mới

    // Lưu topic mới vào cơ sở dữ liệu
    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg', // Thêm kiểm tra kích thước ảnh
        ]);

        // Lưu ảnh vào thư mục public/storage/images
        $imagePath = $request->file('image')->store('images', 'public');

        // Tạo mới topic
        Topic::create([
            'name' => $request->name,
            'image' => $imagePath,
        ]);

        // Redirect với thông báo thành công
        return redirect()->route('qltopic')->with('success', 'Topic added successfully!');
    }

    // Hiển thị form chỉnh sửa topic
    public function edit($id)
    {
        // Lấy topic cần chỉnh sửa
        $topic = Topic::findOrFail($id);
        return view('backend.topics.edit', compact('topic'));
    }

    // Cập nhật thông tin topic
    public function update(Request $request, $id)
    {
        // Tìm topic theo ID
        $topic = Topic::findOrFail($id);

        // Validate dữ liệu đầu vào
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg', // Kiểm tra nếu có ảnh mới
        ]);

        // Nếu có ảnh mới, cập nhật ảnh
        if ($request->hasFile('image')) {
            // Kiểm tra và xóa ảnh cũ nếu tồn tại
            if ($topic->image && Storage::disk('public')->exists($topic->image)) {
                Storage::disk('public')->delete($topic->image);
            }
            // Lưu ảnh mới và cập nhật thông tin ảnh
            $imagePath = $request->file('image')->store('images', 'public');
            $topic->image = $imagePath;
        }

        // Cập nhật các thông tin khác
        $topic->update([
            'name' => $request->name,
        ]);

        return redirect()->route('qltopic')->with('success', 'Topic updated successfully!');
    }

    // Xóa một topic
    public function destroy($id)
    {
        // Tìm và xóa topic
        $topic = Topic::findOrFail($id);

        // Kiểm tra và xóa ảnh nếu tồn tại
        if ($topic->image && Storage::disk('public')->exists($topic->image)) {
            Storage::disk('public')->delete($topic->image);
        }

        // Xóa topic khỏi cơ sở dữ liệu
        $topic->delete();

        return redirect()->route('qltopic')->with('success', 'Topic deleted successfully!');
    }
}
