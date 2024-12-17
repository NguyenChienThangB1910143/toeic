@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleFlashcards.css') }}">

<div class="container-flashcards">
    <h1 class="title-text">{{$topic->name}}</h1>
    <div id="flashcard-container" class="flashcard-container">
        @include('frontend.skill.flashcard_partial')
    </div>
</div>

@include('frontend.inc.footer')

<script>
    let currentPage = {{ $vocabularies->currentPage() }};
    const totalPages = {{ $vocabularies->lastPage() }};
    const topicId = {{ $vocabulary->topic_id }};
    
    // Xử lý sự kiện click trên flashcard để đảo mặt
    document.querySelectorAll('.flashcard').forEach(card => {
        card.addEventListener('click', () => {
            card.classList.toggle('clicked');
        });
    });

    // Xử lý sự kiện khi nhấn Next hoặc Previous
    document.addEventListener('click', function (e) {
        if (e.target.id === 'nextBtn' || e.target.id === 'prevBtn') {
            const direction = e.target.id === 'nextBtn' ? 1 : -1;
            const newPage = currentPage + direction;

            if (newPage > 0 && newPage <= totalPages) {
                fetchFlashcard(newPage);
            }
        }
    });

    // Hàm để tải flashcard mới
    function fetchFlashcard(page) {
        fetch(`/vocabularies/${topicId}/page/${page}`)
            .then(response => response.text())
            .then(html => {
                document.getElementById('flashcard-container').innerHTML = html;
                currentPage = page;

                // Cập nhật lại trạng thái nút Next và Previous
                document.getElementById('prevBtn').disabled = currentPage === 1;
                document.getElementById('nextBtn').disabled = currentPage === totalPages;
                // Gán lại sự kiện click cho các flashcard mới
                document.querySelectorAll('.flashcard').forEach(card => {
                    card.addEventListener('click', () => {
                        card.classList.toggle('clicked');
                    });
                });
            })
            .catch(error => console.error('Error:', error));
    }
</script>
