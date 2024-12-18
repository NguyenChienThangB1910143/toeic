<div class="modal fade" id="addquestionModal" tabindex="-1" role="dialog" aria-labelledby="addQuestionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addQuestionModalLabel">Add Question</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Audio chung cho cả nhóm -->
                <div class="form-group">
                    <label for="audio">Âm thanh:</label>
                    <input type="file" name="audio" id="audio" class="form-control" accept="audio/*">
                </div>

                <!-- Loop qua các câu hỏi -->
                @for ($i = 0; $i < 3; $i++)
                <div class="question-group">
                    <h6>Câu hỏi {{ $i + 1 }}</h6>
                    <!-- Các input cho câu hỏi -->
                    <div class="form-group">
                        <label for="content_{{ $i }}">Nội dung:</label>
                        <input type="text" name="questions[{{ $i }}][content]" id="content_{{ $i }}" class="form-control" required>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="option1_{{ $i }}">Đáp án A:</label>
                            <input type="text" name="questions[{{ $i }}][option1]" id="option1_{{ $i }}" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label for="option2_{{ $i }}">Đáp án B:</label>
                            <input type="text" name="questions[{{ $i }}][option2]" id="option2_{{ $i }}" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="option3_{{ $i }}">Đáp án C:</label>
                            <input type="text" name="questions[{{ $i }}][option3]" id="option3_{{ $i }}" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label for="option4_{{ $i }}">Đáp án D:</label>
                            <input type="text" name="questions[{{ $i }}][option4]" id="option4_{{ $i }}" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="correct_option_{{ $i }}">Đáp án đúng:</label>
                        <select name="questions[{{ $i }}][correct_option]" id="correct_option_{{ $i }}" class="form-control" required>
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="script_{{ $i }}">Script:</label>
                        <input type="text" name="questions[{{ $i }}][script]" id="script_{{ $i }}" class="form-control" required>
                    </div>
                </div>
                <hr>
                @endfor
            </div>
            <!-- Nút hành động -->
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary mx-2">Add</button>
                <button type="button" class="btn btn-secondary mx-2" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
