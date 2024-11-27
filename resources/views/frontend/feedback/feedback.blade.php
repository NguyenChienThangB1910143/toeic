{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleFeedback.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container mt-5">
    <h1>Gửi Góp Ý</h1>
    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif
    <form method="POST" action="{{ route('feedback.store') }}">
        @csrf
        <div class="mb-3">
            <label for="message" class="form-label">Nội dung góp ý</label>
            <textarea class="form-control @error('message') is-invalid @enderror" id="message" name="message" rows="5" required>{{ old('message') }}</textarea>
            @error('message')
                <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
        <button type="submit" class="btn btn-primary">Gửi</button>
    </form>
</div>


{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
