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
                    <div class="d-flex">
                        <div class="form-left">
                            <!-- Content -->
                            <div class="form-group">
                                <label for="edit_content">Content:</label>
                                <textarea name="content" id="edit_content" class="form-control" value="{{ old('content') }}" required></textarea>
                            </div>
                            <!-- Script -->
                            <div class="form-group">
                                <label for="edit_script">Script:</label>
                                <textarea name="script" id="edit_script" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-right">
                            <!-- Options -->
                            @foreach(['A' => 'option1', 'B' => 'option2', 'C' => 'option3', 'D' => 'option4'] as $key => $option)
                            <div class="form-group">
                                <label for="edit_{{ $option }}">Option {{ $key }}:</label>
                                <textarea
                                    name="{{ $option }}" 
                                    id="edit_{{ $option }}" 
                                    class="form-control" 
                                    value="{{ old('option') }}" 
                                    required></textarea>
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
                        </div>
                    </div>
                    
                    <input type="hidden" name="section_id" id="edit_section_id">
                    <input type="hidden" name="type" value="{{ request()->type }}">

                    <!-- Nút hành động -->
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary mx-2">Save</button>
                        <button type="button" class="btn btn-secondary mx-2" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<style>
    .modal-body .d-flex {
    display: flex;
    gap: 20px;
    }

    .form-left, .form-right {
        flex: 1;
    }

    .form-left {
        padding-right: 10px;
        border-right: 1px solid #ccc;
    }

    .form-right {
        padding-left: 10px;
    }
    .modal-content {
        max-width: 700px !important;
    }
</style>
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

            $('#editquestionForm').attr('action', '/section_questions/' + questionId);
        },
        error: function() {
            alert('Đã xảy ra lỗi khi tải thông tin câu hỏi.');
        }
    });
});

</script>
