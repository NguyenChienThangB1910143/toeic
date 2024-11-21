<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Learn And Lead TOEIC</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('assets/css/StyleIndex.css') }}">
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">
                <a href="{{ asset('home') }}"><img src="{{ asset('images/logo.png') }}" alt="Logo"></a>
            </div>
            <div class="nav">
              <ul class="nav nav-tabs">
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('home') ? 'active' : '' }}" 
                         >Trang chủ</a>
                  </li>
                  <li class="nav-item dropdown">
                      <span class="nav-link dropdown-toggle {{ Request::is('practice-*') ? 'active' : '' }}" 
                            data-bs-toggle="dropdown" role="button"
                            onclick="redirectIfNotLoggedIn(event, '{{ route('login') }}')">Luyện thi</span>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('practice-listening') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? asset('practice-listening') : route('login') }}">Luyện nghe</a></li>
                          <li><a class="dropdown-item {{ Request::is('practice-reading') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? asset('practice-reading') : route('login') }}">Luyện đọc</a></li>
                      </ul>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle {{ Request::is('grammar') || Request::is('topic') || Request::is('dictionary') ? 'active' : '' }}" 
                         data-bs-toggle="dropdown" href="#" role="button">Kỹ năng</a>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('grammar') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? asset('grammar') : route('login') }}">Ngữ pháp</a></li>
                          <li><a class="dropdown-item {{ Request::is('topic') ? 'active' : '' }}" 
                                 href="{{ Auth::check() ? asset('topic') : route('login') }}">Từ vựng</a></li>
                          <li><a class="dropdown-item {{ Request::is('dictionary') ? 'active' : '' }}" 
                                 href="{{ asset('dictionary') }}">Tra cứu từ điển</a></li>
                      </ul>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('fulltest') ? 'active' : '' }}" 
                         href="{{ Auth::check() ? asset('fulltest') : route('login') }}">Thi thử</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('material') ? 'active' : '' }}" 
                         href="{{ Auth::check() ? asset('material') : route('login') }}">Tài liệu</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link {{ Request::is('feedback') ? 'active' : '' }}" 
                         href="{{ Auth::check() ? asset('feedback') : route('login') }}">Góp ý</a>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle {{ Request::is('tips-*') ? 'active' : '' }}" 
                         data-bs-toggle="dropdown" href="#" role="button">Mẹo học</a>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('tips-listening') ? 'active' : '' }}" 
                                 href="{{ asset('tips-listening') }}">Listening</a></li>
                          <li><a class="dropdown-item {{ Request::is('tips-reading') ? 'active' : '' }}" 
                                 href="{{ asset('tips-reading') }}">Reading</a></li>
                      </ul>
                  </li>
                  @if(Auth::check())
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle {{ Request::is('profile') || Request::is('learner-*') ? 'active' : '' }}" 
                         data-bs-toggle="dropdown" href="#">
                          <i class="fa-solid fa-circle-user"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li><a class="dropdown-item {{ Request::is('profile') ? 'active' : '' }}" 
                                 href="{{ asset('profile') }}">Hồ sơ cá nhân</a></li>
                          <li><a class="dropdown-item {{ Request::is('learnerroute') ? 'active' : '' }}" 
                                 href="{{ asset('learnerroute') }}">Lộ trình học</a></li>
                          <li><a class="dropdown-item {{ Request::is('learner-vocabulary') ? 'active' : '' }}" 
                                 href="{{ asset('learner-vocabulary') }}">Từ vựng cá nhân</a></li>
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

