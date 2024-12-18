{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleGrammar.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-grammar">
    <div class="title">
        <h1 class="title-text">Học Ngữ Pháp TOEIC</h1>
    </div>
    <div class="search-bar">
        <input type="text" placeholder="Tìm kiếm">
        <button class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
    </div>
    <div class="main-content">
      @foreach ($grammars as $grammar)
      <a href="{{ route('grammar.content', ['grammar_id' => $grammar->grammar_id]) }}">
        <div class="grammar">
                <p>{{ strtoupper($grammar->name) }}</p>
            </div>
        </a>
      @endforeach

    </div>
</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
