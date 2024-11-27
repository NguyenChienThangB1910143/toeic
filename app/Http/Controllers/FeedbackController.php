<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class FeedbackController extends Controller
{
    // Hiển thị form góp ý
    public function create()
    {
        return view('feedback.feedback');
    }

    // Xử lý gửi phản hồi
    public function store(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:500',
        ]);

        $user = auth()->user(); // Lấy thông tin người dùng đang đăng nhập
        $message = $request->input('message');
        
        // Gửi email phản hồi
        Mail::raw($message, function ($mail) use ($user) {
            $mail->to('nguyenthienly2002@gmail.com')
                 ->subject('Góp ý từ học viên: ' . $user->name)
                 ->from($user->email);
        });

        return back()->with('success', 'Phản hồi của bạn đã được gửi thành công!');
    }
}
