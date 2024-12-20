<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('assets/css/ViewExamDetails.css') }}">
    <title>Exam Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="container">
        <h2>Chi tiết bài thi: {{ $exam->name }}</h2>
        <p>Thời gian làm bài: {{ $exam->duration }} phút</p>

        @php
            $questionNumber = 1; // Biến đếm toàn cục cho số thứ tự câu hỏi
        @endphp

        @foreach ($testsByPart as $partName => $testId)
            <div class="test-section">
                <h3>{{ $partName }}</h3>

                @if (isset($questions[$testId]))
                    @php
                        $previousGroupId = null; // Theo dõi group_id trước đó
                    @endphp

                    @foreach ($questions[$testId] as $testQuestion)
                        @php
                            $question = $testQuestion->question;
                            $group = $question->group; // Nhóm của câu hỏi (nếu có)
                            $groupId = $question->question_group_id ?? null;
                            $image = $question->image ?? null;
                            $audio = $group->audio ?? $question->audio ?? null;
                            $text = $group->text ?? $question->text ?? null;
                        @endphp

                        {{-- Hiển thị nội dung nhóm nếu group_id khác trước đó --}}
                        @if ($groupId && $groupId !== $previousGroupId)
                            @php
                                $previousGroupId = $groupId; // Cập nhật group_id đã hiển thị
                            @endphp
                            <div class="group-content">
                                @if ($audio)
                                    <div>
                                        <strong>Audio nhóm:</strong>
                                        <audio controls>
                                            <source src="{{ asset('storage/' . $audio) }}" type="audio/mpeg">
                                            Trình duyệt không hỗ trợ audio.
                                        </audio>
                                    </div>
                                @endif
                                @if ($text)
                                    <div>
                                        <strong>Text nhóm:</strong>
                                        <p>{!! $text !!}</p>
                                    </div>
                                @endif
                            </div>
                        @endif

                        {{-- Hiển thị câu hỏi --}}
                        <div class="question">
                            <h4>Câu hỏi {{ $questionNumber }}:</h4> <!-- Hiển thị số thứ tự câu hỏi -->
                            @php
                                $questionNumber++; // Tăng số thứ tự câu hỏi
                            @endphp

                            @if ($question->audio)
                                <audio controls>
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

                            {{-- Hiển thị đáp án --}}
                            <ul>
                                <li>A: {{ $question->option1 }}</li>
                                <li>B: {{ $question->option2 }}</li>
                                <li>C: {{ $question->option3 }}</li>
                                @if (!empty($question->option4))
                                    <li>D: {{ $question->option4 }}</li>
                                @endif
                                <li>{{ $question->correct_option }}</li>
                            </ul>
                        </div>
                    @endforeach
                @else
                    <p>Không có câu hỏi nào trong {{ $partName }}.</p>
                @endif
            </div>
        @endforeach
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
