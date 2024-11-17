<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <title>Quản Lý Lesson Content</title>
    <link rel="stylesheet" href="{{ asset('assets/css/QLLessonContent.css') }}">
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-lesson_content">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="{{ route('qlsection') }}">Section</a></li>
                  <li class="breadcrumb-item"><a href="{{ route('qllesson') }}">Lesson</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Lesson Content</li>
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
                <input type="text" class="search-input" placeholder="Tìm kiếm content..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addcontentModal">Thêm content</button>
            </div>
            <!-- Bảng lesson content -->
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tiêu đề</th>
                            <th>Nội dung</th>
                            <th>Ngày tạo</th>
                            <th>Ngày cập nhật</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>

                <tbody>
                    @forelse($lesson_contents as $lesson_content)
                    <tr>
                        <td>{{ ($lesson_contents->currentPage() - 1) * $lesson_contents->perPage() + $loop->iteration }}</td>
                        <td>{{ $lesson_content->title }}</td>
                        <td>{{ $lesson_content->content }}</td>
                        <td>{{ $lesson_content->created_at }}</td>
                        <td>{{ $lesson_content->updated_at }}</td>
                        <td>
                            <button class="btn-edit" data-toggle="modal" data-target="#editcontentModal"
                                data-id="{{ $lesson_content->content_id }}"
                                data-title="{{ $lesson_content->title }}"
                                data-content="{{ $lesson_content->content }}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <form action="{{ route('lesson_contents.destroy', ['lesson_content' => $lesson_content->content_id, 'lesson_id' => request()->lesson_id]) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                    <i class="fa-solid fa-trash-can"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center">Không có content nào.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
            </div>
        </div>
        <div class="pagination-links">{{ $lesson_contents->links() }}</div>
    </div>
            
    <!-- Modal Thêm content -->
    <div class="modal" id="addcontentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm content mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('lesson_contents.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Tiêu đề content -->
                        <div class="form-group">
                            <label for="title">Tiêu đề content:</label>
                            <input type="text" name="title" id="title" class="form-control" value="{{ old('title') }}" required>
                        </div>
                        <!-- Nội dung content -->
                        <div class="form-group">
                            <label for="content">Nội dung content:</label>
                            <textarea name="content" id="content" class="form-control" rows="4" required>{{ old('content') }}</textarea>
                        </div>
                        <input type="hidden" name="lesson_id" value="{{ $lesson_id }}">
                        <button type="submit" class="btn btn-primary">Thêm content</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Chỉnh sửa content -->
    <div class="modal" id="editcontentModal" tabindex="-1" role="dialog" aria-labelledby="editcontentLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editcontentLabel">Chỉnh Sửa Content</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="editcontentForm">
                        @csrf
                        @method('PUT')
                        
                        <!-- Tiêu đề content -->
                        <div class="form-group">
                            <label for="edit_title">Tiêu đề content:</label>
                            <input type="text" name="title" id="edit_title" class="form-control" required>
                        </div>
                        <!-- Nội dung content -->
                        <div class="form-group">
                            <label for="edit_content">Nội dung content:</label>
                            <textarea name="content" id="edit_content" class="form-control" rows="4" required></textarea>
                        </div>
                    
                        <!-- Trường ẩn để giữ giá trị lesson_id -->
                        <input type="hidden" name="lesson_id" id="edit_lesson_id" value="{{ request('lesson_id') }}">
                    
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
            $('#editcontentModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var title = button.data('title');
                var content = button.data('content');
                
                // Lấy lesson_id từ URL
                var urlParams = new URLSearchParams(window.location.search);
                var lessonId = urlParams.get('lesson_id');

                var modal = $(this);
                modal.find('#edit_title').val(title);
                modal.find('#editcontentForm').attr('action', '/lesson_contents/' + id);

                // Đặt lesson_id vào trường ẩn trong form
                modal.find('#edit_lesson_id').val(lessonId);
            });

    </script>
</body>
</html>
