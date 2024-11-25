{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleFullTest.css') }}">

{{-- Nội dung chính của trang --}}
<div class="full-test-container">
    <div class="full-test-content">
        <h3>FULL TEST</h3>
        <h4>BÀI KIỂM TRA TOÀN PHẦN</h4>
        <ul class="test-rules">
            <li>
                <span class="icon">⚠️</span>
                <p>Bài kiểm tra có tất cả 200 câu hỏi, chia làm 7 Part (1, 2, 3, 4, 5, 6, 7)</p>
            </li>
            <li>
                <span class="icon">🕒</span>
                <p>Bạn sẽ có <strong>120 phút</strong> để hoàn thành tất cả các câu hỏi trong bài kiểm tra.</p>
            </li>
            <li>
                <span class="icon">✔️</span>
                <p>Làm tuần tự các câu, <strong>câu nào không làm được xin hãy bỏ trống</strong> để đánh giá đúng năng lực.</p>
            </li>
            <li>
                <span class="icon">❌</span>
                <p><strong>Không nên xem trước phần đọc</strong> vì khi thi chính thức sẽ bị thu bài.</p>
            </li>
        </ul>
        <p class="current-target">
            Mục tiêu của bạn đang là <strong>630</strong>
            <a href="#" class="edit-link">[Điều chỉnh ngay]</a>
        </p>
        <button class="start-button">BẮT ĐẦU NGAY</button>
    </div>
</div>



{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
