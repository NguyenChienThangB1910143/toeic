// Lấy các phần tử cần thiết từ DOM
const sliderItems = document.querySelector('.slider-items');
const sliderItem = document.querySelectorAll('.slider-item');
const arrowRight = document.querySelector('.ri-arrow-right-fill');
const arrowLeft = document.querySelector('.ri-arrow-left-fill');
const header = document.querySelector('.header');

// Biến điều khiển chỉ số hiện tại của slider
let i = 0;

// Hàm cập nhật slider
function updateSlider() {
    // Ẩn tất cả slider items
    sliderItem.forEach((item) => {
        item.classList.remove('active'); // Xóa lớp active
        item.style.opacity = '0'; // Đặt opacity về 0
    });
    
    // Cập nhật slider với item hiện tại
    sliderItems.style.transform = `translateX(${-i * 100}%)`; // Di chuyển slider
    sliderItem[i].classList.add('active'); // Thêm lớp active cho item hiện tại

    // Từ từ tăng opacity cho item hiện tại
    setTimeout(() => {
        sliderItem[i].style.opacity = '1'; // Đặt opacity về 1
    }, 100); // Thay đổi độ trễ nếu cần
}

// Thêm sự kiện click cho nút mũi tên phải
arrowRight.addEventListener('click', () => {
    i = (i + 1) % sliderItem.length; // Chuyển sang item tiếp theo (circular)
    updateSlider();
});

// Thêm sự kiện click cho nút mũi tên trái
arrowLeft.addEventListener('click', () => {
    i = (i - 1 + sliderItem.length) % sliderItem.length; // Quay lại item trước (circular)
    updateSlider();
});

// Tự động chuyển slider sau mỗi 3 giây
setInterval(() => {
    arrowRight.click(); // Tự động click vào nút mũi tên phải
}, 3000);

  // Giả định trạng thái đăng nhập từ hệ thống backend
  var isLoggedIn = false; // Kiểm tra xem người dùng đã đăng nhập hay chưa

  // Thao tác với biểu tượng tài khoản
// Chọn phần tử của icon và dropdown
const accountIcon = document.getElementById('account-icon');
const dropdown = document.querySelector('.account-dropdown');

// Sử dụng cờ để theo dõi trạng thái hiển thị của dropdown
let dropdownVisible = false;

// Xử lý sự kiện click vào icon
accountIcon.addEventListener('click', function(event) {
    event.preventDefault();
    
    // Toggle hiển thị hoặc ẩn dropdown
    if (!dropdownVisible) {
        dropdown.style.display = 'block';
        dropdown.style.opacity = '1';
        dropdown.style.transform = 'translateY(0)';
    } else {
        dropdown.style.display = 'none';
        dropdown.style.opacity = '0';
        dropdown.style.transform = 'translateY(-10px)';
    }
    
    // Cập nhật cờ
    dropdownVisible = !dropdownVisible;
});

// Đóng dropdown khi click ra ngoài
document.addEventListener('click', function(event) {
    // Nếu click ngoài icon và dropdown, thì ẩn dropdown
    if (!accountIcon.contains(event.target) && !dropdown.contains(event.target)) {
        dropdown.style.display = 'none';
        dropdown.style.opacity = '0';
        dropdown.style.transform = 'translateY(-10px)';
        dropdownVisible = false; // Reset trạng thái
    }
});
const isLoggedIn = true; // Thay bằng logic kiểm tra trạng thái đăng nhập thực tế
const avatarUrl = 'path/to/user-avatar.jpg'; // Đường dẫn ảnh đại diện người dùng

if (isLoggedIn && avatarUrl) {
    // Thay thế icon bằng ảnh đại diện
    document.getElementById('account-icon-default').classList.add('hidden');
    const avatar = document.getElementById('account-avatar');
    avatar.src = avatarUrl;
    avatar.classList.remove('hidden');
}
