{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StylePractice.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-practice">
    <div class="title">
        <h1 class="title-text">{{ $current_section->name }}</h1>
        <h2 class="subtitle">{{ $current_section->description }}</h2>
    </div>
    <div class="content">
        <!-- Other Practices Section -->
        <div class="practice-section">
            <h3>OTHER PRACTICES:</h3>
            <ul class="practice-list">
                @foreach($sections as $section)
                    <li><a href="{{ route('practice.section', $section->section_id) }}">{{ $section->name }}</a></li>
                @endforeach
            </ul>
        </div>
        <!-- Lesson Section -->
        <div class="lesson-section">
            <h3>LESSON:</h3>
            <ul class="lesson-list">
                @foreach($lessons as $lesson)
                    <li><a href="{{ route('practice.lesson',$lesson->lesson_id) }}">{{ $lesson->name }}</a></li>
                @endforeach
            </ul> 
            <!-- Tests Section -->
            <div class="tests">
                <h3>TESTS:</h3>
                <ul>
                    @foreach($tests as $test)
                        <li><a href="{{ route('practice.test', $test->test_id) }}">{{ $test->name }}</a></li>
                        <button>Study</button>
                    @endforeach
                </ul>
                <div class="test-card">
                    <h4>Test 6</h4>
                    <p>Tiến độ: 20%</p>
                    <p>Tham gia: 0</p>
                    <button>Study</button>
                </div>
            </div>
        </div>
    </div>   
</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
