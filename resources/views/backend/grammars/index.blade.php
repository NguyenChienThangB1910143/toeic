<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/css/QLGrammar.css') }}">
    <title>Grammar</title>
</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-grammar">
            <h1 class="grammar-title">Grammar</h1>

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
                <button class="btn-add" data-toggle="modal" data-target="#addgrammarModal">Add grammar</button>
            </div>

            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Grammar Name</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Action</th>
                            <th>Manage</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($grammars as $grammar)
                        <tr>
                            <td>{{ ($grammars->currentPage() - 1) * $grammars->perPage() + $loop->iteration }}</td>
                            <td>{{ $grammar->name }}</td>
                            <td>{{ $grammar->created_at }}</td>
                            <td>{{ $grammar->updated_at }}</td>
                            <td>
                                <button class="btn-edit" data-toggle="modal" data-target="#editgrammarModal"
                                    data-id="{{ $grammar->grammar_id }}"
                                    data-name="{{ $grammar->name }}"
                                    data-created_at="{{ $grammar->created_at }}"
                                    data-updated_at="{{ $grammar->updated_at }}">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <form action="{{ route('grammars.destroy', $grammar->grammar_id) }}" method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </button>
                                </form>
                            </td>
                            <td>
                                <a href="{{ route('qlgrammar_content', ['grammar_id' => $grammar->grammar_id]) }}" class="btn-manage contentBtn">Content</a>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center">Không có ngữ pháp nào.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <div class="pagination-links">
                {{ $grammars->links() }}
            </div>
        </div>
    </div>

    <!-- Modal Thêm grammar -->
    <div class="modal" id="addgrammarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Grammar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('grammars.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="name">Grammar Name:</label>
                            <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Chỉnh sửa grammar -->
    <div class="modal" id="editgrammarModal" tabindex="-1" role="dialog" aria-labelledby="editgrammarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editgrammarLabel">Edit Grammar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data" id="editgrammarForm">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="edit_name">Grammar Name:</label>
                            <input type="text" name="name" id="edit_name" class="form-control" required>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script>
        $('#editgrammarModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var name = button.data('name');
            var modal = $(this);
            modal.find('#edit_name').val(name);
            modal.find('#editgrammarForm').attr('action', '/grammars/' + id);
        });
    </script>
</body>
</html>
