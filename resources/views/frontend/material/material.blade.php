{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleMaterial.css') }}">

{{-- Nội dung chính của trang --}}
<div class="download-container">
    <h2 class="download-title">DOWNLOAD TÀI LIỆU MIỄN PHÍ TOEIC</h2>

    <div class="download-content">
        @foreach($materials as $material)
            <div class="file-card">
                <div class="file-info-container">
                    <div class="file-icon">📁</div>
                    <div class="file-info">
                        <h4>{{ $material->title }}</h4>
                    </div>
                </div>
                <div class="download-button-container">
                    <button class="download-button" href="{{ asset('storage/' . $material->file_pdf) }}" download><i class="fa-solid fa-download"></i></button>
                </div>
            </div>
        @endforeach
    </div>

</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
