<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Learn And Lead TOEIC</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('assets/css/StyleInc.css') }}">
    <link rel="icon" type="image/png" href="images/black white Thunder logo (4).png">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    

</head>
<body>
    <header>
        <div class="container-inc">
            <div class="logo">
                <a href="{{ route('home') }}"><img src="{{ asset('images/logo.png') }}" alt="Logo"></a>
            </div>
            <span class="hamburger" onclick="toggleSidebar()">☰</span>
            <div class="nav">
              <ul class="nav nav-tabs">
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('home') ? 'active' : '' }}" 
                         href="{{ route('home') }}">Trang chủ</a>
                  </li>
                  {{-- <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle {{ Request::is('practice-*') ? 'active' : '' }}" 
                            data-bs-toggle="dropdown" role="button"
                            onclick="redirectIfNotLoggedIn(event, '{{ route('login') }}')">Luyện thi</span>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('practice-listening') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? route('practice-listening') : route('login') }}">Luyện nghe</a></li>
                          <li><a class="dropdown-item {{ Request::is('practice-reading') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? route('practice-reading') : route('login') }}">Luyện đọc</a></li>
                      </ul>
                  </li> --}}
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle {{ Request::is('grammar') || Request::is('topic') || Request::is('dictionary') ? 'active' : '' }}" 
                         data-bs-toggle="dropdown" role="button">Kỹ năng</span>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('grammar') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? route('grammar') : route('login') }}">Ngữ pháp</a></li>
                          <li><a class="dropdown-item {{ Request::is('topic') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? route('topic') : route('login') }}">Từ vựng</a></li>
                          <li><a class="dropdown-item {{ Request::is('dictionary') ? 'active' : '' }}" 
                                 href="{{ route('dictionary') }}">Tra cứu từ điển</a></li>
                      </ul>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('practice') ? 'active' : '' }}" 
                         href="{{ Auth::check() ? route('practice') : route('login') }}">Luyện thi</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('fulltest') ? 'active' : '' }}" 
                         href="{{ Auth::check() ? route('fulltest') : route('login') }}">Thi thử</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('material') ? 'active' : '' }}" 
                         href="{{ Auth::check() ? route('material') : route('login') }}">Tài liệu</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('feedback') ? 'active' : '' }}" 
                         href="{{ Auth::check() ? route('feedback') : route('login') }}">Góp ý</a>
                  </li>
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle {{ Request::is('tips-*') ? 'active' : '' }}" 
                         data-bs-toggle="dropdown" role="button">Mẹo học</span>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('tips-listening') ? 'active' : '' }}" 
                                 href="{{ route('tips-listening') }}">Listening</a></li>
                          <li><a class="dropdown-item {{ Request::is('tips-reading') ? 'active' : '' }}" 
                                 href="{{ route('tips-reading') }}">Reading</a></li>
                      </ul>
                  </li>
                  @if(Auth::check())
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle {{ Request::is('profile') || Request::is('learner-*') ? 'active' : '' }}" 
                         data-bs-toggle="dropdown" >
                          <i class="fa-solid fa-circle-user"></i>
                      </span>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('profile') ? 'active' : '' }}" 
                                 href="{{route('profile')}}">Hồ sơ cá nhân</a></li>
                          <li><a class="dropdown-item {{ Request::is('learningroute') ? 'active' : '' }}" 
                                 href="{{ route('learningroute') }}">Lộ trình học</a></li>
                          <li><a class="dropdown-item {{ Request::is('learner-vocabularies') ? 'active' : '' }}" 
                                 href="{{ route('learner-vocabularies') }}">Từ vựng cá nhân</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li>
                              <a class="dropdown-item" href="{{ route('logout') }}"
                                 onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                  Đăng xuất
                              </a>
                              <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                  @csrf
                              </form>
                          </li>
                      </ul>
                  </li>
                  @else
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('login') ? 'active' : '' }}" href="{{ route('login') }}">Đăng nhập</a>
                  </li>
                  @endif
              </ul>
          </div>            
        </div>
    </header>
<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <span class="close-btn" onclick="toggleSidebar()">✖</span>
    <ul>
        <li><a href="{{ route('home') }}">Trang chủ</a></li>
        <li><a href="{{ Auth::check() ? route('grammar') : route('login') }}">Ngữ pháp</a></li>
        <li><a href="{{ Auth::check() ? route('practice') : route('login') }}">Luyện nghe</a></li>
        <li><a href="{{ Auth::check() ? route('fulltest') : route('login') }}">Thi thử</a></li>
        <li><a href="{{ Auth::check() ? route('feedback') : route('login') }}">Góp ý</a></li>
        <li><a href="{{ Auth::check() ? route('profile') : route('login') }}">Hồ sơ cá nhân</a></li>
    </ul>
</div>
<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('active');
    }
    // Tự động đóng sidebar khi màn hình > 768px
    function closeSidebarOnResize() {
        const sidebar = document.getElementById('sidebar');
        if (window.innerWidth > 768 && sidebar.classList.contains('active')) {
            sidebar.classList.remove('active');
        }
    }

    // Lắng nghe sự kiện thay đổi kích thước màn hình
    window.addEventListener('resize', closeSidebarOnResize);
</script>

