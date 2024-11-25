{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleHome.css') }}">
{{-- Nội dung chính của trang --}}
    <section class="bgr_img">
        <div class="container bgr">
            <div class="title-text">
                <h1 class="welcome-title">
                    Nền tảng luyện tập chứng chỉ 
                    <span class="online-text">Tiếng Anh Online</span>
                </h1>
                <div class="welcome-text">
                    <p>Chào mừng bạn đến với Learn & Lead TOEIC, trang web học trực tuyến hàng đầu dành cho người học ngoại ngữ. </p>
                    <p>Learn & Lead TOEIC là công cụ hỗ trợ học tập hiệu quả dành cho các bạn đang chuẩn bị thi lấy các chứng chỉ ngoại ngữ quốc tế 
                        và cả những bạn chỉ đơn giản muốn nâng cao kỹ năng ngoại ngữ của mình. 
                        Với bộ câu hỏi luyện tập của chúng tôi, bạn sẽ dễ dàng đạt được chứng chỉ ngoại ngữ bạn đang cần trong thời gian nhanh chóng!</p>
                </div>
            </div>
        </div>
    </section>

    <section class="section courses" id="courses">
        <div class="container">
            <div class="row event_box">
              <div class="col-lg-4 col-md-6 align-self-center mb-30 event_outer col-md-6 design">
                <div class="events_item">
                  <div class="thumb">
                    <a href="#"><img src="{{ asset('./images/part-1.webp') }}" alt=""></a>
                    <span class="category">Listening</span>
                  </div>
                  <div class="down-content">
                    <span class="author">Part 1</span>
                    <h4>Predict what you will hear</h4>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 align-self-center mb-30 event_outer col-md-6 development">
                <div class="events_item">
                  <div class="thumb">
                    <a href="#"><img src="{{ asset('./images/part-2.webp') }}" alt=""></a>
                    <span class="category">Listening</span>
                  </div>
                  <div class="down-content">
                    <span class="author">Part 2</span>
                    <h4>Listen for correct verb</h4>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 align-self-center mb-30 event_outer col-md-6 design wordpress">
                <div class="events_item">
                  <div class="thumb">
                    <a href="#"><img src="{{ asset('./images/part-3.webp') }}" alt=""></a>
                    <span class="category">Listening</span>
                  </div>
                  <div class="down-content">
                    <span class="author">Part 3</span>
                    <h4>Listen for details</h4>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 align-self-center mb-30 event_outer col-md-6 development">
                <div class="events_item">
                  <div class="thumb">
                    <a href="#"><img src="{{ asset('./images/part-4.webp') }}" alt=""></a>
                    <span class="category">Reading</span>
                  </div>
                  <div class="down-content">
                    <span class="author">Part 1</span>
                    <h4>Part of speech</h4>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 align-self-center mb-30 event_outer col-md-6 wordpress development">
                <div class="events_item">
                  <div class="thumb">
                    <a href="#"><img src="{{ asset('./images/part-6.webp') }}" alt=""></a>
                    <span class="category">Reading</span>
                  </div>
                  <div class="down-content">
                    <span class="author">Part 2</span>
                    <h4> Gerunds & Infinitives</h4>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 align-self-center mb-30 event_outer col-md-6 wordpress design">
                <div class="events_item">
                  <div class="thumb">
                    <a href="#"><img src="{{ asset('./images/part-7.webp') }}" alt=""></a>
                    <span class="category">Reading</span>
                  </div>
                  <div class="down-content">
                    <span class="author">Part 3</span>
                    <h4>Suffixes and Prefixes</h4>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <section class="newsletter">
            <h2>Đăng ký nhận bản tin</h2>
            <p>Nhận thông tin và các khóa học mới nhất từ chúng tôi!</p>
            <form>
                <input type="email" placeholder="Nhập email của bạn" required>
                <button>Đăng ký</button>
            </form>
        </section>
    </section>


{{-- Bao gồm footer --}}
@include('frontend.inc.footer')

{{-- SLIDER --}}
{{-- <script>
    document.addEventListener("DOMContentLoaded", function() {
        const sliderItems = document.querySelector('.slider-items');
        const sliderItem = document.querySelectorAll('.slider-item');
        const arrowRight = document.querySelector('.ri-arrow-right-fill');
        const arrowLeft = document.querySelector('.ri-arrow-left-fill');
        let i = 0;

        function updateSlider() {
            sliderItem.forEach((item) => {
                item.classList.remove('active');
                item.style.opacity = '0';
            });

            sliderItems.style.transform = `translateX(${-i * 100}%)`;
            sliderItem[i].classList.add('active');

            setTimeout(() => {
                sliderItem[i].style.opacity = '1';
            }, 100);
        }

        arrowRight.addEventListener('click', () => {
            i = (i + 1) % sliderItem.length;
            updateSlider();
        });

        arrowLeft.addEventListener('click', () => {
            i = (i - 1 + sliderItem.length) % sliderItem.length;
            updateSlider();
        });

        setInterval(() => {
            arrowRight.click();
        }, 3000);
    });
</script> --}}
