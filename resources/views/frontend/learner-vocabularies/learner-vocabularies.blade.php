{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleLearnerVocabularies.css') }}">

{{-- Nội dung chính của trang --}}
<div class="container-vocabularies">
    <div class="title">
        <h1 class="title-text">Vocabularies</h1>
        <h2 class="subtitle">Contract</h2>
    </div>
    <div class="gallery">
        <img src="image1.png" alt="Flashcard 1">
        <img src="image2.png" alt="Flashcard 2">
        <img src="image3.png" alt="Flashcard 3">
      </div>
  
      <div class="practice-section">
        <table>
          <thead>
            <tr>
              <th>Từ vựng</th>
              <th>Ảnh</th>
              <th>Phiên âm</th>
              <th>Nghĩa</th>
              <th>Nghe</th>
              <th>Phát âm</th>
              <th>Lưu trữ từ vựng</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Resolve</td>
              <td><img src="resolve.png" alt="Resolve"></td>
              <td>/rɪˈzɒlv/</td>
              <td>Giải quyết</td>
              <td><button class="play-sound" data-sound="resolve.mp3">🔊</button></td>
              <td><button>🎙️</button></td>
              <td>⭐</td>
            </tr>
            <tr>
              <td>Abide</td>
              <td><img src="abide.png" alt="Abide"></td>
              <td>/əˈbaɪd/</td>
              <td>Tuân theo</td>
              <td><button class="play-sound" data-sound="abide.mp3">🔊</button></td>
              <td><button>🎙️</button></td>
              <td>⭐</td>
            </tr>
            <!-- Add more rows as needed -->
          </tbody>
        </table>
      </div>
  
      <aside>
        <h2>Other Topics</h2>
        <ul>
          <li><a href="#">Contracts</a></li>
          <li><a href="#">Financial Statements</a></li>
          <li><a href="#">Marketing</a></li>
          <li><a href="#">Property and Departments</a></li>
          <li><a href="#">Warranties</a></li>
          <!-- Add more topics as needed -->
        </ul>
      </aside>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", () => {
  const soundButtons = document.querySelectorAll(".play-sound");

  soundButtons.forEach(button => {
    button.addEventListener("click", () => {
      const sound = new Audio(button.dataset.sound);
      sound.play();
    });
  });
});

</script>
{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
