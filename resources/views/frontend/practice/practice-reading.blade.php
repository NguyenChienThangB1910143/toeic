{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StylePractice.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-practice">
    <div class="title">
        <h1 class="title-text">Luyện thi TOEIC READING online 2024</h1>
        <h2 class="subtitle">Phần 1: Mô tả tranh</h2>
    </div>
    <div class="content">
        <!-- Other Practices Section -->
        <div class="practice-section">
            <h3>OTHER PRACTICES:</h3>
            <ul class="practice-list">
                <li>Phần 1: Mô tả tranh</li>
                <li>Phần 2: Hỏi – Đáp</li>
                <li>Phần 3: Đoạn hội thoại</li>
                <li>Phần 4: Bài nói ngắn</li>
                <li>Phần 5: Hoàn thành câu</li>
                <li>Phần 6: Hoàn thành đoạn văn</li>
                <li>Phần 7: Đọc hiểu – Đoạn đơn</li>
            </ul>
        </div>
        <!-- Lesson Section -->
        <div class="lesson-section">
            <h3>LESSON:</h3>
            <ul class="lesson-list">
                <li>Bài 1: Dự đoán những gì bạn sẽ nghe</li>
                <li>Bài 2: Nghe động từ đúng</li>
                <li>Bài 3: Nghe để biết chi tiết</li>
                <li>Bài 4: Nghe giới từ và các âm tương tự</li>
            </ul> 
            <!-- Tests Section -->
            <div class="tests">
                <div class="test-card">
                    <h4>Test 1</h4>
                    <p>Tiến độ: 20%</p>
                    <p>Tham gia: 0</p>
                    <button>Study</button>
                </div>
                <div class="test-card">
                    <h4>Test 2</h4>
                    <p>Tiến độ: 20%</p>
                    <p>Tham gia: 0</p>
                    <button>Study</button>
                </div>
                <div class="test-card">
                    <h4>Test 3</h4>
                    <p>Tiến độ: 20%</p>
                    <p>Tham gia: 0</p>
                    <button>Study</button>
                </div>
                <div class="test-card">
                    <h4>Test 4</h4>
                    <p>Tiến độ: 20%</p>
                    <p>Tham gia: 0</p>
                    <button>Study</button>
                </div>
                <div class="test-card">
                    <h4>Test 5</h4>
                    <p>Tiến độ: 20%</p>
                    <p>Tham gia: 0</p>
                    <button>Study</button>
                </div>
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
