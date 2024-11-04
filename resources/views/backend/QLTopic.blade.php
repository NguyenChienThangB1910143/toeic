<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/Backend/asser/css/QLTopic.css">
    <title>Topic</title>
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-topic">
            <h1 class="topic-title">Quản Lý Topic</h1>
            <div class="search-add">
                <input type="text" class="search-input" placeholder="Tìm kiếm topic..." />
                <button class="btn-add" id="addTopicBtn">Thêm topic</button>
            </div>

            <!-- Modal thêm topic -->
            <div class="overlay" id="addModal" style="display: none;">
                <div class="modal-content">
                    <span class="btn-close" id="closeModal">×</span>
                    <h2>Thêm Topic</h2>
                    <form id="topicForm" action="{{ route('topics.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-columns">
                            <div class="formleft">
                                <div class="form-group">
                                    <label for="topic-name">Tên Topic:</label>
                                    <input type="text" id="topic-name" name="name" required />
                                </div>
                                <div class="form-group">
                                    <label for="topic-image">Hình ảnh:</label>
                                    <input type="file" id="topic-image" name="image" accept="image/*" required />
                                </div>
                                <div class="form-group">
                                    <label for="topic-status">Mô tả:</label>
                                    <textarea id="topic-status" name="topic_status" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="topic-type">Loại:</label>
                                    <select id="topic-type" name="topic_type" required>
                                        <option value="listening">Listening</option>
                                        <option value="reading">Reading</option>
                                        <option value="grammar">Grammar</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn-add-topic">Thêm Topic</button>
                    </form>
                </div>
            </div>

            <!-- Bảng topic -->
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên Topic</th>
                        <th>Image</th>
                        <th>Mô tả</th>
                        <th>Kỹ năng</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($topics as $topic)
                    <tr>
                        <td>{{ $topic->topic_id }}</td>
                        <td>{{ $topic->name }}</td>
                        <td><img src="{{ asset('storage/' . $topic->image) }}" alt="Image" class="table-image" width="100" height="100"></td>
                        <td>{{ $topic->topic_status }}</td>
                        <td>{{ $topic->topic_type }}</td>
                        <td>
                            <button class="btn-edit" id="editTopicBtn">Chỉnh Sửa</button>
                            <button class="btn-delete" id="deleteTopicBtn">Xóa</button>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const addTopicBtn = document.getElementById("addTopicBtn");
            const addModal = document.getElementById("addModal");
            const closeModal = document.getElementById("closeModal");

            addTopicBtn.addEventListener("click", () => {
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

        // Đóng modal khi nhấp ra ngoài nội dung modal
        [addModal, editModal, deleteModal].forEach(modal => {
            modal.addEventListener("click", (e) => {
                if (e.target === modal) {
                    modal.style.display = "none";
                }
            });
        });
    </script>
</body>
</html>
