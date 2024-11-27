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

            <!-- Hiển thị thông báo -->
            @if (session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
            @endif

            @if (session('success'))
                <div id="success-message" class="alert alert-success">
                    {{ session('success') }}
                </div>
                <script>
                    setTimeout(() => {
                        const successMessage = document.getElementById('success-message');
                        if (successMessage) {
                            successMessage.style.opacity = '0';
                            setTimeout(() => successMessage.remove(), 1000);
                        }
                    }, 3000);
                </script>
            @endif

            <!-- Thanh tìm kiếm và nút thêm -->
            <div class="search-section">
                <input type="text" class="search-input" placeholder="Tìm kiếm section..." id="searchsectionInput" onkeyup="filtersections()" />
                <button class="btn-add" data-toggle="modal" data-target="#addsectionModal">Thêm section</button>
            </div>

            <!-- Bảng danh sách sections -->
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
                                <td>
                                    <img src="{{ $section->image ? asset('storage/' . $section->image) : asset('assets/images/default.png') }}" 
                                         alt="Image" 
                                         class="table-image" 
                                         width="100" 
                                         height="100">
                                </td>
                                <td>{{ $section->description }}</td>
                                <td>{{ ucfirst($section->type) }}</td>
                                <td>
                                    <button class="btn-edit" data-toggle="modal" data-target="#editsectionModal"
                                        data-id="{{ $section->section_id }}"
                                        data-name="{{ $section->name }}"
                                        data-description="{{ $section->description }}"
                                        data-type="{{ $section->type }}"
                                        data-image="{{ $section->image }}">
                                        <i class="fa fa-pen-to-square"></i>
                                    </button>
                                    <form action="{{ route('sections.destroy', $section->section_id) }}" method="POST" style="display:inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                            <i class="fa fa-trash-can"></i>
                                        </button>
                                    </form>
                                </td>
                                <td>
                                    <a href="{{ route('qllesson', ['section_id' => $section->section_id]) }}" class="btn-manage lessonBtn">Lesson</a>
                                    <a href="{{ route('qlsection_question', ['section_id' => $section->section_id, 'type' => $section->type]) }}" class="btn-manage questionBtn">Question</a>
                                    <button class="btn-manage testBtn">Test</button>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="7" class="text-center">Không có sections nào.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Phân trang -->
            <div class="pagination-links">
                {{ $sections->links() }}
            </div>
        </div>
    </div>

    <!-- Modal Thêm section -->
    @include('backend.sections.modals.add')

    <!-- Modal Chỉnh sửa section -->
    @include('backend.sections.modals.edit')

    <!-- Thư viện JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script>
        // Hàm lọc section
        function filtersections() {
            const input = document.getElementById('searchsectionInput').value.toLowerCase();
            const rows = document.querySelectorAll('#sectionTable tbody tr');
            rows.forEach(row => {
                const sectionName = row.cells[1]?.textContent.toLowerCase() || '';
                row.style.display = sectionName.includes(input) ? '' : 'none';
            });
        }

        // Hiển thị modal chỉnh sửa
        $('#editsectionModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);  // Nút bấm gọi modal
            var id = button.data('id');
            var name = button.data('name');
            var description = button.data('description');
            var type = button.data('type');
            var image = button.data('image');  // Đường dẫn ảnh cũ

            var modal = $(this);
            modal.find('#edit_name').val(name);
            modal.find('#edit_description').val(description);
            modal.find('#edit_type').val(type);
            modal.find('#editsectionForm').attr('action', '/sections/' + id);

            // Hiển thị ảnh hiện tại
            var imageUrl = image ? '/storage/' + image : '/assets/images/default.png';  // Đảm bảo ảnh mặc định
            modal.find('#current_image').attr('src', imageUrl);
        });

        
    </script>
</body>
</html>
