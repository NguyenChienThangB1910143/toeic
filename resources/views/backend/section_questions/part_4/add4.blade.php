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
                <form action="{{ route('section_questions.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="section_id" id="section_id" value="{{ $section_id }}">
                    <!-- Audio chung cho cả nhóm -->
                    <div class="form-group">
                        <label for="audio">Audio:</label>
                        <input type="file" name="audio" id="audio" class="form-control" accept="audio/*">
                    </div>

                    <!-- Loop qua các câu hỏi -->
                    @for ($i = 0; $i < 3; $i++)
                    <div class="question-group">
                        <h6>Question {{ $i + 1 }}</h6>
                        <!-- Các input cho câu hỏi -->
                        <div >
                            <label for="content_{{ $i }}">Content:</label>
                            <textarea name="questions[{{ $i }}][content]" id="content_{{ $i }}" class="form-control" required></textarea>
                        </div>
                        <div >
                            <div>
                                <label for="option1_{{ $i }}">Opt A:</label>
                                <textarea name="questions[{{ $i }}][option1]" id="option1_{{ $i }}" class="form-control" required></textarea>
                            </div>
                            <div >
                                <label for="option2_{{ $i }}">Opt B:</label>
                                <textarea name="questions[{{ $i }}][option2]" id="option2_{{ $i }}" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div >
                            <div >
                                <label for="option3_{{ $i }}">Opt C:</label>
                                <textarea name="questions[{{ $i }}][option3]" id="option3_{{ $i }}" class="form-control" required></textarea>
                            </div>
                            <div >
                                <label for="option4_{{ $i }}">Opt D:</label>
                                <textarea name="questions[{{ $i }}][option4]" id="option4_{{ $i }}" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div >
                            <label for="correct_option_{{ $i }}">Correct Option:</label>
                            <select name="questions[{{ $i }}][correct_option]" id="correct_option_{{ $i }}" class="form-control" required>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                            </select>
                        </div>
                    </div>
                    <hr>
                    @endfor

                    <div >
                        <label for="script">Script:</label>
                        <textarea name="script" id="script" class="form-control" required></textarea>
                    </div>
                    <!-- Nút hành động -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary mx-2">Add</button>
                        <button type="button" class="btn btn-secondary mx-2" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
