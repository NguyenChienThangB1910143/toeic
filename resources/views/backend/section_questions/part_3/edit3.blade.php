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
                    <!-- Audio chung cho cả nhóm -->
                    <div class="form-top">
                            <!-- Audio -->
                            <div class="form-group">
                                <label for="edit_audio">Audio:</label>
                                <input type="file" name="audio" id="edit_audio" class="form-control" accept="audio/*">
                                <audio id="current_audio" controls class="mt-2"></audio>
                            </div>
                            <!-- Script -->
                            <div class="form-group">
                                <label for="edit_script">Script:</label>
                                <textarea name="script" id="edit_script" class="form-control"></textarea>
                            </div>
                    </div>
                    <div class="form-bottom">
                        <div class="d-flex">
                        <!-- Loop qua các câu hỏi -->
                        @for ($i = 0; $i < 3; $i++)
                        <div class="question-group">
                            <h6>Question {{ $i + 1 }}</h6>
                            <!-- Các input cho câu hỏi -->
                            <div class="form-group">
                                <label for="edit_content_{{ $i }}">Content:</label>
                                <textarea 
                                    name="questions[{{ $i }}][content]" 
                                    id="edit_content_{{ $i }}" 
                                    class="form-control" 
                                    required></textarea>
                            </div>
                            <div class="form-group">
                                <div>
                                    <label for="edit_option1_{{ $i }}">Opt A:</label>
                                    <textarea 
                                        name="questions[{{ $i }}][option1]" 
                                        id="edit_option1_{{ $i }}" 
                                        class="form-control" 
                                        required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="edit_option2_{{ $i }}">Opt B:</label>
                                    <textarea 
                                        name="questions[{{ $i }}][option2]" 
                                        id="edit_option2_{{ $i }}" 
                                        class="form-control" 
                                        required></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div >
                                    <label for="edit_option3_{{ $i }}">Opt C:</label>
                                    <textarea 
                                        name="questions[{{ $i }}][option3]" 
                                        id="edit_option3_{{ $i }}" 
                                        class="form-control" 
                                        required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="edit_option4_{{ $i }}">Opt D:</label>
                                    <textarea 
                                        name="questions[{{ $i }}][option4]" 
                                        id="edit_option4_{{ $i }}" 
                                        class="form-control" 
                                        required></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_correct_option_{{ $i }}">Correct Option:</label>
                                <select name="questions[{{ $i }}][correct_option]" id="edit_correct_option_{{ $i }}" class="form-control" required>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="D">D</option>
                                </select>
                            </div>
                        </div>
                        <hr>
                        @endfor
                    </div>
                    <input type="hidden" name="section_id" id="edit_section_id">
                    <input type="hidden" name="type" value="{{ request()->type }}">

                    <!-- Nút hành động -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary mx-2">Save</button>
                        <button type="button" class="btn btn-secondary mx-2" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
   $('#editquestionModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Nút mở modal
    var questionId = button.data('id'); // Lấy ID câu hỏi từ nút

    if (!questionId) {
        alert('Không thể xác định câu hỏi.');
        return;
    }

    $.ajax({
        url: '/section_questions/' + questionId + '/edit',
        method: 'GET',
        success: function(response) {
            const question = response.question;
            const groupQuestions = response.group_questions;

            // Gán thông tin nhóm (nếu có)
            $('#edit_script').val(question.script);
            $('#edit_section_id').val(question.section_id);
            // $('#edit_audio').on('change', function() {
            //     const fileName = this.files[0] ? this.files[0].name : '';
            //     $('#current_audio').hide(); // Ẩn audio hiện tại
            //     alert('Tệp mới: ' + fileName);
            // });

            // Gán dữ liệu audio (nếu có)
            if (response.audio) {
                $('#current_audio').attr('src', response.audio).show();
            } else {
                $('#current_audio').hide();
            }

            // Gán dữ liệu các câu hỏi trong nhóm (Part 3)
            groupQuestions.forEach((groupQuestion, index) => {
                $('#edit_content_' + index).val(groupQuestion.content);
                $('#edit_option1_' + index).val(groupQuestion.option1);
                $('#edit_option2_' + index).val(groupQuestion.option2);
                $('#edit_option3_' + index).val(groupQuestion.option3);
                $('#edit_option4_' + index).val(groupQuestion.option4);
                $('#edit_correct_option_' + index).val(groupQuestion.correct_option);
            });

            // Gán URL action cho form
            $('#editquestionForm').attr('action', '/section_questions/' + questionId);
        },
        error: function() {
            alert('Đã xảy ra lỗi khi tải thông tin câu hỏi.');
        }
    });
});

</script>
