<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <title>Quản Lý Lesson</title>
    <link rel="stylesheet" href="{{ asset('assets/css/QLLesson.css') }}">
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-lesson">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="{{ route('qlsection') }}">Section</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Lesson</li>
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
                <input type="text" class="search-input" placeholder="Tìm kiếm lesson..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addlessonModal">Thêm lesson</button>
            </div>
            <!-- Bảng lesson -->
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
                    @forelse($lessons as $lesson)
                    <tr>
                        <td>{{ ($lessons->currentPage() - 1) * $lessons->perPage() + $loop->iteration }}</td>
                        <td>{{ $lesson->name }}</td>
                        <td>{{ $lesson->created_at }}</td>
                        <td>{{ $lesson->updated_at }}</td>
                        <td>
                            <button class="btn-edit" data-toggle="modal" data-target="#editlessonModal"
                                data-id="{{ $lesson->lesson_id }}"
                                data-name="{{ $lesson->name }}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <form action="{{ route('lessons.destroy', ['lesson' => $lesson->lesson_id, 'section_id' => request()->section_id]) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                    <i class="fa-solid fa-trash-can"></i>
                                </button>
                            </form>
                            
                        </td>
                        <td>
                            <a href="{{ route('qllesson_content', ['lesson_id' => $lesson->lesson_id]) }}" class="btn-manage contentBtn">Content</a>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center">Không có lesson nào.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
            </div>
        </div>
        <div class="pagination-links">{{ $lessons->links() }}</div>
    </div>
            
    <!-- Modal Thêm lesson -->
    <div class="modal" id="addlessonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm lesson mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('lessons.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Tên lesson -->
                        <div class="form-group">
                            <label for="name">Tên lesson:</label>
                            <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
                        </div>
                        <input type="hidden" name="section_id" value="{{ $section_id }}">
                        <button type="submit" class="btn btn-primary">Thêm lesson</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Chỉnh sửa lesson -->
    <div class="modal" id="editlessonModal" tabindex="-1" role="dialog" aria-labelledby="editlessonLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editlessonLabel">Chỉnh Sửa lesson</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="editlessonForm">
                        @csrf
                        @method('PUT')
                        
                        <!-- Tên lesson -->
                        <div class="form-group">
                            <label for="edit_name">Tên lesson:</label>
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
            $('#editlessonModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var name = button.data('name');
                
                // Lấy section_id từ URL
                var urlParams = new URLSearchParams(window.location.search);
                var sectionId = urlParams.get('section_id');

                var modal = $(this);
                modal.find('#edit_name').val(name);
                modal.find('#editlessonForm').attr('action', '/lessons/' + id);

                // Đặt section_id vào trường ẩn trong form
                modal.find('#edit_section_id').val(sectionId);
            });

    </script>
</body>
</html>
