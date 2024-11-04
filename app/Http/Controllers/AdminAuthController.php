<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; // Import đúng class Auth
use Illuminate\Support\Facades\Hash;
use App\Models\Admin;

class AdminAuthController extends Controller
{
    public function showLoginForm()
    {
        return view('backend.LoginAdmin');
    }

    public function login(Request $request)
    {
        $credentials = $request->only('account', 'password');

        if (Auth::guard('admin')->attempt($credentials)) {
            // Đăng nhập thành công, chuyển hướng đến trang IndexAdmin
            return redirect()->route('admin.index');
        }

        // Đăng nhập thất bại
        return back()->withErrors(['message' => 'Tài khoản hoặc mật khẩu không đúng!']);
    }

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }

    public function createAdmin(Request $request)
    {
        $admin = new Admin();
        $admin->account = $request->input('account');
        $admin->password = Hash::make($request->input('password')); // Mã hóa mật khẩu bằng Bcrypt
        $admin->save();

        return response()->json(['success' => true, 'message' => 'Tài khoản quản trị viên đã được tạo thành công!']);
    }
}
