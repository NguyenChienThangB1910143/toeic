<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('{{ asset('images/blue-surface-with-study-tools.jpg') }}') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.9); /* Màu nền trắng với độ trong suốt */
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            padding: 20px 20px 20px 20px;
            width: 400px;
        }

        .login-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-login {
            background-color: #3d92cb;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .btn-login:hover {
            background-color: #2163a1;
        }

        .footer {
            text-align: center;
            margin-top: 10px;
            font-size: 12px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Đăng Nhập Admin</h1>
        <form id="loginForm" method="POST" action="{{ route('admin.login.post') }}">
            @csrf
            <div class="form-group">
                <label for="account">Tài Khoản</label>
                <input type="text" id="account" name="account" required>
            </div>
            <div class="form-group">
                <label for="password">Mật Khẩu</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-login">Đăng Nhập</button>
        </form>

        <div class="footer">
            <p>©2024 Toeic</p>
        </div>
    </div>
</body>
</html>