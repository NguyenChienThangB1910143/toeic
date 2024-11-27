<div class="modal" id="addquestionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm câu hỏi cho Part 3</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('section_questions.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="section_id" id="section_id" value="{{ $section_id }}">

                    <!-- Audio (chung cho cả nhóm câu hỏi) -->
                    <div class="form-group">
                        <label for="audio">Âm thanh:</label>
                        <input type="file" name="audio" id="audio" class="form-control" accept="audio/*">
                    </div>

                    <!-- Loop qua 3 content -->
                    @for ($i = 0; $i < 3; $i++)
                        <div class="mb-4">
                            <h6>Câu hỏi {{ $i + 1 }}</h6>
                            <!-- Content -->
                            <div class="form-group">
                                <label for="content_{{ $i }}">Content:</label>
                                <input type="text" name="questions[{{ $i }}][content]" id="content_{{ $i }}" class="form-control" required>
                            </div>

                            <!-- Đáp án A -->
                            <div class="form-group">
                                <label for="option1_{{ $i }}">Đáp án A:</label>
                                <input type="text" name="questions[{{ $i }}][option1]" id="option1_{{ $i }}" class="form-control" required>
                            </div>

                            <!-- Đáp án B -->
                            <div class="form-group">
                                <label for="option2_{{ $i }}">Đáp án B:</label>
                                <input type="text" name="questions[{{ $i }}][option2]" id="option2_{{ $i }}" class="form-control" required>
                            </div>

                            <!-- Đáp án C -->
                            <div class="form-group">
                                <label for="option3_{{ $i }}">Đáp án C:</label>
                                <input type="text" name="questions[{{ $i }}][option3]" id="option3_{{ $i }}" class="form-control" required>
                            </div>

                            <!-- Đáp án D -->
                            <div class="form-group">
                                <label for="option4_{{ $i }}">Đáp án D:</label>
                                <input type="text" name="questions[{{ $i }}][option4]" id="option4_{{ $i }}" class="form-control" required>
                            </div>
                            <!-- Đáp án đúng -->
                            <div class="form-group">
                                <label for="correct_option_{{ $i }}">Đáp án đúng:</label>
                                <select name="questions[{{ $i }}][correct_option]" id="correct_option_{{ $i }}" class="form-control" required>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="D">D</option>
                                </select>
                            </div>
                        </div>
                    @endfor

                    <!-- Nút hành động -->
                    <button type="submit" class="btn btn-primary">Thêm câu hỏi</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>
