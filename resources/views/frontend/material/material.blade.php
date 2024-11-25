{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleMaterial.css') }}">

{{-- Nội dung chính của trang --}}
<div class="download-container">
    <h2 class="download-title">DOWNLOAD TÀI LIỆU MIỄN PHÍ TOEIC</h2>
    <button class="download-button">Click để tải xuống</button>

    <div class="download-content">
        <div class="file-card">
            <div class="file-icon">📁</div>
            <div class="file-info">
                <h4>Tài liệu sơ cấp (1-200)</h4>
            </div>
        </div>
        <div class="file-card">
            <div class="file-icon">📁</div>
            <div class="file-info">
                <h4>Tài liệu trung cấp (201-500)</h4>
            </div>
        </div>
        <div class="file-card">
            <div class="file-icon">📁</div>
            <div class="file-info">
                <h4>Tài liệu cao cấp (501-800)</h4>
            </div>
        </div>
        <div class="file-card">
            <div class="file-icon">📁</div>
            <div class="file-info">
                <h4>Tài liệu nâng cao (801-990)</h4>
            </div>
        </div>
    </div>

    <div class="practice-section">
        <ul>
            <li>Phần 1: Mô tả tranh</li>
            <li>Phần 2: Hỏi – Đáp</li>
            <li>Phần 3: Đoạn hội thoại</li>
            <li>Phần 4: Bài nói ngắn</li>
            <li>Phần 5: Hoàn thành câu</li>
            <li>Phần 6: Hoàn thành đoạn văn</li>
            <li>Phần 7: Đọc hiểu – Đoạn đơn</li>
            <li>Phần 7: Đọc hiểu – Đoạn kép</li>
        </ul>
    </div>
</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
