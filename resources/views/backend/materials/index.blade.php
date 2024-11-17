<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('assets/css/QLmaterial.css') }}">
    <title>Quản lý material</title>
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-material">
            <h1 class="material-title">Quản Lý material</h1>

            <!-- Thông báo lỗi hoặc thành công -->
            @if (session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            <div class="search-add">
                <input type="text" class="search-input" placeholder="Tìm kiếm material..." />
                <button class="btn-add" id="addmaterialBtn">Thêm material</button>
            </div>

            <!-- Modal thêm material -->
            <div class="overlay" id="addModal" style="display: none;">
                <div class="modal-content">
                    <span class="btn-close" id="closeModal">X</span>
                    <h2>Thêm material</h2>
                    <form id="materialForm" action="{{ route('materials.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-columns">
                            <div class="form-group">
                                <label for="material-name">Tên material</label>
                                <input type="text" id="material-name" name="name" required />
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả</label>
                                <textarea id="description" name="description" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="material-file">File</label>
                                <input type="file" id="material-file" name="file" accept="file/*" required />
                            </div>
                            
                        </div>
                        <button type="submit" class="btn-add-material">Thêm material</button>
                    </form>
                </div>
            </div>

            <!-- Bảng material -->
            <table class="table">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên material</th>
                        <th>Mô tả</th>
                        <th>File</th>
                        <th>Thêm</th>
                        <th>Cập nhật</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($materials as $material)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $material->name }}</td>
                        <td>{{ $material->description }}</td>
                        <td><img src="{{ asset('storage/' . $material->file) }}" alt="File" class="table-file" width="100" height="100"></td>
                        <td>{{ $material->created_at }}</td>
                        <td>{{ $material->updated_at }}</td>
                        <td>
                            <a href="{{ route('materials.edit', $material->id) }}" class="btn-edit"><i class="fa-solid fa-pen-to-square"></i></a>
                            <form action="{{ route('materials.destroy', $material->id) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"><i class="fa-solid fa-trash-can"></i></button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">Không có materials nào.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const addmaterialBtn = document.getElementById("addmaterialBtn");
            const addModal = document.getElementById("addModal");
            const closeModal = document.getElementById("closeModal");

            addmaterialBtn.addEventListener("click", () => {
                addModal.style.display = "flex";
            });

            closeModal.addEventListener("click", () => {
                addModal.style.display = "none";
            });

            window.addEventListener("click", (event) => {
                if (event.target === addModal) {
                    addModal.style.display = "none";
                }
            });
        });
    </script>
</body>
</html>
