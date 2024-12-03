<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <title>Vocabulary</title>
    <link rel="stylesheet" href="{{ asset('assets/css/QLVocabulary.css') }}">
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-vocabulary">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="{{ route('qltopic') }}">Topic</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Vocabulary</li>
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
                <input type="text" class="search-input" placeholder="Search vocabulary..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addvocabularyModal">Add Vocabulary</button>
            </div>
            <!-- Bảng vocabulary -->
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Hình ảnh</th>
                            <th>Từ vựng</th>
                            <th>Phiên âm</th>
                            <th>Nghĩa</th>
                            <th>Ví dụ</th>
                            <th>Ngày tạo</th>
                            <th>Ngày cập nhật</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>

                <tbody>
                    @forelse($vocabularys as $vocabulary)
                    <tr>
                        <td>{{ ($vocabularys->currentPage() - 1) * $vocabularys->perPage() + $loop->iteration }}</td>
                        <td>{{ $vocabulary->image }}</td>
                        <td>{{ $vocabulary->word }}</td>
                        <td>{{ $vocabulary->ipa }}</td>
                        <td>{{ $vocabulary->meaning }}</td>
                        <td>{{ $vocabulary->example }}</td>
                        <td>{{ $vocabulary->created_at }}</td>
                        <td>{{ $vocabulary->updated_at }}</td>
                        <td>
                            <button class="btn-edit" data-toggle="modal" data-target="#editvocabularyModal"
                                data-id="{{ $vocabulary->vocabulary_id }}"
                                data-word="{{ $vocabulary->word }}"
                                data-image="{{ $vocabulary->image }}"
                                data-ipa="{{ $vocabulary->ipa }}"
                                data-meaning="{{ $vocabulary->meaning }}"
                                data-example="{{ $vocabulary->example }}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <form action="{{ route('vocabularys.destroy', ['vocabulary' => $vocabulary->vocabulary_id, 'topic_id' => request()->topic_id]) }}" method="POST" style="display:inline;">
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
                        <td colspan="6" class="text-center">Không có vocabulary nào.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
            </div>
        </div>
        <div class="pagination-links">{{ $vocabularys->links() }}</div>
    </div>
            
    <!-- Modal Thêm vocabulary -->
    <div class="modal" id="addvocabularyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm vocabulary mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('vocabularys.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- HÌnh ảnh -->
                        <div class="form-group">
                            <label for="image">Hình ảnh:</label>
                            <input type="file" name="image" id="image" class="form-control" accept="image/*">
                        </div>
                        <!-- từ vựng -->
                        <div class="form-group">
                            <label for="word">Từ vựng:</label>
                            <input type="text" name="word" id="word" class="form-control" value="{{ old('word') }}" required>
                        </div>
                        <!-- ipa -->
                        <div class="form-group">
                            <label for="ipa">IPA:</label>
                            <input type="text" name="ipa" id="ipa" class="form-control" value="{{ old('ipa') }}" required>
                        </div>
                        <!-- meaning -->
                        <div class="form-group">
                            <label for="meaning">Nghĩa:</label>
                            <input type="text" name="meaning" id="meaning" class="form-control" value="{{ old('meaning') }}" required>
                        </div>
                        <!-- example -->
                        <div class="form-group">
                            <label for="example">Ví dụ:</label>
                            <input type="text" name="example" id="example" class="form-control" value="{{ old('example') }}" required>
                        </div>

                        <input type="hidden" name="topic_id" value="{{ $topic_id }}">
                        <button type="submit" class="btn btn-primary">Thêm từ vựng</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Chỉnh sửa vocabulary -->
    <div class="modal" id="editvocabularyModal" tabindex="-1" role="dialog" aria-labelledby="editvocabularyLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editvocabularyLabel">Chỉnh sửa từ vựng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="editvocabularyForm">
                        @csrf
                        @method('PUT')
                        <!-- hình ảnh -->
                        <div class="form-group">
                            <label for="edit_image">Hình ảnh:</label>
                            <input type="file" name="image" id="edit_image" class="form-control" accept="image/*">
                            <img id="edit_current_image" src="" alt="Current Image" class="img-thumbnail mt-2" width="150">
                        </div>
                        <!-- Từ vựng -->
                        <div class="form-group">
                            <label for="edit_word">Từ vựng:</label>
                            <input type="text" name="word" id="edit_word" class="form-control" required>
                        </div>
                        <!-- ipa -->
                        <div class="form-group">
                            <label for="edit_ipa">IPA:</label>
                            <input type="text" name="ipa" id="edit_ipa" class="form-control" required>
                        </div>
                        <!-- meaning -->
                        <div class="form-group">
                            <label for="edit_meaning">Nghĩa:</label>
                            <input type="text" name="meaning" id="edit_meaning" class="form-control" required>
                        </div>
                        <!-- example -->
                        <div class="form-group">
                            <label for="edit_example">Ví dụ:</label>
                            <input type="text" name="example" id="edit_example" class="form-control" required>
                        </div>
                    
                        <!-- Trường ẩn để giữ giá trị topic_id -->
                        <input type="hidden" name="topic_id" id="edit_topic_id" value="{{ request('topic_id') }}">
                    
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
            $('#editvocabularyModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var word = button.data('word');
                var image = button.data('image');
                var ipa = button.data('ipa');
                var meaning = button.data('meaning');
                var example = button.data('example');
                
                // Lấy topic_id từ URL
                var urlParams = new URLSearchParams(window.location.search);
                var topicId = urlParams.get('topic_id');

                var modal = $(this);
                modal.find('#edit_current_image').attr('src', image);
                modal.find('#edit_word').val(word);
                modal.find('#edit_ipa').val(ipa);
                modal.find('#edit_meaning').val(meaning);
                modal.find('#edit_example').val(example);
                modal.find('#editvocabularyForm').attr('action', '/vocabularys/' + id);

                // Đặt topic_id vào trường ẩn trong form
                modal.find('#edit_topic_id').val(topicId);
            });

    </script>
</body>
</html>
