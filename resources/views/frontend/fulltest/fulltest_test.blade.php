<!-- Bao gồm header -->
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleFullTest.css') }}">

<!-- Nội dung chính của trang -->
<div class="full-test-container mt-5">
    <div class="container">
        <h2>Thí sinh: {{ $learner->name }}</h2>
        <input type="hidden" id="learner_id" value="{{ $learner->learner_id }}">
        <h2>Bài thi: {{ $exam->name }}</h2>
        <p>Thời gian làm bài: {{ $exam->duration }} phút</p>

        <!-- Đồng hồ đếm ngược -->
        <div id="countdown" class="alert alert-warning">
            Thời gian còn lại: <span id="timer"></span>
        </div>

        @php
            $questionNumber = 1; // Biến đếm toàn cục cho số thứ tự câu hỏi
        @endphp

        <!-- Start the form to submit all questions and answers -->
        <form action="{{ route('submitTest', ['exam_id' => $exam->exam_id]) }}" method="POST">
            @csrf
            @foreach ($sortedQuestions as $part => $testQuestions)
                <div class="test-section">
                    <h3><br>Phần {{ ucfirst($part) }}</h3>

                    @php
                        // Biến theo dõi các question_group_id đã hiển thị
                        $displayedGroupIds = [];
                    @endphp

                    @foreach ($testQuestions as $testQuestion)
                    <div class="question" id="question-{{ $testQuestion->question->question_id }}">
                        @php
                            $question = $testQuestion->question;
                            $group = $question->group; // Nhóm của câu hỏi
                            $groupId = $group->question_group_id ?? null; // ID của nhóm (nếu có)
                            $text = $group->text ?? null;
                            $audio = $group->audio ?? null;
                            $image = $question->image ?? null;
                        @endphp

                        <!-- Hiển thị nội dung nhóm nếu chưa hiển thị -->
                        @if ($groupId && !in_array($groupId, $displayedGroupIds))
                            @php
                                $displayedGroupIds[] = $groupId; // Lưu ID nhóm đã hiển thị
                            @endphp
                            <div class="group-content">
                                @if ($text)
                                    <div>
                                        <strong>Nội dung nhóm:</strong>
                                        <p>{!! $text !!}</p>
                                    </div>
                                @endif
                                @if ($audio)
                                    <div>
                                        <strong>Audio nhóm:</strong>
                                        <audio id="audio-group-{{ $groupId }}" controls>
                                            <source src="{{ asset('storage/' . $audio) }}" type="audio/mpeg">
                                            Trình duyệt không hỗ trợ audio.
                                        </audio>
                                    </div>
                                @endif
                            </div>
                        @endif

                        <!-- Hiển thị câu hỏi -->
                        <div class="question">
                            <h4><br>Câu hỏi {{ $questionNumber }}:</h4> <!-- Hiển thị số thứ tự liên tục -->
                            @php
                                $questionNumber++; // Tăng số thứ tự câu hỏi
                            @endphp

                            @if ($question->audio)
                                <!-- Thêm ID cho mỗi đoạn âm thanh câu hỏi -->
                                <audio id="audio-{{ $question->id }}" controls>
                                    <source src="{{ asset('storage/' . $audio) }}" type="audio/mpeg">
                                    Trình duyệt không hỗ trợ audio.
                                </audio>
                            @endif
                            @if ($image)
                                <img src="{{ asset('storage/' . $image) }}" alt="Image" width="100">
                            @endif
                            @if ($question->content)
                                <p>{!! $question->content !!}</p>
                            @endif

                            <!-- Hiển thị đáp án dưới dạng radio -->
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="answer_{{ $question->question_id }}" id="answerA_{{ $question->question_id }}" value="A">
                                <label class="form-check-label" for="answerA_{{ $question->question_id }}">
                                    A: {{ $question->option1 }}
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="answer_{{ $question->question_id }}" id="answerB_{{ $question->question_id }}" value="B">
                                <label class="form-check-label" for="answerB_{{ $question->question_id }}">
                                    B: {{ $question->option2 }}
                                </label>
                            </div>
                            @if (!empty($question->option3))
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="answer_{{ $question->question_id }}" id="answerC_{{ $question->question_id }}" value="C">
                                    <label class="form-check-label" for="answerC_{{ $question->question_id }}">
                                        C: {{ $question->option3 }}
                                    </label>
                                </div>
                            @endif
                            @if (!empty($question->option4))
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="answer_{{ $question->question_id }}" id="answerD_{{ $question->question_id }}" value="D">
                                    <label class="form-check-label" for="answerD_{{ $question->question_id }}">
                                        D: {{ $question->option4 }}
                                    </label>
                                </div>
                            @endif
                            <input type="hidden" name="correct_option_{{ $question->question_id }}" value="{{ $question->correct_option }}">
                        </div>
                    </div>
                    @endforeach
                </div>
            @endforeach

            <!-- Nút submit -->
            <div class="text-center mt-5">
                <button type="submit" class="btn btn-danger">Nộp bài</button>
            </div>
        </form>

    </div>
</div>

<!-- Bảng câu hỏi -->
<div id="question-table">
    @php
        $questionCounter = 1; // Khởi tạo biến đếm số thứ tự câu hỏi
    @endphp
    @foreach ($sortedQuestions as $part => $testQuestions)
        @foreach ($testQuestions as $testQuestion)
        <div class="question-box" id="box-{{ $testQuestion->question->question_id }}" 
             onclick="scrollToQuestion({{ $testQuestion->question->question_id }})">
            <span>{{ $questionCounter }}</span> <!-- In ra số thứ tự câu hỏi -->
        </div> 
        @php
            $questionCounter++; // Tăng biến đếm
        @endphp       
        @endforeach
    @endforeach
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bao gồm footer -->
@include('frontend.inc.footer')

<script>
    // Kiểm tra xem người dùng đã chọn ít nhất một câu trả lời
    document.querySelector('form').addEventListener('submit', function (event) {
        let answeredQuestions = document.querySelectorAll('input[type="radio"]:checked').length;

        // Nếu không có câu trả lời nào được chọn, hiển thị thông báo và ngừng việc submit
        if (answeredQuestions === 0) {
            alert("Bạn phải trả lời ít nhất một câu hỏi trước khi nộp bài!");
            event.preventDefault(); // Dừng hành động submit
        }
    });

    // Đồng hồ đếm ngược
    let duration = {{ $exam->duration }} * 60; // Thời gian làm bài tính bằng giây

    function updateTimer() {
        let minutes = Math.floor(duration / 60);
        let seconds = duration % 60;

        // Hiển thị thời gian còn lại
        document.getElementById('timer').innerText = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
        duration--;

        // Nếu thời gian kết thúc, dừng bài thi
        if (duration < 0) {
            clearInterval(timerInterval);
            alert('Thời gian làm bài đã kết thúc!');
            // Có thể thêm code để tự động nộp bài hoặc chuyển trang
        }
    }

    // Khởi động đồng hồ đếm ngược
    let timerInterval = setInterval(updateTimer, 1000); // Cập nhật mỗi giây

    // Khởi tạo thời gian ban đầu
    updateTimer();

    document.addEventListener("DOMContentLoaded", function () {
        // Lắng nghe sự kiện thay đổi của tất cả các radio button
        document.querySelectorAll('input[type="radio"]').forEach((radioButton) => {
            radioButton.addEventListener('change', function () {
                const questionId = this.getAttribute('name').split('_')[1]; // Lấy ID câu hỏi từ name
                const questionBox = document.getElementById('box-' + questionId); // Tìm ô câu hỏi trong bảng

                // Kiểm tra nếu phần tử ô câu hỏi tồn tại và thêm class 'answered'
                if (questionBox) {
                    questionBox.classList.add('answered'); // Đánh dấu câu hỏi đã trả lời
                }
            });
        });
    });

    // Hàm cuộn đến câu hỏi
    function scrollToQuestion(questionId) {
        const questionElement = document.getElementById('question-' + questionId);
        if (questionElement) {
            questionElement.scrollIntoView({
                behavior: 'smooth', // Cuộn mượt mà
                block: 'start' // Đặt câu hỏi ở đầu màn hình khi cuộn
            });
        }
    }
</script>
