<div class="container">
    <h2>Chi tiết bài test: {{ $test->name }}</h2>
    <p>Thuộc Section: {{ $section->name }}</p>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                @if($testQuestions->firstWhere('question.group.text')) <th>Text</th> @endif
                @if($testQuestions->firstWhere('question.content')) <th>Câu hỏi</th> @endif
                @if($testQuestions->firstWhere('question.option1')) <th>A</th> @endif
                @if($testQuestions->firstWhere('question.option2')) <th>B</th> @endif
                @if($testQuestions->firstWhere('question.option3')) <th>C</th> @endif
                @if($testQuestions->firstWhere('question.option4')) <th>D</th> @endif
                @if($testQuestions->firstWhere('question.correct_option')) <th>Đáp án đúng</th> @endif
                @if($testQuestions->firstWhere('question.group.audio') || $testQuestions->firstWhere('question.audio')) <th>Audio</th> @endif
                @if($testQuestions->firstWhere('question.group.image') || $testQuestions->firstWhere('question.image')) <th>Hình ảnh</th> @endif
                @if($testQuestions->firstWhere('question.group.script')) <th>Script</th> @endif
            </tr>
        </thead>
        <tbody>
            @foreach ($testQuestions as $index => $testQuestion)
                <tr>
                    <td>{{ $index + 1 }}</td>
                @if ($testQuestion->question && $testQuestion->question->group && $testQuestion->question->group->text)
                    <td>{!! $testQuestion->question->group->text !!}</td>
                @endif
                @if ($testQuestion->question && $testQuestion->question->content)
                    <td>{{ $testQuestion->question->content }}</td>
                @endif
                    @if ($testQuestion->question && $testQuestion->question->option1)
                        <td>{{ $testQuestion->question->option1 }}</td>
                    @endif
                    @if ($testQuestion->question && $testQuestion->question->option2)
                        <td>{{ $testQuestion->question->option2 }}</td>
                    @endif
                    @if ($testQuestion->question && $testQuestion->question->option3)
                        <td>{{ $testQuestion->question->option3 }}</td>
                    @endif
                    @if ($testQuestion->question && $testQuestion->question->option4)
                        <td>{{ $testQuestion->question->option4 }}</td>
                    @endif
                    @if ($testQuestion->question && $testQuestion->question->correct_option)
                        <td>{{ $testQuestion->question->correct_option }}</td>
                    @endif
                    <td>
                        @if ($testQuestion->question && $testQuestion->question->group && $testQuestion->question->group->audio)
                            <audio controls>
                                <source src="{{ asset('storage/' . $testQuestion->question->group->audio) }}" type="audio/mpeg">
                            </audio>
                        @elseif ($testQuestion->question && $testQuestion->question->audio)
                            <audio controls>
                                <source src="{{ asset('storage/' . $testQuestion->question->audio) }}" type="audio/mpeg">
                            </audio>
                        @endif
                    </td>
                    <td>
                        @if ($testQuestion->question && $testQuestion->question->group && $testQuestion->question->group->image)
                            <img src="{{ asset('storage/' . $testQuestion->question->group->image) }}" alt="Image" width="100">
                        @elseif ($testQuestion->question && $testQuestion->question->image)
                            <img src="{{ asset('storage/' . $testQuestion->question->image) }}" alt="Image" width="100">
                        @endif
                    </td>
                    @if ($testQuestion->question && $testQuestion->question->group && $testQuestion->question->group->script)
                        <td>{{ $testQuestion->question->group->script }}</td>
                    @endif
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
