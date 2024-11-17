@extends('backend.layouts.app')

@material('title', 'Chỉnh Sửa material')

@material('content')
<div class="container">
    <h1>Chỉnh Sửa material</h1>

    <!-- Hiển thị lỗi nếu có -->
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <!-- Form chỉnh sửa material -->
    <form action="{{ route('materials.update', $material->material_id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <!-- Tên material -->
        <div class="form-group">
            <label for="title">Tên material:</label>
            <input type="text" name="title" id="title" class="form-control" value="{{ old('title', $material->title) }}" required>
        </div>

        <!-- Mô tả (description) -->
        <div class="form-group"></div>
            <label for="description">Mô Tả:</label>
            <textarea name="description" id="description" class="form-control">{{ old('description', $material->description) }}</textarea>
        </div>

        <!-- File pfd -->
        <div class="form-group"></div>
            <label for="file_pdf">File PDF:</label>
            <input type="file_pdf" name="file_pdf" id="file_pdf" class="form-control" accept=".pdf">
        </div>

        <!-- Nút cập nhật -->
        <button type="submit" class="btn btn-primary">Cập Nhật Material</button>
        <a href="{{ route('qlmaterial') }}" class="btn btn-secondary">Quay Lại</a>
    </form>
</div>
@endmaterial
