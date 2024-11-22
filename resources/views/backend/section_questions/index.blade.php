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
                <input type="text" class="search-input" placeholder="Tìm kiếm question..." />
                <!-- Nút mở Modal -->
                <button class="btn-add" data-toggle="modal" data-target="#addquestionModal">Thêm question</button>
            </div>
            
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Stt</th>
                            <th>Content</th>
                            <th>Opt A</th>
                            <th>Opt B</th>
                            <th>Opt C</th>
                            <th>Opt D</th>
                            <th>Correct Opt</th>
                            <th>Type</th>
                            <th>Image</th>
                            <th>Audio</th>
                            <th>Script</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($questions as $question)
                        <tr>
                            <td>{{ ($questions->currentPage() - 1) * $questions->perPage() + $loop->iteration }}</td>
                            <td>{{ $question->content }}</td>
                            <td>{{ $question->optA }}</td>
                            <td>{{ $question->optB }}</td>
                            <td>{{ $question->optC }}</td>
                            <td>{{ $question->optD }}</td>
                            <td>{{ $question->correctOpt }}</td>
                            <td>{{ $question->text }}</td>
                            <td>{{ $question->type }}</td>
                            <td>
                                @if($question->image)
                                <img src="{{ asset('storage/' . $question->image) }}" alt="Image" width="50">
                                @else
                                Không có
                                @endif
                            </td>
                            <td>
                                @if($question->audio)
                                <audio controls>
                                    <source src="{{ asset('storage/' . $question->audio) }}" type="audio/mpeg">
                                    Trình duyệt không hỗ trợ.
                                </audio>
                                @else
                                Không có
                                @endif
                            </td>
                            <td>{{ $question->script }}</td>
                            <td>
                                <!-- Nút chỉnh sửa -->
                                <button class="btn-edit" data-toggle="modal" data-target="#editquestionModal"
                                    data-id="{{ $question->id }}">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <!-- Form xóa -->
                                <form action="{{ route('section_questions.destroy', $question->id) }}" method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="11" class="text-center">Không có câu hỏi nào.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <div class="pagination-links">{{ $questions->links() }}</div>            
        </div>
            
    <!-- Modal Thêm question -->
    <div class="modal" id="addquestionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm question mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('section_questions.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Content -->
                        <div class="form-group">
                            <label for="content">Content:</label>
                            <input type="text" name="content" id="content" class="form-control" value="{{ old('content') }}" required>
                        </div>
                        <!-- OPT A -->
                        <div class="form-group">
                            <label for="optA">Opt A:</label>
                            <input type="text" name="optA" id="optA" class="form-control" value="{{ old('optA') }}" required>
                        </div>
                        <!-- OPT B -->
                        <div class="form-group">
                            <label for="optB">Opt B:</label>
                            <input type="text" name="optB" id="optB" class="form-control" value="{{ old('optB') }}" required>
                        </div>
                        <!-- OPT C -->
                        <div class="form-group">
                            <label for="optC">Opt C:</label>
                            <input type="text" name="optC" id="optC" class="form-control" value="{{ old('optC') }}" required>
                        </div>
                        <!-- OPT D -->
                        <div class="form-group">
                            <label for="optD">Opt D:</label>
                            <input type="text" name="optD" id="optD" class="form-control" value="{{ old('optD') }}" required>
                        </div>
                        <!-- CORRECT OPT -->
                        <div class="form-group">
                            <label for="correctOpt">Correct Opt:</label>
                            <input type="text" name="correctOpt" id="correctOpt" class="form-control" value="{{ old('correctOpt') }}" required>
                        </div>
                        <!-- Text -->
                        <div class="form-group">
                            <label for="text">Text:</label>
                            <input type="text" name="text" id="text" class="form-control" value="{{ old('text') }}" required>
                        </div>
                        <!-- TYPE -->
                        <div class="form-group">
                            <label for="type">Type:</label>
                            <select name="type" id="type" class="form-control" required>
                                @foreach($types as $type)
                                    <option value="{{ $type }}" {{ old('type') == $type ? 'selected' : '' }}>{{ $type }}</option>
                                @endforeach
                            </select>
                        </div>
                        <!-- IMAGE -->
                        <div class="form-group">
                            <label for="image">Image:</label>
                            <input type="file" name="image" id="image" class="form-control" accept="image/*" required>
                        </div>
                        <!-- AUDIO -->
                        <div class="form-group">
                            <label for="audio">Audio:</label>
                            <input type="file" name="audio" id="audio" class="form-control" accept="audio/*" >
                        </div>
                        <!-- SCRIPT -->
                        <div class="form-group">
                            <label for="script">Script:</label>
                            <input type="textarea" name="script" id="script" class="form-control"  required>
                        </div>
                        <input type="hidden" name="section_id" value="{{ $section_id }}">
                        <button type="submit" class="btn btn-primary">Thêm question</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Chỉnh sửa question -->
    <div class="modal" id="editquestionModal" tabindex="-1" role="dialog" aria-labelledby="editquestionLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editquestionLabel">Chỉnh Sửa question</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="editquestionForm">
                        @csrf
                        @method('PUT')
                        <!-- OPT A -->
                        <div class="form-group">
                            <label for="edit_optA">OPT A:</label>
                            <input type="text" name="optA" id="edit_optA" class="form-control" required>
                        </div>
                        <!-- OPT B -->
                        <div class="form-group">
                            <label for="edit_optB">OPT B:</label>
                            <input type="text" name="optB" id="edit_optB" class="form-control" required>
                        </div>
                        <!-- OPT C -->
                        <div class="form-group">
                            <label for="edit_optC">OPT C:</label>
                            <input type="text" name="optC" id="edit_optC" class="form-control" required>
                        </div>
                        <!-- OPT D -->
                        <div class="form-group">
                            <label for="edit_optD">OPT D:</label>
                            <input type="text" name="optD" id="edit_optD" class="form-control" required>
                        </div>
                        <!-- CORRECT OPT -->
                        <div class="form-group">
                            <label for="edit_correctOpt">CORRECT OPT:</label>
                            <input type="text" name="correctOpt" id="edit_correctOpt" class="form-control" required>
                        </div>
                        <!-- TYPE -->
                        <div class="form-group">
                            <label for="edit_type">TYPE:</label>
                            <select name="type" id="edit_type" class="form-control" required>
                                <option value="[Part 1] Tranh tả người">[Part 1] Tranh tả người</option>
                                <option value="[Part 1] Tranh tả vật">[Part 1] Tranh tả vật</option>
                                <option value="[Part 1] Tranh tả người và vật">[Part 1] Tranh tả người và vật</option>
                            </select>
                        </div>                        
                        <!-- IMAGE -->
                        <div class="form-group">
                            <label for="edit_image">IMAGE:</label>
                            <input type="file" name="image" id="edit_image" class="form-control" accept="image/*" required>
                            <img id="current_image" src="" alt="Current Image" class="img-thumbnail" width="150">
                        </div>
                        <!-- AUDIO -->
                        <div class="form-group">
                            <label for="edit_audio">AUDIO:</label>
                            <input type="file" name="audio" id="edit_audio" class="form-control" accept="audio/*" required>
                            <audio id="current_audio" controls ></audio>
                        </div>
                        <!-- SCRIPT -->
                        <div class="form-group">
                            <label for="edit_script">SCRIPT:</label>
                            <input type="textarea" name="script" id="edit_script" class="form-control" required>
                        </div>
                    
                        <!-- Trường ẩn để giữ giá trị section_id -->
                        <input type="hidden" name="section_id" id="edit_section_id" value="{{ request('section_id') }}">
                    
                        <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Các thư viện JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <script>
        // Khi modal chỉnh sửa được mở
        $('#editquestionModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Nút được click
            var questionId = button.data('id'); // Lấy ID của question

            // Gửi AJAX request để lấy dữ liệu
            $.ajax({
                url: '/section_questions/' + questionId + '/edit',
                method: 'GET',
                success: function (data) {
                    // Gắn dữ liệu vào form
                    $('#editquestionForm').attr('action', '/section_questions/' + questionId);
                    $('#edit_content').val(data.question.content);
                    $('#edit_optA').val(data.question.optA);
                    $('#edit_optB').val(data.question.optB);
                    $('#edit_optC').val(data.question.optC);
                    $('#edit_optD').val(data.question.optD);
                    $('#edit_correctOpt').val(data.question.correctOpt);
                    $('#edit_text').val(data.question.text);
                    $('#edit_type').val(data.question.type);
                    $('#edit_script').val(data.question.script);

                    // Hiển thị ảnh/audio nếu có
                    if (data.question.image) {
                        $('#current_image').attr('src', '/storage/' + data.question.image);
                        $('#current_image').show();
                    } else {
                        $('#current_image').hide();
                    }
                    if (data.question.audio) {
                        $('#current_audio').attr('src', '/storage/' + data.question.audio);
                        $('#current_audio').show();
                    } else {
                        $('#current_audio').hide();
                    }
                },
                error: function () {
                    alert('Không thể tải dữ liệu câu hỏi!');
                }
            });
        });

    </script>
</body>
</html>