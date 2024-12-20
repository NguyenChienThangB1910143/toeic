<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Models\Learner;

class LearnerController extends Controller
{
    // Phương thức hiển thị danh sách học viên
    public function showqlLearner()
    {
        $learners = Learner::paginate(5);
        return view('backend.learners.index', compact('learners'));
    }
    public function status(request $request){
        $learner = Learner::find($request->learner_id);
        $learner->status = $learner->status == '1' ? '0' : '1';
        $learner->save();
        return redirect()->route('qllearner');
    }


    public function index(){
        return view('frontend.home');
    }
    // Hiển thị trang hồ sơ cá nhân
    public function profile()
    {
        // Kiểm tra nếu người dùng chưa đăng nhập
        if (!auth()->check()) {
            return redirect()->route('login')->with('error', 'Vui lòng đăng nhập!');
        }
        
        // Lấy learner hiện tại
        $learner = auth()->user(); // Hoặc Learner::find(auth()->id())
        
        // Truyền dữ liệu vào view
        return view('frontend.profile.profile', compact('learner'));
    }

    // Xử lý cập nhật ảnh đại diện
    public function updatePhoto(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $learner = auth()->user();

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('public/images', $imageName);
            
            // Cập nhật thông tin ảnh đại diện vào database
            $learner->image = $imageName;
            $learner->save();
        }

        return redirect()->route('profile')->with('success', 'Ảnh đại diện đã được cập nhật');
    }

    // Xử lý đổi mật khẩu
    public function changePassword(Request $request)
    {
        $request->validate([
            'current_password' => 'required',
            'new_password' => 'required|confirmed',
        ]);

        $learner = Learner::find(auth()->id());

        if (!Hash::check($request->current_password, $learner->password)) {
            return redirect()->route('profile')->with('error', 'Mật khẩu hiện tại không chính xác!');
        }

        $learner->password = Hash::make($request->new_password);
        $learner->save();

        return redirect()->route('profile')->with('success', 'Mật khẩu đã được thay đổi!');
    }
    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'phone' => 'required|max:15',
            'address' => 'required|max:255',
            'gender' => 'required|in:male,female,other',
        ]);

        $learner = Learner::find(auth()->id());
        $learner->update($request->only('name', 'email', 'phone', 'address', 'gender'));

        return redirect()->route('profile')->with('success', 'Cập nhật thông tin thành công!');
    }

}

// Route::prefix('learner')->group(function () {
//     Route::get('/login', [LearnerAuthController::class, 'showLoginForm'])->name('learner.login');
//     Route::post('/login', [LearnerAuthController::class, 'login'])->name('learner.login.post');
//     Route::post('/logout', [LearnerAuthController::class, 'logout'])->name('learner.logout');

//     Route::get('/index', function () {
//         return view('fontend.index');
//     })->name('learner.index')->middleware('auth');
// });

