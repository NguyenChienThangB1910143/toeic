<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/css/QLTopic.css') }}">
    <title>Quản lý Topic</title>
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-topic">
            <h1 class="topic-title">Quản Lý Topic</h1>

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
                <input type="text" class="search-input" placeholder="Tìm kiếm topic..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addTopicModal">Thêm Topic</button>
            </div>

            <!-- Bảng Topic -->
            <div class="table-container">

                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên Topic</th>
                            <th>Hình ảnh</th>
                            <th>Mô tả</th>
                            <th>Loại</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        @forelse($topics as $topic)
                        <tr>
                            <td>{{ ($topics->currentPage() - 1) * $topics->perPage() + $loop->iteration }}</td>
                            <td>{{ $topic->name }}</td>
                            <td><img src="{{ asset('storage/' . $topic->image) }}" alt="Image" class="table-image" width="100" height="100"></td>
                            <td>{{ $topic->description }}</td>
                            <td>{{ $topic->topic_type }}</td>
                            <td>
                                <button class="btn-edit" data-toggle="modal" data-target="#editTopicModal"
                                    data-id="{{ $topic->id }}"
                                    data-name="{{ $topic->name }}"
                                    data-description="{{ $topic->description }}"
                                    data-topic_type="{{ $topic->topic_type }}"
                                    data-image="{{ $topic->image }}">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <form action="{{ route('topics.destroy', $topic->id) }}" method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center">Không có topics nào.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <!-- Hiển thị liên kết phân trang -->
            <div class="pagination-links">
                {{ $topics->links() }}
            </div>

        </div>
    </div>

    <!-- Modal Thêm Topic -->
    <div class="modal" id="addTopicModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm Topic Mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('topics.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Tên topic -->
                        <div class="form-group">
                            <label for="name">Tên Topic:</label>
                            <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
                        </div>

                        <!-- Ảnh topic -->
                        <div class="form-group">
                            <label for="image">Ảnh:</label>
                            <input type="file" name="image" id="image" class="form-control" accept="image/*" required>
                        </div>

                        <!-- Loại của topic -->
                        <div class="form-group">
                            <label for="topic_type">Loại Topic:</label>
                            <select name="topic_type" id="topic_type" class="form-control" required>
                                <option value="listening" {{ old('topic_type') == 'listening' ? 'selected' : '' }}>Listening</option>
                                <option value="reading" {{ old('topic_type') == 'reading' ? 'selected' : '' }}>Reading</option>
                            </select>
                        </div>                        

                        <!-- Mô tả (description) -->
                        <div class="form-group">
                            <label for="description">Mô Tả:</label>
                            <textarea name="description" id="description" class="form-control">{{ old('description') }}</textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Thêm Topic</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Chỉnh sửa Topic -->
    <div class="modal" id="editTopicModal" tabindex="-1" role="dialog" aria-labelledby="editTopicLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTopicLabel">Chỉnh Sửa Topic</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('topics.update', 'topic_id') }}" method="POST" enctype="multipart/form-data" id="editTopicForm">
                        @csrf
                        @method('PUT')

                        <!-- Tên topic -->
                        <div class="form-group">
                            <label for="edit_name">Tên Topic:</label>
                            <input type="text" name="name" id="edit_name" class="form-control" required>
                        </div>


                        <!-- Ảnh topic (nếu người dùng muốn thay đổi) -->
                        <div class="form-group">
                            <label for="edit_image">Ảnh Mới:</label>
                            <input type="file" name="image" id="edit_image" class="form-control" accept="image/*">
                            <img id="current_image" src="" alt="Current Image" class="img-thumbnail" width="150">
                        </div>

                        <!-- Loại của topic -->
                        <div class="form-group">
                            <label for="edit_topic_type">Loại Topic:</label>
                            <select name="topic_type" id="edit_topic_type" class="form-control" required>
                                <option value="listening">Listening</option>
                                <option value="reading">Reading</option>
                            </select>
                        </div>

                        <!-- Mô tả (description) -->
                        <div class="form-group">
                            <label for="edit_description">Mô Tả:</label>
                            <textarea name="description" id="edit_description" class="form-control" required></textarea>
                        </div>

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
        $('#editTopicModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var name = button.data('name');
            var description = button.data('description');
            var topic_type = button.data('topic_type');
            var image = button.data('image'); // Dữ liệu ảnh cũ

            var modal = $(this);
            modal.find('#edit_name').val(name);
            modal.find('#edit_description').val(description);
            modal.find('#edit_topic_type').val(topic_type);
            modal.find('#editTopicForm').attr('action', '/topics/' + id);

            // Cập nhật đường dẫn hình ảnh cũ
            if (image) {
                modal.find('#current_image').attr('src', '/storage/' + image);
            } else {
                modal.find('#current_image').attr('src', '/path/to/default-image.jpg'); // Đặt ảnh mặc định nếu không có ảnh
            }
        });
    </script>
</body>
</html>