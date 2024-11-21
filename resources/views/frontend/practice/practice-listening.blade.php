
{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StylePractice.css') }}">

{{-- Nội dung chính của trang --}}
<div class="curved-background">
    <h1>Luyện thi TOEIC Listening</h1>
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

</body>
</html>