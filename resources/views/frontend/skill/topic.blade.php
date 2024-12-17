{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleTopic.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-topic">
    <div class="title">
        <h1 class="title-text">Học Từ Vựng TOEIC Theo Chủ Đề</h1>
    </div>
    <div class="search-bar">
        <input type="text" placeholder="Tìm kiếm">
        <button class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
    </div>
    <div class="main-content">
      @foreach ($topics as $topic)
        <a href="{{ route('topic.vocabularies', ['id' => $topic->id]) }}">
            <div class="topic">
                <img src="{{ asset('storage/' . $topic->image) }}" alt="{{ $topic->name }}">
                <p>{{ strtoupper($topic->name) }}</p>
            </div>
        </a>
      @endforeach

    </div>
</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
