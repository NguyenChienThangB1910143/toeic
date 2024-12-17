
@if ($vocabulary)
<div class="flashcard">
    <div class="card">
        <div class="card-front">
            <div class="card-image">
                <img src="{{ asset('storage/' . $vocabulary->image) }}" alt="{{ $vocabulary->word }}">
            </div>
            <div class="card-info">
                <h2 class="word">{{ ucfirst($vocabulary->word) }}</h2>
                <p class="ipa">{{ $vocabulary->ipa }}</p>
            </div>
        </div>
        <div class="card-back">
            <div class="meaning">
                <p>{{ $vocabulary->meaning }}</p>
            </div>
            <div class="example-sentence">
                <p>{{ $vocabulary->example_sentence }}</p>
            </div>
        </div>
    </div>
</div>

<div class="card-navigation">
    <button id="prevBtn" class="prev" {{ $vocabularies->currentPage() == 1 ? 'disabled' : '' }}>&#8592;</button>
    <span>{{ $vocabularies->currentPage() }} / {{ $vocabularies->lastPage() }}</span>
    <button id="nextBtn" class="next" {{ $vocabularies->currentPage() == $vocabularies->lastPage() ? 'disabled' : '' }}>&#8594;</button>
</div>
@else
<p>Không có từ vựng trong chủ đề này</p>
@endif
