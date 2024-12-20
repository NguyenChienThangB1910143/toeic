<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('assets/css/QLmaterial.css') }}">
    <title>Material</title>
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-material">
            <h1 class="material-title">Material</h1>

            <!-- Hiển thị thông báo thành công -->
            @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
            @endif
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

            <div class="search-material">
                <input type="text" class="search-input" placeholder="Search..." />
                <button class="btn-add" data-toggle="modal" data-target="#addmaterialModal">Add material</button>
            </div>

            <!-- Bảng material -->
            <div class="table-container">
                <table class="table" id="materialTable">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>File</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($materials as $material)
                        <tr>
                            <td>{{ ($materials->currentPage() - 1) * $materials->perPage() + $loop->iteration }}</td>
                            <td>{{ $material->title }}</td>
                            <td>{{ $material->description }}</td>
                            <td><a class="view-button" href="{{ asset('storage/' . $material->file_pdf) }}"><i class="fa-solid fa-eye"></i></a></td>
                            <td>{{ $material->created_at }}</td>
                            <td>{{ $material->updated_at }}</td>
                            <td>                           
                                <button class="btn-edit" data-toggle="modal" data-target="#editmaterialModal"
                                        data-id="{{ $material->material_id }}"
                                        data-title="{{ $material->title }}"
                                        data-description="{{ $material->description }}"
                                        data-file="{{ asset('storage/' . $material->file) }}">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
    
                                <form action="{{ route('materials.destroy', $material->material_id) }}" method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center">Không có tài liệu nào.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <!-- Hiển thị liên kết phân trang -->
            <div class="pagination-links">
                {{ $materials->links() }}
            </div>
        </div>
    </div>

    <!-- Modal Thêm material -->
    <div class="modal" id="addmaterialModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Material</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('materials.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Tên material -->
                        <div class="form-group">
                            <label for="title">Title:</label>
                            <textarea name="title" id="title" class="form-control" value="{{ old('title') }}" required></textarea>
                        </div>

                        <!-- Mô tả (description) -->
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea name="description" id="description" class="form-control">{{ old('description') }}</textarea>
                        </div>

                        <!-- File -->
                        <div class="form-group">
                            <label for="file">File:</label>
                            <input type="file" name="file_pdf" id="file" class="form-control" accept="application/pdf" required>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal chỉnh sửa material -->
    <div class="modal" id="editmaterialModal" tabindex="-1" role="dialog" aria-labelledby="editmaterialLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editMaterialLabel">Edit Material</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('materials.update', 'material_id') }}" method="POST" enctype="multipart/form-data" id="editMaterialForm">
                        @csrf
                        @method('PUT')

                        <!-- Tên material -->
                        <div class="form-group">
                            <label for="edit_title">Title:</label>
                            <textarea name="title" id="edit_title" class="form-control" required></textarea>
                        </div>

                        <!-- Mô tả (description) -->
                        <div class="form-group">
                            <label for="edit_description">Description:</label>
                            <textarea name="description" id="edit_description" class="form-control" required></textarea>
                        </div>

                        <!-- File -->
                        <div class="form-group">
                            <label for="edit_file">File:</label>
                            <input type="file" name="file_pdf" id="edit_file" class="form-control" accept="application/pdf">
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <script>
        // Khi modal chỉnh sửa được mở
        $('#editmaterialModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var title = button.data('title');
            var description = button.data('description');
            var file_pdf = button.data('file');
            // if (file_pdf) {
            //     $('#current_image').attr('src', '/storage/' + question.image).show();
            // } else {
            //     $('#current_image').hide();
            // }
            var modal = $(this);
            modal.find('#edit_title').val(title);
            modal.find('#edit_description').val(description);
            modal.find('#edit_file').val(file_pdf);  // Đặt file cho modal, nếu muốn xử lý thêm

            // Cập nhật action cho form
            modal.find('#editMaterialForm').attr('action', '/materials/' + id);
        });
    </script>
</body>
</html>
