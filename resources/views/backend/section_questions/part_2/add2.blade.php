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
                    <div class="d-flex">
                        <!-- Khung bên trái -->
                        <div class="form-left">
                            <!-- Content -->
                            <div class="form-group">
                                <label for="content">Content:</label>
                                <input type="text" name="content" id="content" class="form-control" value="{{ old('content') }}" required>
                            </div>
            
                            <!-- Audio -->
                            <div class="form-group">
                                <label for="audio">Audio:</label>
                                <input type="file" name="audio" id="audio" class="form-control" accept="audio/*">
                            </div>
            
                            <!-- Script -->
                            <div class="form-group">
                                <label for="script">Script:</label>
                                <input type="text" name="script" id="script" class="form-control" value="{{ old('script') }}" required>
                            </div>
                        </div>
            
                        <!-- Khung bên phải -->
                        <div class="form-right">
                            <!-- Đáp án A -->
                            <div class="form-group">
                                <label for="option1">Opt A:</label>
                                <input type="text" name="option1" id="option1" class="form-control" value="{{ old('option1') }}" required>
                            </div>
            
                            <!-- Đáp án B -->
                            <div class="form-group">
                                <label for="option2">Opt B:</label>
                                <input type="text" name="option2" id="option2" class="form-control" value="{{ old('option2') }}" required>
                            </div>
            
                            <!-- Đáp án C -->
                            <div class="form-group">
                                <label for="option3">Opt C:</label>
                                <input type="text" name="option3" id="option3" class="form-control" value="{{ old('option3') }}" required>
                            </div>
            
                            <!-- Đáp án D -->
                            <div class="form-group">
                                <label for="option4">Opt D:</label>
                                <input type="text" name="option4" id="option4" class="form-control" value="{{ old('option4') }}" required>
                            </div>
            
                            <!-- Đáp án đúng -->
                            <div class="form-group">
                                <label for="correct_option">Correct Opt:</label>
                                <select name="correct_option" id="correct_option" class="form-control" required>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="D">D</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Nút hành động -->
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary mx-2">Add</button>
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

</style>