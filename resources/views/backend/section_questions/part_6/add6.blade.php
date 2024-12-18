<div class="modal" id="addquestionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog part-6" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add question</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('section_questions.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="section_id" id="section_id" value="{{ $section_id }}">
                    <div class="d-flex">
                        <div class="form-left">                    
                            <!-- Text -->
                            <!-- Text (Rich Text Editor) -->
                            <div class="form-group">
                                <label for="text">Text:</label>
                                <textarea name="text" id="text" class="form-control" required>{{ old('text') }}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="script">Script:</label>
                                <textarea name="script" id="script" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="form-right">
                            @for ($i = 1; $i <= 4; $i++)
                            <div class="question-container">
                                <h5 class="mt-3">Question {{ $i }}</h5>
                                <div class="question-content">
                                    <label for="questions[{{ $i }}][content]">Content:</label>
                                    <textarea name="questions[{{ $i }}][content]" id="questions[{{ $i }}][content]" required></textarea>
                                </div>
                                <div class="question-options">
                                    <div>
                                        <label for="questions[{{ $i }}][option1]">Opt A:</label>
                                        <textarea name="questions[{{ $i }}][option1]" id="questions[{{ $i }}][option1]" required></textarea>
                                    </div>
                                    <div>
                                        <label for="questions[{{ $i }}][option2]">Opt B:</label>
                                        <textarea name="questions[{{ $i }}][option2]" id="questions[{{ $i }}][option2]" required></textarea>
                                    </div>
                                    <div>
                                        <label for="questions[{{ $i }}][option3]">Opt C:</label>
                                        <textarea name="questions[{{ $i }}][option3]" id="questions[{{ $i }}][option3]" required></textarea>
                                    </div>
                                    <div>
                                        <label for="questions[{{ $i }}][option4]">Opt D:</label>
                                        <textarea name="questions[{{ $i }}][option4]" id="questions[{{ $i }}][option4]" required></textarea>
                                    </div>
                                </div>
                                <div class="question-correct">
                                    <label for="questions[{{ $i }}][correct_option]">Correct:</label>
                                    <select name="questions[{{ $i }}][correct_option]" id="questions[{{ $i }}][correct_option]" required>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>
                            </div>
                            @endfor
                            
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
<script>
    document.addEventListener("DOMContentLoaded", function() {
        CKEDITOR.replace('text'); // Khởi tạo CKEditor cho trường 'text'
    });
</script>
<style>
    .modal-body .d-flex {
    display: flex;
    gap: 10px;
    width: 100%;
    }

    .form-left, .form-right {
        flex: 1;
    }

    .form-left {
        flex: 0 0 35%;
        padding-right: 10px;
        border-right: 1px solid #ccc;
    }

    .form-right {
        flex: 0 0 65%;
        display: flex;
        gap : 10px;
    }
    /* Container của mỗi câu hỏi */
    .question-container {
    display: flex;
    flex-direction: column; /* Sắp xếp các phần tử theo chiều dọc */
    margin-bottom: 30px; /* Khoảng cách giữa các câu hỏi */
    padding: 10px;
    border-radius: 8px;
    background-color: #f9f9f9;
    }
    /* Phần nội dung (content) của câu hỏi */
    .question-content {
        display: flex;
        flex-direction: column; /* Căn chỉnh theo cột */
    }

    /* Phần đáp án */
    .question-options {
        display: flex;
        flex-direction: column; /* Căn theo chiều dọc */
        gap: 10px; /* Khoảng cách giữa các đáp án */
    }

    /* Đáp án riêng lẻ */
    .question-options div {
        display: flex;
        flex-direction: column; /* Giữ label và textarea theo chiều dọc */
        gap: 5px;
    }

    /* Phần đáp án đúng */
    .question-correct {
        display: flex;
        flex-direction: column; /* Căn theo chiều dọc */
    }

    /* Kiểu chung cho textarea và select */
    textarea,
    select {
        width: 100%; /* Chiều rộng đầy đủ */
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        resize: none;
    }

    textarea:focus,
    select:focus {
        border-color: #4e73df;
        box-shadow: 0 0 5px rgba(78, 115, 223, 0.5);
    }

</style>