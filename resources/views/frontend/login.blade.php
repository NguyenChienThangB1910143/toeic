<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('assets/css/StyleLogin.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">  
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">  
</head>
<style>
    #notification {
        display: none;
        position: fixed;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        padding: 15px;
        background-color: #f44336;
        color: white;
        z-index: 1000;
        border-radius: 2px;
    }

    #notification.close {
        display: none;
    }
</style>
<body>
    <div id="notification">
        <span id="message"></span>
        <button id="close-button">Đóng</button>
    </div>

    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="{{ route('register') }}" method="POST">
                @csrf
                <h1>ĐĂNG KÝ</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="btngg"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span>Đăng ký bằng email </span>
                <input id="name" name="name" type="text" placeholder="Tên" value="{{ old('name') }}" autocomplete="name">
                @error('name') <span class="error">{{ $message }}</span> @enderror
            
                <input id="sg_up_email" name="email" type="email" placeholder="Email" value="{{ old('email') }}" autocomplete="email">
                @error('email') <span class="error">{{ $message }}</span> @enderror
            
                <input id="sg_up_username" name="username" type="text" placeholder="Tên đăng nhập" value="{{ old('username') }}" autocomplete="username">
                @error('username') <span class="error">{{ $message }}</span> @enderror
            
                <input id="sg_up_password" name="password" type="password" placeholder="Mật khẩu" autocomplete="new-password">
                @error('password') <span class="error">{{ $message }}</span> @enderror
            
                <input id="phoneNumber" name="phoneNumber" type="tel" placeholder="Số điện thoại" value="{{ old('phoneNumber') }}" autocomplete="tel">
                @error('phoneNumber') <span class="error">{{ $message }}</span> @enderror
            
                <button id="btnSignup" type="submit">Đăng ký</button>
            </form>
            
        </div>
        <div class="form-container sign-in-container">
            <form action="{{ route('login') }}" method="POST">
                @csrf
                <h1>ĐĂNG NHẬP</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="btngg"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span>Đăng nhập bằng tài khoản </span>
                <input id="username" name="username" type="text" placeholder="Tên đăng nhập" autocomplete="username" value="{{ old('username') }}">
                <input id="password" name="password" type="password" placeholder="Mật khẩu" autocomplete="current-password">
                <a href="#"> Quên mật khẩu?</a>
                <button id="btnSignin" type="submit">Đăng nhập</button>
                <a href="{{ url('/') }}">Về trang chủ</a>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>WELCOME BACK!</h1>
                    <p>Đã có tài khoản? <br>Hãy đăng nhập</p>
                    <button class="ghost" id="signIn">Đăng nhập</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>HELLO!</h1>
                    <p>Chưa có tài khoản? <br> Hãy đăng ký tại đây</p>
                    <button class="ghost" id="signUp">Đăng ký</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        const byId = (id) => document.getElementById(id);
        const $signUpButton = byId('signUp');
        const $signInButton = byId('signIn');
        const $container = byId('container');

        $signUpButton.addEventListener('click', () => {
            $container.classList.add('right-panel-active');
        });

        $signInButton.addEventListener('click', () => {
            $container.classList.remove('right-panel-active');
        });

        window.onload = function() {
            const notification = document.getElementById('notification');
            const closeButton = document.getElementById('close-button');

            if (notification && closeButton) {
                closeButton.onclick = function() {
                    notification.style.display = 'none';
                };
            }
        };

        document.getElementById('btnSignup').addEventListener('click', (e) => {
        const email = document.getElementById('sg_up_email').value;
        const password = document.getElementById('sg_up_password').value;

        if (!email.includes('@')) {
            e.preventDefault();
            alert('Email không hợp lệ ');
        }
    });

    </script>
</body>
</html>
