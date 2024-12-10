<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/css/QLExam.css') }}">
    <title>Quản lý Exam</title>
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-exam">
            <h1 class="exam-title">Quản Lý Exam</h1>

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
                            <th>Hành động</th>
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
                                <button class="btn-edit" data-toggle="modal" data-target="#editexamModal"
                                    data-id="{{ $exam->exam_id }}"
                                    data-name="{{ $exam->name }}"
                                    data-duration="{{ $exam->duration }}"
                                    data-created_at="{{ $exam->created_at }}"
                                    data-updated_at="{{ $exam->updated_at }}">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <form action="{{ route('exams.destroy', $exam->exam_id) }}" method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </button>
                                </form>
                            </td>
                            <td>
                                <button class="btn-manage questionBtn">Question</button>
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
    </div>

    <!-- Modal Thêm exam -->
    <div class="modal" id="addexamModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm exam mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('exams.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="name">Tên exam:</label>
                            <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
                        </div>
                        <div class="form-group"></div>
                            <label for="duration">Thời gian:</label>
                            <input type="text" name="duration" id="duration" class="form-control" value="{{ old('duration') }}" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Thêm exam</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Chỉnh sửa exam -->
    <div class="modal" id="editexamModal" tabindex="-1" role="dialog" aria-labelledby="editexamLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editexamLabel">Chỉnh Sửa exam</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="editexamForm">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="edit_name">Tên exam:</label>
                            <input type="text" name="name" id="edit_name" class="form-control" required>
                        </div>
                        <div class="form-group"></div>
                            <label for="edit_duration">Thời gian:</label>
                            <input type="text" name="duration" id="edit_duration" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script>
        $('#editexamModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var name = button.data('name');
            var duration = button.data('duration');
            var created_at = button.data('created_at');
            var updated_at = button.data('updated_at');
            var modal = $(this);
            modal.find('#edit_name').val(name);
            modal.find('#edit_duration').val(duration);
            modal.find('#edit_created_at').val(created_at);
            modal.find('#edit_updated_at').val(updated_at);
            modal.find('#editexamForm').attr('action', '/exams/' + id);
        });
    </script>
</body>
</html>
