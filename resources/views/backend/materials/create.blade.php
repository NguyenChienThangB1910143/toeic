<!-- resources/views/materials/create.blade.php -->
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('assets/css/QLMaterial.css') }}">
    <title>Thêm Mới Material</title>
</head>
<body>
    <div class="container">
        <h1>Thêm Mới Material</h1>
        
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('materials.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label for="title">Tiêu Đề:</label>
                <input type="text" name="title" id="title" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label for="description">Mô Tả:</label>
                <textarea name="description" id="description" class="form-control"></textarea>
            </div>
            
            <div class="form-group">
                <label for="file_pdf">Tải Lên File PDF:</label>
                <input type="file" name="file_pdf" id="file_pdf" class="form-control-file" accept="application/pdf" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Tạo Material</button>
            <a href="{{ route('qlmaterial') }}" class="btn btn-secondary">Quay Lại</a>
        </form>
    </div>
</body>
</html>
