{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StylePractice.css') }}">

{{-- Nội dung chính của trang --}}
    <div class="container-practice">
        <div class="title">
            <h1 class="title-text">Luyện thi TOEIC online 2024</h1>
        </div>
        <div class="content">
            @foreach($sections as $section)
                <div class="section-card">
                    <a href="{{ route('practice.section' , $section->section_id) }}">
                        <img src="{{ asset('storage/' . $section->image) }}" alt="{{ $section->name }}" width="150px">
                        <h3>{{ $section->name }}</h3>
                        <p>{{ $section->description }}</p>
                    </a>
                </div>
            @endforeach
        </div>   
    </div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
