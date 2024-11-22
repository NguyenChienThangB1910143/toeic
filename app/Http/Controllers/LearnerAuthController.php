<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
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

    \Log::info('Login attempt: ', $credentials);

    if (Auth::guard('web')->attempt($credentials)) {
        \Log::info('Login successful for user: ' . $credentials['username']);
        return redirect()->route('home')->with('success', 'Đăng nhập thành công!');
    }

    \Log::warning('Login failed for user: ' . $credentials['username']);

    return back()->withErrors([
        'login_error' => 'Tên đăng nhập hoặc mật khẩu không chính xác.',
    ])->withInput();
}


    


    public function showRegister()
    {
        return view('frontend.register');
    }

    public function register(Request $request)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required|string',
        'username' => 'required|string|unique:learners,username',
        'email' => 'required|string|email|unique:learners,email',
        'password' => 'required|string|min:8',
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

    $learner = Learner::create([
        'name' => $request->name,
        'username' => $request->username,
        'email' => $request->email,
        'password' => Hash::make($request->password), // Đảm bảo mã hóa mật khẩu
        'phoneNumber' => $request->phoneNumber,
        'image' => $imagePath,
    ]);

    Auth::login($learner);

    return redirect()->route('login')->with('success', 'Đăng ký thành công!');
}


    public function logout()
    {
        Auth::logout();
        return redirect()->route('login')->with('success', 'Đăng xuất thành công!');
    }
}
