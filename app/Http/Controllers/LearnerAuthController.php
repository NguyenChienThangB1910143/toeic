<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Learner;

class LearnerAuthController extends Controller
{
    public function showLoginForm()
    {
        return view('frontend.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);
    
        $credentials = $request->only('username', 'password');
    
        if (Auth::guard('web')->attempt($credentials)) {
            return redirect()->route('home')->with('success', 'Đăng nhập thành công!');
        }
    
        // Đăng nhập thất bại
        return back()->withErrors([
            'login_error' => 'Tên đăng nhập hoặc mật khẩu không chính xác.',
        ])->withInput();
    }
    

    public function showRegister()
    {
        return view('frontend.register'); // Nếu cần, thay đổi view đăng ký
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'username' => 'required|string|unique:learners,username',
            'email' => 'required|string|email|unique:learners,email',
            'password' => 'required|string',
            'phoneNumber' => 'nullable|string|max:15',

        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        // Xử lý upload ảnh nếu có
        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('images/learners', 'public');
        }

        // Tạo learner mới
        $learner = Learner::create([
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'phoneNumber' => $request->phoneNumber,

        ]);

        // Đăng nhập sau khi đăng ký
        Auth::login($learner);

        return redirect()->route('login')->with('success', 'Đăng ký thành công!');
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('login')->with('success', 'Đăng xuất thành công!');
    }
}
