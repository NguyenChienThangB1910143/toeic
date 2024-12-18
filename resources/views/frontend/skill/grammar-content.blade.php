{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleGrammar.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-grammar-content">
    <div class="title">
        <h1 class="title-text">{{ $current_grammar->name }}</h1>
    </div>
    <div class="content">
        <!-- Other grammar-->
        <div class="grammar">
            <h3>OTHER GRAMMARS:</h3>
            <ul class="grammar-list">
                @foreach($grammars as $grammar)
                <li><a href="{{ route('grammar.content', ['grammar_id' => $grammar->grammar_id]) }}">{{ $grammar->name }}</a></li>
                @endforeach
            </ul>
        </div>
        <!-- grammar content -->
        <div class="grammar-content">
            @foreach($grammars_content as $content)
                <h3>{{ $content->title }}</h3>
                <p>{{ $content->content }}</p>
            @endforeach
        </div>
    </div>   
</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
