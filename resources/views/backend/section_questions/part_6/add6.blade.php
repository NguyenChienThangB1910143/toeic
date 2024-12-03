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
                    <!-- Text -->
                    <!-- Text (Rich Text Editor) -->
                    <div class="form-group">
                        <label for="text">Text:</label>
                        <textarea name="text" id="text" class="form-control" required>{{ old('text') }}</textarea>
                    </div>
                    @for ($i = 1; $i <= 4; $i++)
                    <h5 class="mt-3">Câu hỏi {{ $i }}</h5>
                    <div class="form-group">
                        <label for="questions[{{ $i }}][content]">Nội dung câu hỏi:</label>
                        <input type="text" name="questions[{{ $i }}][content]" id="questions[{{ $i }}][content]" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="questions[{{ $i }}][option1]">Đáp án A:</label>
                        <input type="text" name="questions[{{ $i }}][option1]" id="questions[{{ $i }}][option1]" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="questions[{{ $i }}][option2]">Đáp án B:</label>
                        <input type="text" name="questions[{{ $i }}][option2]" id="questions[{{ $i }}][option2]" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="questions[{{ $i }}][option3]">Đáp án C:</label>
                        <input type="text" name="questions[{{ $i }}][option3]" id="questions[{{ $i }}][option3]" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="questions[{{ $i }}][option4]">Đáp án D:</label>
                        <input type="text" name="questions[{{ $i }}][option4]" id="questions[{{ $i }}][option4]" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="questions[{{ $i }}][correct_option]">Đáp án đúng:</label>
                        <select name="questions[{{ $i }}][correct_option]" id="questions[{{ $i }}][correct_option]" class="form-control" required>
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
                    @endfor

                    <!-- Thêm nút hành động -->
                    <button type="submit" class="btn btn-primary">Thêm question</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        CKEDITOR.replace('text'); // Khởi tạo CKEditor cho trường 'text'
    });
</script>
