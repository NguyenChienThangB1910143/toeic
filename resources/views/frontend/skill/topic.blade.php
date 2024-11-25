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
        <button class="search-btn">Search</button>
    </div>
    <div class="main-content">
        <aside class="other-practices">
            <h2>Other Practices:</h2>
            <ul>
              <li><a href="#">Phần 1: Mô tả tranh</a></li>
              <li><a href="#">Phần 2: Hỏi - Đáp</a></li>
              <li><a href="#">Phần 3: Đoạn hội thoại</a></li>
              <li><a href="#">Phần 4: Bài nói ngắn</a></li>
              <li><a href="#">Phần 5: Hoàn thành câu</a></li>
              <!-- Add more practices as needed -->
            </ul>
        </aside>
        <div class="topics">
          <div class="topic">
            <img src="contracts.png" alt="Contracts">
            <p>CONTRACTS</p>
          </div>
          <div class="topic">
            <img src="marketing.png" alt="Marketing">
            <p>MARKETING</p>
          </div>
          <div class="topic">
            <img src="warranties.png" alt="Warranties">
            <p>WARRANTIES</p>
          </div>
          <div class="topic">
            <img src="high_quality_control.png" alt="High Quality Control">
            <p>HIGH QUALITY CONTROL</p>
          </div>
          <div class="topic">
            <img src="product_development.png" alt="Product Development">
            <p>PRODUCT DEVELOPMENT</p>
          </div>
          <div class="topic">
            <img src="selecting_a_restaurant.png" alt="Selecting a Restaurant">
            <p>SELECTING A RESTAURANT</p>
          </div>
          <!-- Add more topics as needed -->
        </div>
    </div>
    
</div>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
