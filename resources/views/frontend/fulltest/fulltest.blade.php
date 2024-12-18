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
    </div>
    
</div>
<div class="exam_list">
    <h1 class="exam-title">Quản Lý Exam</h1>

            <!-- Hiển thị thông báo thành công -->
            @if (session('success'))
            <div id="success-message" class="alert alert-success">
                {{ session('success') }}
            </div>

            @if (session('error'))
            <div id="success-message" class="alert alert-danger">
                {{ session('error') }}
            </div>
            @endif

            <script>
                // Tự động ẩn thông báo sau 3 giây
                setTimeout(function() {
                    let successMessage = document.getElementById('success-message');
                    successMessage.style.transition = 'opacity 1s ease';
                    successMessage.style.opacity = 0;
                    setTimeout(function() {
                        successMessage.style.display = 'none';
                    }, 1000); // Đợi cho đến khi hoàn tất hiệu ứng mờ dần
                }, 3000);
            </script>
            @endif

            <div class="search-add">
                <input type="text" class="search-input" placeholder="Tìm kiếm exam..." />
                <button class="btn-add" data-toggle="modal" data-target="#addexamModal">Thêm exam</button>
            </div>

            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên exam</th>
                            <th>Thời gian</th>
                            <th>Ngày tạo</th>
                            <th>Ngày cập nhật</th>
                            <th>Quản lý</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($exams as $exam)
                        <tr>
                            <td>{{ ($exams->currentPage() - 1) * $exams->perPage() + $loop->iteration }}</td>
                            <td>{{ $exam->name }}</td>
                            <td>{{ $exam->duration }}</td>
                            <td>{{ $exam->created_at }}</td>
                            <td>{{ $exam->updated_at }}</td>
                            <td>
                                @php
                                    $exam_id = $exam->exam_id;
                                @endphp
                                <a href="{{ route('fulltest.test', ['exam_id' => $exam_id]) }}" class="btn btn-primary btn-manage indicateBtn">Test </a>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center">Không có exams nào.</td>
                        </tr>
                        @endforelse
                    </tbody>                    
                </table>
            </div>
            <div class="pagination-links">
                {{ $exams->links() }}
            </div>
</div>


{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
