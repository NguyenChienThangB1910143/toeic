<div class="modal" id="addquestionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm Question mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('section_questions.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="section_id" id="section_id" value="{{ $section_id }}">

                    <!-- Text -->
                    <div class="form-group">
                        <label for="text">Text:</label>
                        <textarea name="text" id="text" class="form-control" required>{{ old('text') }}</textarea>
                    </div>

                    <!-- Chọn số lượng câu hỏi -->
                    <div class="form-group">
                        <label for="question_count">Số lượng câu hỏi:</label>
                        <select name="question_count" id="question_count" class="form-control" required>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
            
                    <!-- Câu hỏi sẽ được hiển thị tại đây -->
                    <div id="questions_container"></div>

                    <!-- Thêm nút hành động -->
                    <button type="submit" class="btn btn-primary">Thêm Question</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Khởi tạo CKEditor cho trường 'text'
    document.addEventListener("DOMContentLoaded", function() {
        CKEDITOR.replace('text'); // Khởi tạo CKEditor cho trường 'text'
    });

    // Hàm tạo trường nhập liệu cho câu hỏi
    function generateQuestionFields(count) {
        var container = $('#questions_container');
        container.empty(); // Xóa các câu hỏi hiện tại

        // Tạo số lượng câu hỏi dựa trên giá trị người dùng chọn
        for (var i = 1; i <= count; i++) {
            var questionHtml = `
                <h5 class="mt-3">Câu hỏi ${i}</h5>
                <div class="form-group">
                    <label for="questions[${i}][content]">Nội dung câu hỏi:</label>
                    <input type="text" name="questions[${i}][content]" id="questions[${i}][content]" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="questions[${i}][option1]">Đáp án A:</label>
                    <input type="text" name="questions[${i}][option1]" id="questions[${i}][option1]" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="questions[${i}][option2]">Đáp án B:</label>
                    <input type="text" name="questions[${i}][option2]" id="questions[${i}][option2]" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="questions[${i}][option3]">Đáp án C:</label>
                    <input type="text" name="questions[${i}][option3]" id="questions[${i}][option3]" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="questions[${i}][option4]">Đáp án D:</label>
                    <input type="text" name="questions[${i}][option4]" id="questions[${i}][option4]" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="questions[${i}][correct_option]">Đáp án đúng:</label>
                    <select name="questions[${i}][correct_option]" id="questions[${i}][correct_option]" class="form-control" required>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="questions[${i}][script]">Script:</label>
                    <input type="text" name="questions[${i}][script]" id="questions[${i}][script]" class="form-control" required>
                </div>
            `;
            container.append(questionHtml);
        }
    }

   // Lắng nghe sự kiện thay đổi số lượng câu hỏi
$('#question_count').on('change', function() {
    var questionCount = $(this).val();
    generateQuestionFields(questionCount); // Tạo lại các câu hỏi theo số lượng đã chọn
});

// Tạo trường câu hỏi ban đầu khi mở modal
$(document).on('shown.bs.modal', function() {
    var questionCount = $('#question_count').val();
    generateQuestionFields(questionCount); // Tạo câu hỏi theo số lượng mặc định
});

</script>
