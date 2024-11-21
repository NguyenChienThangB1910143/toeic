{{-- Bao gồm header --}}
@include('frontend.inc.header')

{{-- Nội dung chính của trang --}}
<div class="container-body">

        <div class="bgr">
                <div class="title">
                    <h1>Nền tảng luyện tập chứng chỉ Tiếng Anh Online</h1>
                    <h3>Chào mừng bạn đến với Learn&Lead TOEIC, trang web học trực tuyến hàng đầu dành cho người học ngoại ngữ. Learn&Lead TOEIC là công cụ hỗ trợ học tập hiệu quả dành cho các bạn đang chuẩn bị thi lấy các chứng chỉ ngoại ngữ quốc tế và cả những bạn chỉ đơn giản muốn nâng cao kỹ năng ngoại ngữ của mình. Với bộ câu hỏi luyện tập của chúng tôi, bạn sẽ dễ dàng đạt được chứng chỉ ngoại ngữ bạn đang cần trong thời gian nhanh chóng!</h3>
                    
                </div>
                <div class="bgr_img">
                        <img src="{{ asset('./images/rb_10088.png') }}" alt="" width="100%">
                </div>
        </div>

</div>

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
