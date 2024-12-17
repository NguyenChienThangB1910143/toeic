<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <title>Quản Lý Grammar Content</title>
    <link rel="stylesheet" href="{{ asset('assets/css/QLGrammarContent.css') }}">
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-grammar_content">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="{{ route('qlgrammar') }}">Grammar</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Content</li>
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
                <input type="text" class="search-input" placeholder="Search content..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addcontentModal">Add content</button>
            </div>
            <!-- Bảng grammars_contents -->
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
                    @forelse($grammar_contents as $content)
                    <tr>
                        <td>{{ ($grammar_contents->currentPage() - 1) * $grammar_contents->perPage() + $loop->iteration }}</td>
                        <td>{{ $content->title }}</td>
                        <td>{{ $content->content }}</td>
                        <td>{{ $content->created_at }}</td>
                        <td>{{ $content->updated_at }}</td>
                        <td>
                            <button class="btn-edit" data-toggle="modal" data-target="#editcontentModal"
                                data-id="{{ $content->content_id }}"
                                data-title="{{ $content->title }}"
                                data-content="{{ $content->content }}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <form action="{{ route('grammar_contents.destroy', ['grammar_content' => $content->content_id, 'grammar_id' => request()->grammar_id]) }}" method="POST" style="display:inline;">
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
        <div class="pagination-links">{{ $grammar_contents->links() }}</div>
    </div>
            
    <!-- Modal Thêm grammar_content -->
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
                    <form action="{{ route('grammar_contents.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- title -->
                        <div class="form-group">
                            <label for="title">Tiêu đề:</label>
                            <input type="text" name="title" id="title" class="form-control" value="{{ old('title') }}" required>
                        </div>

                        <!-- grammar_content -->
                        <div class="form-group">
                            <label for="content">Nội dung:</label>
                            <textarea name="content" id="content" class="form-control" rows="4" required>{{ old('content') }}</textarea>
                        </div>

                        <input type="hidden" name="grammar_id" value="{{ $grammar_id }}">
                        <button type="submit" class="btn btn-primary">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Chỉnh sửa grammar_content -->
    <div class="modal" id="editcontentModal" tabindex="-1" role="dialog" aria-labelledby="editcontentLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editcontentLabel">CHỈNH SỬA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="editcontentForm">
                        @csrf
                        @method('PUT')
                        
                        <!-- Tiêu đề grammar_content -->
                        <div class="form-group">
                            <label for="edit_title">Tiêu đề:</label>
                            <input type="text" name="title" id="edit_title" class="form-control" required>
                        </div>
                        <!-- Nội dung grammar_content -->
                        <div class="form-group">
                            <label for="edit_content">Nội dung:</label>
                            <textarea name="content" id="edit_content" class="form-control" rows="4" required></textarea>
                        </div>

                        <!-- Trường ẩn để giữ giá trị grammar_id -->
                        <input type="hidden" name="grammar_id" id="edit_grammar_id" value="{{ request('grammar_id') }}">
                    
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

                // Lấy grammar_id từ URL
                var urlParams = new URLSearchParams(window.location.search);
                var grammarId = urlParams.get('grammar_id');

                var modal = $(this);
                modal.find('#edit_title').val(title);
                modal.find('#edit_content').val(content);
                modal.find('#editcontentForm').attr('action', '/grammar_contents/' + id);

                // Đặt grammar_id vào trường ẩn trong form
                modal.find('#edit_grammar_id').val(grammarId);
            });
    </script>
</body>
</html>
