<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/css/QLSection.css') }}">
    <title>Quản lý Section</title>
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-section">
            <h1 class="section-title">Quản Lý Section</h1>

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

            <div class="search-section">
                <input type="text" class="search-input" placeholder="Tìm kiếm section..." id="searchsectionInput" onkeyup="filtersections()"/>
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addsectionModal">Thêm section</button>
            </div>

            <!-- Bảng section -->
            <div class="table-container">

                <table class="table" id="sectionTable">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên section</th>
                            <th>Hình ảnh</th>
                            <th>Mô tả</th>
                            <th>Loại</th>
                            <th>Hành động</th>
                            <th>Quản lý</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        @forelse($sections as $section)
                        <tr>
                            <td>{{ ($sections->currentPage() - 1) * $sections->perPage() + $loop->iteration }}</td>
                            <td>{{ $section->name }}</td>
                            <td><img src="{{ asset('storage/' . $section->image) }}" alt="Image" class="table-image" width="100" height="100"></td>
                            <td>{{ $section->description }}</td>
                            <td>{{ $section->type }}</td>
                            <td>
                                <button class="btn-edit" data-toggle="modal" data-target="#editsectionModal"
                                    data-id="{{ $section->section_id }}"
                                    data-name="{{ $section->name }}"
                                    data-description="{{ $section->description }}"
                                    data-type="{{ $section->type }}"
                                    data-image="{{ $section->image }}">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <form action="{{ route('sections.destroy', $section->section_id) }}" method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                            </td>
                            <td>
                                <a href="{{ route('qllesson', ['section_id' => $section->section_id]) }}" class="btn-manage lessonBtn">Lesson</a>
                                <a href="{{ route('qlsection_question', ['section_id' => $section->section_id]) }}" class="btn-manage questionBtn">Question</a>
                                <button class="btn-manage testBtn"> Test </button>
                                {{-- <a href="{{ route('qltest', ['section_id' => $section->section_id]) }}" class="btn-manage testBtn">Test</a> --}}
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center">Không có sections nào.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <!-- Hiển thị liên kết phân trang -->
            <div class="pagination-links">
                {{ $sections->links() }}
            </div>
        </div>
    </div>

    <!-- Modal Thêm section -->
    <div class="modal" id="addsectionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm section mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('sections.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Tên section -->
                        <div class="form-group">
                            <label for="name">Tên section:</label>
                            <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
                        </div>

                        <!-- Ảnh section -->
                        <div class="form-group">
                            <label for="image">Ảnh:</label>
                            <input type="file" name="image" id="image" class="form-control" accept="image/*" required>
                        </div>

                        <!-- Loại của section -->
                        <div class="form-group">
                            <label for="type">Loại section:</label>
                            <select name="type" id="type" class="form-control" required>
                                <option value="listening" {{ old('type') == 'listening' ? 'selected' : '' }}>Listening</option>
                                <option value="reading" {{ old('type') == 'reading' ? 'selected' : '' }}>Reading</option>
                            </select>
                        </div>                        

                        <!-- Mô tả (description) -->
                        <div class="form-group">
                            <label for="description">Mô Tả:</label>
                            <textarea name="description" id="description" class="form-control">{{ old('description') }}</textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Thêm section</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Chỉnh sửa section -->
    <div class="modal" id="editsectionModal" tabindex="-1" role="dialog" aria-labelledby="editsectionLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editsectionLabel">Chỉnh Sửa section</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('sections.update', 'section_id') }}" method="POST" enctype="multipart/form-data" id="editsectionForm">
                        @csrf
                        @method('PUT')

                        <!-- Tên section -->
                        <div class="form-group">
                            <label for="edit_name">Tên section:</label>
                            <input type="text" name="name" id="edit_name" class="form-control" required>
                        </div>


                        <!-- Ảnh section (nếu người dùng muốn thay đổi) -->
                        <div class="form-group">
                            <label for="edit_image">Ảnh Mới:</label>
                            <input type="file" name="image" id="edit_image" class="form-control" accept="image/*">
                            <img id="current_image" src="" alt="Current Image" class="img-thumbnail" width="150">
                        </div>

                        <!-- Loại của section -->
                        <div class="form-group">
                            <label for="edit_type">Loại section:</label>
                            <select name="type" id="edit_type" class="form-control" required>
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
        $('#editsectionModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var name = button.data('name');
            var description = button.data('description');
            var type = button.data('type');
            var image = button.data('image'); // Dữ liệu ảnh cũ

            var modal = $(this);
            modal.find('#edit_name').val(name);
            modal.find('#edit_description').val(description);
            modal.find('#edit_type').val(type);
            modal.find('#editsectionForm').attr('action', '/sections/' + id);

            // Cập nhật đường dẫn hình ảnh cũ
            if (image) {
                modal.find('#current_image').attr('src', '/storage/' + image);
            } else {
                modal.find('#current_image').attr('src', '/path/to/default-image.jpg'); // Đặt ảnh mặc định nếu không có ảnh
            }
        });

        function filtersections() {
            const input = document.getElementById('searchsectionInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('sectionTable');
            const trs = table.getElementsByTagName('tr');

            for (let i = 1; i < trs.length; i++) {
                const sectionnameCell = trs[i].getElementsByTagName('td')[1]; // Cột chứa section name
                if (sectionnameCell) {
                    const txtValue = sectionnameCell.textContent || sectionnameCell.innerText;
                    trs[i].style.display = txtValue.toLowerCase().indexOf(filter) > -1 ? '' : 'none';
                }
            }
        }
    </script>
</body>
</html>
