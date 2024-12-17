<div class="modal" id="editquestionModal" tabindex="-1" role="dialog" aria-labelledby="editquestionLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editquestionLabel">Chỉnh Sửa Question</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editquestionForm" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <!-- Content -->
                    <div class="form-group">
                        <label for="edit_content">Content:</label>
                        <input type="text" name="content" id="edit_content" class="form-control" required>
                    </div>

                    <!-- Options -->
                    @foreach(['A' => 'option1', 'B' => 'option2', 'C' => 'option3'] as $key => $option)
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
                        </select>
                    </div>
                    <!-- Audio -->
                    <div class="form-group">
                        <label for="edit_audio">Audio:</label>
                        <input type="file" name="audio" id="edit_audio" class="form-control" accept="audio/*">
                        <audio id="current_audio" controls class="mt-2"></audio>
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
   $('#editquestionModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var questionId = button.data('id');

    if (!questionId) {
        alert('Không thể xác định câu hỏi.');
        return;
    }

    $.ajax({
        url: '/section_questions/' + questionId + '/edit',
        method: 'GET',
        success: function(response) {
            const question = response.question;

            $('#edit_content').val(question.content);
            $('#edit_option1').val(question.option1);
            $('#edit_option2').val(question.option2);
            $('#edit_option3').val(question.option3);
            $('#edit_option4').val(question.option4);
            $('#edit_correct_option').val(question.correct_option);
            $('#edit_script').val(question.script);
            $('#edit_section_id').val(question.section_id);

            if (question.image) {
                $('#current_image').attr('src', '/storage/' + question.image).show();
            } else {
                $('#current_image').hide();
            }

            if (question.audio) {
                $('#current_audio').attr('src', '/storage/' + question.audio).show();
            } else {
                $('#current_audio').hide();
            }

            $('#editquestionForm').attr('action', '/section_questions/' + questionId);
        },
        error: function() {
            alert('Đã xảy ra lỗi khi tải thông tin câu hỏi.');
        }
    });
});
</script>
