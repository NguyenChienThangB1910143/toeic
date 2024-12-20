<div class="modal fade" id="editquestionModal" tabindex="-1" role="dialog" aria-labelledby="editquestionLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editquestionLabel">Edit Question</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editquestionForm" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <!-- text -->
                    <div class="form-group">
                        <label for="edit_group_text">Group Text:</label>
                        <textarea type="text" name="text" id="edit_group_text" class="form-control" value="" placeholder="Nhập text nhóm câu hỏi"></textarea>
                    </div>
                    <!-- Content -->
                    <div class="form-group">
                        <label for="edit_content">Content:</label>
                        <input type="text" name="content" id="edit_content" class="form-control" value="" required>
                    </div>
                    <!-- Options -->
                    @foreach(['A' => 'option1', 'B' => 'option2', 'C' => 'option3', 'D' => 'option4'] as $key => $option)
                        <div class="form-group">
                            <label for="edit_{{ $option }}">Option {{ $key }}:</label>
                            <input 
                                type="text" 
                                name="{{ $option }}" 
                                id="edit_{{ $option }}" 
                                class="form-control" 
                                value="" 
                                required>

                        </div>
                        @endforeach

                    <!-- Correct Option -->
                    <div class="form-group">
                        <label for="edit_correct_option">Correct Option:</label>
                        <select name="correct_option" id="edit_correct_option" class="form-control" required>
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
                    
                    <input type="hidden" name="section_id" id="edit_section_id">
                    <input type="hidden" name="type" value="{{ request()->type }}">

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Đảm bảo CKEditor được khởi tạo khi trang tải xong
    document.addEventListener("DOMContentLoaded", function() {
        CKEDITOR.replace('edit_group_text'); // Khởi tạo CKEditor cho trường 'edit_group_text'
    });

    // Khi modal mở, sẽ điền dữ liệu vào các trường và khởi tạo lại CKEditor
    $('#editquestionModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button mở modal
        var questionId = button.data('id');  // Lấy ID câu hỏi từ button

        if (!questionId) {
            alert('Không thể xác định câu hỏi.');
            return;
        }

        // Gửi yêu cầu AJAX để lấy thông tin câu hỏi
        $.ajax({
            url: '/section_questions/' + questionId + '/edit',
            method: 'GET',
            success: function(response) {
                if (response) {
                    // Điền dữ liệu vào các trường input
                    CKEDITOR.instances['edit_group_text'].setData(response.group_text); // Cập nhật nội dung cho CKEditor
                    $('#edit_content').val(response.question.content); // Nội dung câu hỏi
                    $('#edit_option1').val(response.question.option1); // Đáp án A
                    $('#edit_option2').val(response.question.option2); // Đáp án B
                    $('#edit_option3').val(response.question.option3); // Đáp án C
                    $('#edit_option4').val(response.question.option4); // Đáp án D
                    $('#edit_correct_option').val(response.question.correct_option); // Đáp án đúng
                    $('#edit_section_id').val(response.question.section_id); // Section ID

                    // Cập nhật URL form để submit đúng endpoint
                    $('#editquestionForm').attr('action', '/section_questions/' + questionId);
                } else {
                    alert('Không thể tải thông tin câu hỏi.');
                }
            },
            error: function() {
                alert('Đã xảy ra lỗi khi tải thông tin câu hỏi.');
            }
        });

        // Khởi tạo lại CKEditor mỗi lần mở modal
        CKEDITOR.replace('edit_group_text');
    });
</script>

