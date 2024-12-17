{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StylePractice.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-lesson">
    <div class="title">
        <h1 class="title-text">{{ $current_lesson->name }}</h1>
    </div>
    <div class="content">
        <!-- Other lesson -->
        <div class="section-lesson">
            <h3>OTHER LESSON:</h3>
            <ul class="lesson-list">
                @foreach($lessons as $lesson)
                    <li><a href="{{ route('practice.lesson',$lesson->lesson_id) }}">{{ $lesson->name }}</a></li>
                @endforeach
            </ul>
        </div>
        <!-- Lesson content -->
        <div class="lesson-content">
            @foreach($lessons_content as $content)
                <h3>{{ $content->title }}</h3>
                <p>{{ $content->content }}</p>
            @endforeach
        </div>
    </div>   
</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
