<div class="modal" id="addquestionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm question mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('section_questions.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="section_id" id="section_id" value="{{ $section_id }}">
                    <!-- Content -->
                    <div class="form-group">
                        <label for="content">Content:</label>
                        <input type="text" name="content" id="content" class="form-control" value="{{ old('content') }}" required>
                    </div>

                    <!-- Hình ảnh -->
                    <div class="form-group">
                        <label for="image">Hình ảnh:</label>
                        <input type="file" name="image" id="image" class="form-control" accept="image/*" required>
                    </div>

                    <!-- Audio -->
                    <div class="form-group">
                        <label for="audio">Âm thanh:</label>
                        <input type="file" name="audio" id="audio" class="form-control" accept="audio/*">
                    </div>

                    <!-- Đáp án A -->
                    <div class="form-group">
                        <label for="option1">Đáp án A:</label>
                        <input type="text" name="option1" id="option1" class="form-control" value="{{ old('option1') }}" required>
                    </div>

                    <!-- Đáp án B -->
                    <div class="form-group">
                        <label for="option2">Đáp án B:</label>
                        <input type="text" name="option2" id="option2" class="form-control" value="{{ old('option2') }}" required>
                    </div>

                    <!-- Đáp án C -->
                    <div class="form-group">
                        <label for="option3">Đáp án C:</label>
                        <input type="text" name="option3" id="option3" class="form-control" value="{{ old('option3') }}" required>
                    </div>

                    <!-- Đáp án D -->
                    <div class="form-group">
                        <label for="option4">Đáp án D:</label>
                        <input type="text" name="option4" id="option4" class="form-control" value="{{ old('option4') }}" required>
                    </div>

                    <!-- Đáp án đúng -->
                    <div class="form-group">
                        <label for="correct_option">Đáp án đúng:</label>
                        <select name="correct_option" id="correct_option" class="form-control" required>
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                        </select>
                    </div>
                    <!-- script -->
                    <div class="form-group">
                        <label for="script">Script:</label>
                        <input type="text" name="script" id="script" class="form-control" value="{{ old('script') }}" required>
                    </div>

                    <!-- Thêm nút hành động -->
                    <button type="submit" class="btn btn-primary">Thêm question</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>
