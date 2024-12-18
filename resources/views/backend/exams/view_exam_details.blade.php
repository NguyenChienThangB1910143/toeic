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
    
        @foreach ($testsByPart as $partName => $testId)
            <div class="test-section">
                <h3>{{ $partName }}</h3>
    
                @if (isset($questions[$testId]))
                    @foreach ($questions[$testId] as $testQuestion)
                        @php
                            $question = $testQuestion->question;
                            $group = $question->group; // Nếu câu hỏi thuộc nhóm
                            $image = $group->image ?? $question->image ?? null;
                            $audio = $group->audio ?? $question->audio ?? null;
                            $text = $group->text ?? $question->text ?? null;
                        @endphp
                        
                        {{-- Hiển thị nội dung của nhóm (nếu thuộc nhóm) --}}
                        @if ($group && $loop->first) {{-- Hiển thị 1 lần cho nhóm câu hỏi --}}
                            <div class="group-content">
                                @if ($image)
                                    <div>
                                        <strong>Hình ảnh nhóm:</strong>
                                        <img src="{{ asset('storage/' . $image) }}" alt="Group Image" style="max-width: 100%; height: auto;">
                                    </div>
                                @endif
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
                            @if ($question->content == null)
                                <h4>Câu hỏi: {{ $question->group->text }}</h4>
                            @else
                                <h4>Câu hỏi: {{ $question->content }}</h4>
                            @endif

                            
                            {{-- Hiển thị nội dung riêng của câu hỏi nếu không thuộc nhóm --}}
                            @if (!$group)
                                @if ($image)
                                    <div>
                                        <strong>Hình ảnh:</strong>
                                        <img src="{{ asset('storage/' . $image) }}" alt="Question Image" style="max-width: 100%; height: auto;">
                                    </div>
                                @endif
                                @if ($audio)
                                    <div>
                                        <strong>Audio:</strong>
                                        <audio controls>
                                            <source src="{{ asset('storage/' . $audio) }}" type="audio/mpeg">
                                            Trình duyệt không hỗ trợ audio.
                                        </audio>
                                    </div>
                                @endif
                                @if ($text)
                                    <div>
                                        <strong>Text:</strong>
                                        <p>{!! $text !!}</p>
                                    </div>
                                @endif
                            @endif
    
                            {{-- Hiển thị đáp án --}}
                            <ul>
                                <li>A: {{ $question->option1 }}</li>
                                <li>B: {{ $question->option2 }}</li>
                                <li>C: {{ $question->option3 }}</li>
                                @if (!empty($question->option4))
                                    <li>D: {{ $question->option4 }}</li>
                                @endif
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
