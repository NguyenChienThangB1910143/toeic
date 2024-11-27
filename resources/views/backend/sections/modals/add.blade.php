<div class="modal" id="addsectionModal" tabindex="-1" role="dialog" aria-labelledby="addSectionLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSectionLabel">Thêm section mới</h5>
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
                            <option value="part_1" {{ old('type') == 'part_1' ? 'selected' : '' }}>Part 1 - Mô Tả Hình Ảnh (Listening)</option>
                            <option value="part_2" {{ old('type') == 'part_2' ? 'selected' : '' }}>Part 2 - Hỏi Đáp (Listening)</option>
                            <option value="part_3" {{ old('type') == 'part_3' ? 'selected' : '' }}>Part 3 - Hội Thoại Ngắn (Listening)</option>
                            <option value="part_4" {{ old('type') == 'part_4' ? 'selected' : '' }}>Part 4 - Bài Nói Ngắn (Listening)</option>
                            <option value="part_5" {{ old('type') == 'part_5' ? 'selected' : '' }}>Part 5 - Hoàn Thành Câu (Reading)</option>
                            <option value="part_6" {{ old('type') == 'part_6' ? 'selected' : '' }}>Part 6 - Hoàn Thành Đoạn Văn (Reading)</option>
                            <option value="part_7" {{ old('type') == 'part_7' ? 'selected' : '' }}>Part 7 - Đọc Hiểu (Reading)</option>
                        </select>
                    </div>

                    <!-- Mô tả (description) -->
                    <div class="form-group">
                        <label for="description">Mô Tả:</label>
                        <textarea name="description" id="description" class="form-control">{{ old('description') }}</textarea>
                    </div>

                    <!-- Nút hành động -->
                    <button type="submit" class="btn btn-primary">Thêm section</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>
