<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/css/Exam_test.css') }}">
    <title>Test Exam</title>
</head>
<>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-exam">
            <h1 class="exam-title">Test Exam</h1>

            <!-- Hiển thị thông báo thành công -->
            @if (session('success'))
                <div id="success-message" class="alert alert-success">
                    {{ session('success') }}
                </div>

                <script>
                    // Tự động ẩn thông báo sau 3 giây
                    setTimeout(function() {
                        let successMessage = document.getElementById('success-message');
                        successMessage.style.transition = 'opacity 1s ease';
                        successMessage.style.opacity = 0;
                        setTimeout(function() {
                            successMessage.style.display = 'none';
                        }, 1000); // Đợi hiệu ứng mờ dần
                    }, 3000);
                </script>
            @endif

            <div class="table-container">
                <div class="container">

                
                    <!-- Phần Part 1 -->
                    <div class="part-section">
                        <h4>Part 1</h4>
                        @if(!empty($part1_tests))
                            <form method="GET" action="{{ route('exam.test') }}">
                                <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                                <input type="hidden" name="part2_test_id" value="{{ $part2_test_id }}"> <!-- Giữ lại Test của Part 2 -->
                                <div class="form-group">
                                    <label for="part1-test">Select Test (Part 1):</label>
                                    <select name="part1_test_id" id="part1-test" class="form-control" onchange="this.form.submit();">
                                        <option value="">-- Select Test --</option>
                                        @foreach($part1_tests as $test)
                                            <option value="{{ $test->test_id }}" {{ $part1_test_id == $test->test_id ? 'selected' : '' }}>
                                                {{ $test->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </form>
                        @endif
                        <button class="btn btn-info btn-sm" type="button" data-toggle="collapse" data-target="#details-part-1" aria-expanded="false" aria-controls="details-part-1">
                            View Details
                        </button>
                    
                        <div id="details-part-1" class="collapse mt-2">
                            <!-- Danh sách câu hỏi của Part 1 -->
                            @if(!empty($part1_questions))
                                <div class="questions-section">
                                    <h5>Questions (Part 1):</h5>
                                    <ul>
                                        @foreach($part1_questions as $question)
                                            <li>
                                                <!-- Hiển thị audio nếu có -->
                                                @if($question->audio)
                                                    <div class="audio-section">
                                                        <audio controls>
                                                            <source src="{{ asset('storage/' . $question->audio) }}" type="audio/mp3">
                                                            Your browser does not support the audio element.
                                                        </audio>
                                                    </div>
                                                @else
                                                    <p>No audio available for this question.</p>
                                                @endif
                    
                                                <!-- Hiển thị hình ảnh nếu có -->
                                                @if($question->image)
                                                    <div class="image-section">
                                                        <img src="{{ asset('storage/' . $question->image) }}" alt="Question Image" class="img-fluid">
                                                    </div>
                                                @else
                                                    <p>No image available for this question.</p>
                                                @endif
                                                <strong>{{ $question->content }}</strong>
                                                <p>Option 1: {{ $question->option1 }}</p>
                                                <p>Option 2: {{ $question->option2 }}</p>
                                                <p>Option 3: {{ $question->option3 }}</p>
                                                <p>Option 4: {{ $question->option4 }}</p>
                                                <p>Correct Option: {{ $question->correct_option }}</p>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                        </div>
                    </div>                    
                
                    <!-- Phần Part 2 -->
                    <div class="part-section">
                        <h4>Part 2</h4>
                        @if(!empty($part2_tests))
                            <form method="GET" action="{{ route('exam.test') }}">
                                <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                                <input type="hidden" name="part1_test_id" value="{{ $part1_test_id }}"> <!-- Giữ lại Test của Part 1 -->
                                <div class="form-group">
                                    <label for="part2-test">Select Test (Part 2):</label>
                                    <select name="part2_test_id" id="part2-test" class="form-control" onchange="this.form.submit();">
                                        <option value="">-- Select Test --</option>
                                        @foreach($part2_tests as $test)
                                            <option value="{{ $test->test_id }}" {{ $part2_test_id == $test->test_id ? 'selected' : '' }}>
                                                {{ $test->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </form>
                        @endif
                        <button class="btn btn-info btn-sm" type="button" data-toggle="collapse" data-target="#details-part-2" aria-expanded="false" aria-controls="details-part-2">
                            View Details
                        </button>
                    
                        <div id="details-part-2" class="collapse mt-2">
                        <!-- Hiển thị Audio và Câu hỏi của Part 2 -->
                        @if(!empty($part2_questions))
                            <div class="questions-section">
                                <h5>Questions (Part 2):</h5>
                                <ul>
                                    @foreach($part2_questions as $question)
                                        <li>
                                            <strong>{{ $question->content }}</strong>
                                            <p>Option 1: {{ $question->option1 }}</p>
                                            <p>Option 2: {{ $question->option2 }}</p>
                                            <p>Option 3: {{ $question->option3 }}</p>
                                            <p>Correct Option: {{ $question->correct_option }}</p>
                                            
                                            <!-- Hiển thị audio của câu hỏi -->
                                            @if($question->audio)
                                                <div class="audio-section">
                                                    <audio controls>
                                                        <source src="{{ asset('storage/' . $question->audio) }}" type="audio/mp3">
                                                        Your browser does not support the audio element.
                                                    </audio>
                                                </div>
                                            @else
                                                <p>No audio available for this question.</p>
                                            @endif
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        </div>
                    </div>

                    <!-- Phần Part 3 -->
                    <div class="part-section">
                        <h4>Part 3</h4>
                        @if(!empty($part3_tests))
                            <form method="GET" action="{{ route('exam.test') }}">
                                <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                                <input type="hidden" name="part1_test_id" value="{{ $part1_test_id }}">
                                <input type="hidden" name="part2_test_id" value="{{ $part2_test_id }}">
                                <div class="form-group">
                                    <label for="part3-test">Select Test (Part 3):</label>
                                    <select name="part3_test_id" id="part3-test" class="form-control" onchange="this.form.submit();">
                                        <option value="">-- Select Test --</option>
                                        @foreach($part3_tests as $test)
                                            <option value="{{ $test->test_id }}" {{ $part3_test_id == $test->test_id ? 'selected' : '' }}>
                                                {{ $test->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </form>
                        @endif
                        <button class="btn btn-info btn-sm" type="button" data-toggle="collapse" data-target="#details-part-3" aria-expanded="false" aria-controls="details-part-3">
                            View Details
                        </button>
                    
                        <div id="details-part-3" class="collapse mt-2">
                        <!-- Danh sách câu hỏi của Part 3 -->
                        @if(!empty($part3_groups))
                            <div class="group-section">
                                @foreach($part3_groups as $group)
                                    <div class="audio-section">
                                        <h5>Audio for Group {{ $group['group_id'] }}:</h5>
                                        @if($group['audio'])
                                            <audio controls>
                                                <source src="{{ asset('storage/' . $group['audio']) }}" type="audio/mpeg">
                                            </audio>
                                        @else
                                            <p>No audio available for this group.</p>
                                        @endif
                                    </div>

                                    <!-- Câu hỏi của nhóm này -->
                                    <div class="questions-section">
                                        <h5>Questions (Group {{ $group['group_id'] }}):</h5>
                                        <ul>
                                            @foreach($group['questions'] as $question)
                                                <li>{{ $question->content }}</li>
                                                <p>Option 1: {{ $question->option1 }}</p>
                                                <p>Option 2: {{ $question->option2 }}</p>
                                                <p>Option 3: {{ $question->option3 }}</p>
                                                <p>Option 4: {{ $question->option4 }}</p>
                                                <p>Correct Option: {{ $question->correct_option }}</p>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                        </div>
                    </div>

                    <!-- Phần Part 4 -->
                    <div class="part-section">
                        <h4>Part 4</h4>
                        @if(!empty($part4_tests))
                            <form method="GET" action="{{ route('exam.test') }}">
                                <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                                <input type="hidden" name="part1_test_id" value="{{ $part1_test_id }}">
                                <input type="hidden" name="part2_test_id" value="{{ $part2_test_id }}">
                                <input type="hidden" name="part3_test_id" value="{{ $part3_test_id }}">
                                <div class="form-group">
                                    <label for="part4-test">Select Test (Part 4):</label>
                                    <select name="part4_test_id" id="part4-test" class="form-control" onchange="this.form.submit();">
                                        <option value="">-- Select Test --</option>
                                        @foreach($part4_tests as $test)
                                            <option value="{{ $test->test_id }}" {{ $part4_test_id == $test->test_id ? 'selected' : '' }}>
                                                {{ $test->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </form>
                        @endif
                        <button class="btn btn-info btn-sm" type="button" data-toggle="collapse" data-target="#details-part-4" aria-expanded="false" aria-controls="details-part-4">
                            View Details
                        </button>
                    
                        <div id="details-part-4" class="collapse mt-2">
                        <!-- Audio cho Part 4 -->
                        @if(!empty($part4_groups))
                            @foreach($part4_groups as $group)
                                <div class="audio-section">
                                    <h5>Audio for Group {{ $group['group_id'] }}:</h5>
                                    @if($group['audio'])
                                        <audio controls>
                                            <source src="{{ asset('storage/' . $group['audio']) }}" type="audio/mpeg">
                                        </audio>
                                    @else
                                        <p>No audio available</p>
                                    @endif
                                    <ul>
                                        @foreach($group['questions'] as $question)
                                            <li>{{ $question->content }}</li>
                                            <p>Option 1: {{ $question->option1 }}</p>
                                            <p>Option 2: {{ $question->option2 }}</p>
                                            <p>Option 3: {{ $question->option3 }}</p>
                                            <p>Option 4: {{ $question->option4 }}</p>
                                            <p>Correct Option: {{ $question->correct_option }}</p>
                                        @endforeach
                                    </ul>
                                </div>
                            @endforeach
                        @endif
                        </div>
                    </div>

                    <!-- Phần Part 5 -->
                    <div class="part-section">
                        <h4>Part 5</h4>
                        @if(!empty($part5_tests))
                            <form method="GET" action="{{ route('exam.test') }}">
                                <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                                <input type="hidden" name="part1_test_id" value="{{ $part1_test_id }}">
                                <input type="hidden" name="part2_test_id" value="{{ $part2_test_id }}">
                                <input type="hidden" name="part3_test_id" value="{{ $part3_test_id }}">
                                <input type="hidden" name="part4_test_id" value="{{ $part4_test_id }}">
                                <div class="form-group">
                                    <label for="part5-test">Select Test (Part 5):</label>
                                    <select name="part5_test_id" id="part5-test" class="form-control" onchange="this.form.submit();">
                                        <option value="">-- Select Test --</option>
                                        @foreach($part5_tests as $test)
                                            <option value="{{ $test->test_id }}" {{ $part5_test_id == $test->test_id ? 'selected' : '' }}>
                                                {{ $test->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </form>
                        @endif
                        <button class="btn btn-info btn-sm" type="button" data-toggle="collapse" data-target="#details-part-5" aria-expanded="false" aria-controls="details-part-5">
                            View Details
                        </button>
                    
                        <div id="details-part-5" class="collapse mt-2">
                        <!-- Hiển thị câu hỏi cho Part 5 -->
                        @if(!empty($part5_groups))
                            @foreach($part5_groups as $group)
                                <div class="group-section">
                                    <h5>Text for Group {{ $group['group_id'] }}:</h5>
                                    <p>là {!! $group['text'] !!}</p>

                                    <!-- Hiển thị câu hỏi trong nhóm -->
                                    <ul>
                                        @foreach($group['questions'] as $question)
                                            <p>{{ $question->option1 }}</p>
                                            <p>{{ $question->option2 }}</p>
                                            <p>{{ $question->option3 }}</p>
                                            <p>{{ $question->option4 }}</p>
                                            <p>{{ $question->correct_option }}</p>
                                        @endforeach
                                    </ul>
                                </div>
                            @endforeach
                        @else
                            <p>No questions available for Part 5.</p>
                        @endif
                        </div>
                    </div>
                    <!-- Phần Part 6 -->
                    <div class="part-section">
                        <h4>Part 6</h4>
                        @if(!empty($part6_tests))
                            <form method="GET" action="{{ route('exam.test') }}">
                                <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                                <input type="hidden" name="part1_test_id" value="{{ $part1_test_id }}">
                                <input type="hidden" name="part2_test_id" value="{{ $part2_test_id }}">
                                <input type="hidden" name="part3_test_id" value="{{ $part3_test_id }}">
                                <input type="hidden" name="part4_test_id" value="{{ $part4_test_id }}">
                                <input type="hidden" name="part5_test_id" value="{{ $part5_test_id }}">
                                <div class="form-group">
                                    <label for="part6-test">Select Test (Part 6):</label>
                                    <select name="part6_test_id" id="part6-test" class="form-control" onchange="this.form.submit();">
                                        <option value="">-- Select Test --</option>
                                        @foreach($part6_tests as $test)
                                            <option value="{{ $test->test_id }}" {{ $part6_test_id == $test->test_id ? 'selected' : '' }}>
                                                {{ $test->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </form>
                        @endif
                        <button class="btn btn-info btn-sm" type="button" data-toggle="collapse" data-target="#details-part-6" aria-expanded="false" aria-controls="details-part-6">
                            View Details
                        </button>
                    
                        <div id="details-part-6" class="collapse mt-2">
                        <!-- Hiển thị câu hỏi cho Part 6 -->
                        @if(!empty($part6_groups))
                            @foreach($part6_groups as $group)
                                <div class="group-section">
                                    <h5>Text for Group {{ $group['group_id'] }}:</h5>
                                    <p>{!! $group['text'] !!}</p>
                                    <ul>
                                        @foreach($group['questions'] as $question)
                                            <p>{{ $question->content }}</p>
                                            <p>{{ $question->option1 }}</p>
                                            <p>{{ $question->option2 }}</p>
                                            <p>{{ $question->option3 }}</p>
                                            <p>{{ $question->option4 }}</p>
                                            <p>{{ $question->correct_option }}</p>
                                        @endforeach
                                    </ul>
                                </div>
                            @endforeach
                        @else
                            <p>No questions available for Part 6.</p>
                        @endif
                        </div>
                    </div>

                    <!-- Phần Part 7 -->
                    <div class="part-section">
                        <h4>Part 7</h4>
                        @if(!empty($part7_tests))
                            <form method="GET" action="{{ route('exam.test') }}">
                                <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                                <input type="hidden" name="part1_test_id" value="{{ $part1_test_id }}">
                                <input type="hidden" name="part2_test_id" value="{{ $part2_test_id }}">
                                <input type="hidden" name="part3_test_id" value="{{ $part3_test_id }}">
                                <input type="hidden" name="part4_test_id" value="{{ $part4_test_id }}">
                                <input type="hidden" name="part5_test_id" value="{{ $part5_test_id }}">
                                <input type="hidden" name="part6_test_id" value="{{ $part6_test_id }}">
                                <div class="form-group">
                                    <label for="part7-test">Select Test (Part 7):</label>
                                    <select name="part7_test_id" id="part7-test" class="form-control" onchange="this.form.submit();">
                                        <option value="">-- Select Test --</option>
                                        @foreach($part7_tests as $test)
                                            <option value="{{ $test->test_id }}" {{ $part7_test_id == $test->test_id ? 'selected' : '' }}>
                                                {{ $test->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </form>
                        @endif
                        <button class="btn btn-info btn-sm" type="button" data-toggle="collapse" data-target="#details-part-7" aria-expanded="false" aria-controls="details-part-7">
                            View Details
                        </button>
                    
                        <div id="details-part-7" class="collapse mt-2">
                        <!-- Hiển thị câu hỏi cho Part 7 -->
                        @if(!empty($part7_groups))
                            @foreach($part7_groups as $group)
                                <div class="group-section">
                                    <h5>Text for Group {{ $group['group_id'] }}:</h5>
                                    <p>{!! $group['text'] !!}</p>
                                    <ul>
                                        @foreach($group['questions'] as $question)
                                            <p>{{ $question->content }}</p>
                                            <p>{{ $question->option1 }}</p>
                                            <p>{{ $question->option2 }}</p>
                                            <p>{{ $question->option3 }}</p>
                                            <p>{{ $question->option4 }}</p>
                                            <p>{{ $question->correct_option }}</p>
                                        @endforeach
                                    </ul>
                                </div>
                            @endforeach
                        @else
                            <p>No questions available for Part 7.</p>
                        @endif
                        </div>
                    </div>
                    <form method="POST" action="{{ route('exam_test.store') }}">
                        @csrf <!-- CSRF Token for security -->
                        <input type="hidden" name="exam_id" value="{{ $exam_id }}">
                        <input type="hidden" name="part1_test_id" value="{{ $part1_test_id }}">
                        <input type="hidden" name="part2_test_id" value="{{ $part2_test_id }}">
                        <input type="hidden" name="part3_test_id" value="{{ $part3_test_id }}">
                        <input type="hidden" name="part4_test_id" value="{{ $part4_test_id }}">
                        <input type="hidden" name="part5_test_id" value="{{ $part5_test_id }}">
                        <input type="hidden" name="part6_test_id" value="{{ $part6_test_id }}">
                        <input type="hidden" name="part7_test_id" value="{{ $part7_test_id }}">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
<!-- Thêm JavaScript của jQuery và Bootstrap -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
