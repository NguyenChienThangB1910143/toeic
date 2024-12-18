<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <title>Quản Lý Question</title>
    <link rel="stylesheet" href="{{ asset('assets/css/QLSectionQuestion.css') }}">
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-question">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="{{ route('qlsection') }}">Section</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Question</li>
                </ol>
            </nav>
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
                        }, 1000); // Đợi cho đến khi hoàn tất hiệu ứng mờ dần
                    }, 3000);
                </script>
            @endif
            <div class="search-add">
                <input type="text" class="search-input" placeholder="Search..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addquestionModal">Add question</button>
            </div>
            
            <div class="table-container part-7">
                <table class="table">
                    <thead>
                        <tr>
                            {{-- <th>No.</th> --}}
                            <th>Group ID</th>
                            <th>Text</th>
                            <th>Content</th>
                            <th>Opt 1</th>
                            <th>Opt 2</th>
                            <th>Opt 3</th>
                            <th>Opt 4</th>
                            <th>Correct Opt</th>
                            <th>Script</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $groupedQuestions = $questions->groupBy('question_group_id');
                        @endphp
                        @forelse($groupedQuestions as $groupId => $groupQuestions)
                            @foreach($groupQuestions as $index => $question)
                                <tr>

                                    @if($index == 0)
                                        <td rowspan="{{ count($groupQuestions) }}" class="text-center-gr">{{ $groupId }}</td>
                                        <td rowspan="{{ count($groupQuestions) }}" class="text-center-gr">{!! $question->text !!}</td>
                                    @endif

                                    <td>{{ $question->content }}</td>
                                    <td>{{ $question->option1 }}</td>
                                    <td>{{ $question->option2 }}</td>
                                    <td>{{ $question->option3 }}</td>
                                    <td>{{ $question->option4 }}</td>
                                    <td>{{ $question->correct_option }}</td>
                                    <td >{{ $question->script }}</td>
                                    <td>
                                        <button class="btn-edit" data-toggle="modal" data-target="#editquestionModal" data-id="{{ $question->question_id }}" data-type="{{ request()->type }}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>
                                        <form action="{{ route('section_questions.destroy', $question->question_id) }}" method="POST" style="display:inline;">
                                            @csrf
                                            @method('DELETE')
                                            <input type="hidden" name="section_id" value="{{ request()->section_id }}">
                                            <input type="hidden" name="type" value="{{ request()->type }}">
                                            <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        @empty
                            <tr>
                                <td colspan="11" class="text-center-gr">Không có câu hỏi nào.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <div class="pagination-links">{{ $questions->appends(['section_id' => request()->section_id, 'type' => request()->type])->links() }}</div>            
        </div>
            
    <!-- Include các modal -->
    @include('backend.section_questions.part_7.add7')
    @include('backend.section_questions.part_7.edit7')

    
    <!-- Các thư viện JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
    <script>
    </script>
</body>
</html>