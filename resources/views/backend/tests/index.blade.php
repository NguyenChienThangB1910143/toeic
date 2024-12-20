<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <title>Quản Lý Test</title>
    <link rel="stylesheet" href="{{ asset('assets/css/QLTest.css') }}">
    <style>
    /* Tùy chỉnh chiều rộng và chiều cao của modal */
    .modal-content {
        width: 100%; /* Đặt chiều rộng của modal content thành 100% */
        max-width: 1200px; /* Giới hạn chiều rộng tối đa nếu muốn */
        height: 80vh; /* Chiều cao modal chiếm 80% chiều cao màn hình */
        margin: 0 auto; /* Căn giữa modal content */
    }

    /* Tùy chỉnh modal background */
    .modal-backdrop {
        background-color:white;
        opacity: 0.5; /* Điều chỉnh độ mờ của nền */
    }

    /* Nếu bạn muốn kiểm soát chiều cao cụ thể */
    .modal-body {
        background-color: white;
        height: 100%; /* Tùy chỉnh chiều cao của nội dung modal */
        overflow-y: auto; /* Thêm thanh cuộn nếu nội dung vượt quá chiều cao */
    }
</style>

</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-test">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="{{ route('qlsection') }}">Section</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Test</li>
                </ol>
            </nav>
            <!-- Hiển thị thông báo thành công -->
            @if (session('success'))
            <div id="success-message" class="alert alert-success">
                {{ session('success') }}
                </div>
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
                <input type="text" class="search-input" placeholder="Tìm kiếm test..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addtestModal">Thêm Test</button>
            </div>
            <!-- Bảng test -->
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Ngày tạo</th>
                            <th>Ngày cập nhật</th>
                            <th>Hành động</th>
                            <th>Quản lý</th>
                        </tr>
                    </thead>

                <tbody>
                    @forelse($tests as $test)
                    <tr>
                        <td>{{ ($tests->currentPage() - 1) * $tests->perPage() + $loop->iteration }}</td>
                        <td>{{ $test->name }}</td>
                        <td>{{ $test->created_at }}</td>
                        <td>{{ $test->updated_at }}</td>
                        <td>
                            <button class="btn-edit" data-toggle="modal" data-target="#edittestModal"
                                data-id="{{ $test->test_id }}"
                                data-name="{{ $test->name }}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <form action="{{ route('tests.destroy', ['test' => $test->test_id, 'section_id' => request()->section_id]) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                    <i class="fa-solid fa-trash-can"></i>
                                </button>
                            </form>
                            
                        </td>
                        <td>
                            @if (DB::table('test_question')->where('test_id', $test->test_id)->exists())
                                <button class="btn btn-primary view-test-btn" 
                                        data-section-id="{{ $section_id }}" 
                                        data-test-id="{{ $test->test_id }}">
                                    Xem Test
                                </button>
                            @else
                                <a href="{{ route('qltest_question', ['section_id' => $section_id, 'test_id' => $test->test_id]) }}" class="btn btn-secondary">Indicate Question</a>
                            @endif
                        </td>                        
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center">Không có test nào.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
                <!-- Modal xem bài test -->
                <div class="modal fade" id="viewTestModal" tabindex="-1" aria-labelledby="viewTestModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="viewTestModalLabel">Chi tiết bài test</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="modalContent">
                                <!-- Nội dung bài test sẽ được tải vào đây -->
                                <div class="text-center">
                                    <span class="spinner-border" role="status" aria-hidden="true"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pagination-links">{{ $tests->links() }}</div>
    </div>
            
    <!-- Modal Thêm test -->
    <div class="modal" id="addtestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm test mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('tests.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Tên test -->
                        <div class="form-group">
                            <label for="name">Tên Test:</label>
                            <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
                        </div>
                        <input type="hidden" name="section_id" value="{{ $section_id }}">
                        <button type="submit" class="btn btn-primary">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Chỉnh sửa test -->
    <div class="modal" id="edittestModal" tabindex="-1" role="dialog" aria-labelledby="edittestLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="edittestLabel">Chỉnh Sửa test</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="edittestForm">
                        @csrf
                        @method('PUT')
                        
                        <!-- Tên test -->
                        <div class="form-group">
                            <label for="edit_name">Tên Test:</label>
                            <input type="text" name="name" id="edit_name" class="form-control" required>
                        </div>
                    
                        <!-- Trường ẩn để giữ giá trị section_id -->
                        <input type="hidden" name="section_id" id="edit_section_id" value="{{ request('section_id') }}">
                    
                        <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
    
    <!-- Các thư viện JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <script>
        // Khi modal chỉnh sửa được mở
            $('#edittestModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var name = button.data('name');
                
                // Lấy section_id từ URL
                var urlParams = new URLSearchParams(window.location.search);
                var sectionId = urlParams.get('section_id');

                var modal = $(this);
                modal.find('#edit_name').val(name);
                modal.find('#edittestForm').attr('action', '/tests/' + id);

                // Đặt section_id vào trường ẩn trong form
                modal.find('#edit_section_id').val(sectionId);
            });

            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.view-test-btn').forEach(button => {
                    button.addEventListener('click', function () {
                        const sectionId = this.getAttribute('data-section-id');
                        const testId = this.getAttribute('data-test-id');

                        // Hiển thị modal với loader
                        const modalContent = document.getElementById('modalContent');
                        modalContent.innerHTML = '<div class="text-center"><span class="spinner-border" role="status" aria-hidden="true"></span></div>';
                        const viewTestModal = new bootstrap.Modal(document.getElementById('viewTestModal'));
                        viewTestModal.show();

                        // Gửi AJAX để tải nội dung view_test
                        fetch(`/view_test/${sectionId}/${testId}`)
                            .then(response => response.text())
                            .then(html => {
                                modalContent.innerHTML = html;
                            })
                            .catch(error => {
                                modalContent.innerHTML = '<div class="text-danger">Lỗi khi tải nội dung bài test!</div>';
                            });
                    });
                });
            });
    </script>
</body>
</html>
