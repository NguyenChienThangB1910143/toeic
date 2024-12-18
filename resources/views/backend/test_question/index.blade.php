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
            <!-- Breadcrumb -->
            <nav style="--bs-breadcrumb-divider: url('data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'8\' height=\'8\'%3E%3Cpath d=\'M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z\' fill=\'%236c757d\'/%3E%3C/svg%3E');" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('qlsection') }}">Section</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Test</li>
                </ol>
            </nav>

            <!-- Thông báo -->
            @if (session('success'))
                <div id="success-message" class="alert alert-success">
                    {{ session('success') }}
                </div>
            @elseif (session('error'))
                <div id="error-message" class="alert alert-danger">
                    {{ session('error') }}
                </div>
            @endif

            <!-- Form và tìm kiếm -->
            <div class="search-add">
                <input type="text" class="search-input" placeholder="Tìm kiếm test..." />
                <button class="btn-add">Random</button>
                <form id="selectedQuestionsForm" action="{{ route('store_test_questions') }}" method="POST">
                    @csrf
                    <input type="hidden" name="test_id" value="{{ $test_id }}">
                    <input type="hidden" id="selected_questions" name="selected_questions" value="">
                    <input type="hidden" name="section_id" value="{{ $section_id }}">
                    <button type="submit" class="btn-add">Submit</button>
                </form>
            </div>

            <!-- Bảng hiển thị câu hỏi -->
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Stt</th>
                            <th id="section-info" data-type="{{ $section->type }}">Check ({{ $section->type }})</th>
                            <th>Content</th>
                            <th id="image-column">Image</th>
                            <th id="audio-column">Audio</th>                           
                            <th>Script</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($questions as $question)
                            @php
                                // Đảm bảo checkbox nhóm chỉ xuất hiện một lần
                                $isGroupCheckboxDisplayed = !isset($groupCheckboxes[$question->question_group_id]);
                                if ($question->question_group_id) {
                                    $groupCheckboxes[$question->question_group_id] = true;
                                }
                            @endphp
                            <tr data-question-id="{{ $question->question_id }}" data-question-group-id="{{ $question->question_group_id }}">
                                <td>{{ ($questions->currentPage() - 1) * $questions->perPage() + $loop->iteration }}</td>
                                <td>
                                    @if($question->question_group_id && $isGroupCheckboxDisplayed)
                                        <input type="checkbox" class="checkbox group-checkbox" data-group-id="{{ $question->question_group_id }}">
                                    @elseif(!$question->question_group_id)
                                        <input type="checkbox" class="checkbox single-checkbox">
                                    @endif
                                </td>
                    {{-- đang lỗi --}}
                                <td>
                                    @if($question->question_group_id && $question->group)
                                        @if($question->group->text)
                                            {{$question->group->text}}
                                        @else
                                            Không có
                                        @endif
                                    @elseif($question->content)
                                        {{ $question->content }}
                                    @else
                                        Không có
                                    @endif
                                </td>
                    {{-- end --}}
                                <td>
                                    @if($question->question_group_id && $question->group)
                                        @if($question->group->image)
                                            <img src="{{ asset('storage/' . $question->group->image) }}" alt="Image" width="50">
                                        @else
                                            Không có
                                        @endif
                                    @elseif($question->image)
                                        <img src="{{ asset('storage/' . $question->image) }}" alt="Image" width="50">
                                    @else
                                        Không có
                                    @endif
                                </td>
                                <td>
                                    @if($question->question_group_id && $question->group)
                                        @if($question->group->audio)
                                            <audio controls>
                                                <source src="{{ asset('storage/' . $question->group->audio) }}" type="audio/mpeg">
                                                Trình duyệt không hỗ trợ.
                                            </audio>
                                        @else
                                            Không có
                                        @endif
                                    @elseif($question->audio)
                                        <audio controls>
                                            <source src="{{ asset('storage/' . $question->audio) }}" type="audio/mpeg">
                                            Trình duyệt không hỗ trợ.
                                        </audio>
                                    @else
                                        Không có
                                    @endif
                                </td>
                                <td>{{ $question->script }}</td>
                                
                            </tr>
                        @empty
                            <tr>
                                <td colspan="8" class="text-center">Không có câu hỏi nào.</td>
                            </tr>
                        @endforelse
                    </tbody>
                    
                </table>
            </div>
            <div class="pagination-links">
                {{ $questions->appends(['section_id' => request()->section_id])->links() }}
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <script>
        document.querySelectorAll('.group-checkbox').forEach(groupCheckbox => {
            groupCheckbox.addEventListener('change', function () {
                const groupId = this.getAttribute('data-group-id');
                const isChecked = this.checked;

                // Đồng bộ trạng thái checkbox trong nhóm
                document.querySelectorAll(`[data-question-group-id="${groupId}"] .checkbox`).forEach(checkbox => {
                    checkbox.checked = isChecked;
                });
            });
        });

        document.getElementById('selectedQuestionsForm').addEventListener('submit', function (e) {
            const checkboxes = document.querySelectorAll('.checkbox:checked');
            const selectedQuestions = new Set();

            // Thu thập câu hỏi được chọn
            checkboxes.forEach(checkbox => {
                const groupId = checkbox.getAttribute('data-group-id');
                if (groupId) {
                    document.querySelectorAll(`[data-question-group-id="${groupId}"]`).forEach(row => {
                        selectedQuestions.add(row.getAttribute('data-question-id'));
                    });
                } else {
                    selectedQuestions.add(checkbox.closest('tr').dataset.questionId);
                }
            });

            // Kiểm tra số lượng câu hỏi
            const type = document.getElementById('section-info').getAttribute('data-type');
            const requiredQuestions = type === 'part_1' ? 6 : type === 'part_2' ? 25 : 
            type === 'part_3' ? 39 : type === 'part_4' ? 30 : type === 'part_5' ? 30 : 
            type === 'part_6' ? 16 : type === 'part_7' ? 54 : 0;

            if (selectedQuestions.size !== requiredQuestions) {
                alert(`Vui lòng chọn đúng ${requiredQuestions} câu hỏi!`);
                e.preventDefault();
                return;
            }

            // Cập nhật hidden input và submit form
            document.getElementById('selected_questions').value = JSON.stringify(Array.from(selectedQuestions));
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let imageColumn = document.getElementById('image-column');
            let audioColumn = document.getElementById('audio-column');
            let hasImage = false;
            let hasAudio = false;
    
            // Duyệt qua tất cả các hàng để kiểm tra dữ liệu hình ảnh và âm thanh
            document.querySelectorAll('tbody tr').forEach(row => {
                let imageCell = row.querySelector('td:nth-child(4) img');
                let audioCell = row.querySelector('td:nth-child(5) audio');
    
                if (imageCell) hasImage = true;
                if (audioCell) hasAudio = true;
            });
    
            // Ẩn cột Image nếu không có dữ liệu
            if (!hasImage) {
                imageColumn.style.display = 'none';
                document.querySelectorAll('td:nth-child(4)').forEach(cell => cell.style.display = 'none');
            }
    
            // Ẩn cột Audio nếu không có dữ liệu
            if (!hasAudio) {
                audioColumn.style.display = 'none';
                document.querySelectorAll('td:nth-child(5)').forEach(cell => cell.style.display = 'none');
            }
        });
    </script>
    <script>
        document.querySelector('.btn-add').addEventListener('click', function (e) {
            e.preventDefault();
            
            const type = document.getElementById('section-info').getAttribute('data-type');
    
            // Xác định số lượng câu hỏi cần chọn theo "part"
            const requiredQuestions = type === 'part_1' ? 6 : type === 'part_2' ? 25 :
                type === 'part_3' ? 39 : type === 'part_4' ? 30 :
                type === 'part_5' ? 30 : type === 'part_6' ? 16 : type === 'part_7' ? 54 : 0;
    
            // Lấy tất cả các checkbox có sẵn
            const allCheckboxes = document.querySelectorAll('.checkbox');
    
            // Xóa trạng thái chọn trước đó
            allCheckboxes.forEach(checkbox => checkbox.checked = false);
    
            // Chọn ngẫu nhiên các checkbox theo số lượng cần thiết
            const shuffled = Array.from(allCheckboxes).sort(() => 0.5 - Math.random());
            const selected = shuffled.slice(0, requiredQuestions);
    
            selected.forEach(checkbox => checkbox.checked = true);
        });
    </script>
    
</body>
</html>
