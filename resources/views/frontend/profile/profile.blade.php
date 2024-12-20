{{-- Bao gồm header --}}
@include('frontend.inc.header')
<link rel="stylesheet" href="{{ asset('assets/css/StyleProfile.css') }}">

@section('content')
{{-- Nội dung chính của trang --}}
<div class="profile-container">
    <h2 class="profile-title">Thông Tin Cá Nhân</h2>

    <!-- Thông báo -->
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @elseif(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif

    <div class="profile-content">
        <!-- Profile Picture Section -->
        <div class="profile-picture-section">
            <!-- khung Ảnh đại diện -->

            <img src="{{ asset('storage/' . $learner->image)}}" 
                alt="Ảnh đại diện" class="profile-picture">

            <!-- Form cập nhật ảnh -->
            <form action="{{ route('profile.updatePhoto') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="file" name="image" accept="image/*" required>
                <button type="submit" class="update-photo-button">Cập Nhật Ảnh</button>
            </form>

            <button class="change-password-button" onclick="openModal()">Đổi Mật Khẩu</button>
        </div>

        <!-- General Information Section -->
        <form action="{{ route('profile.update') }}" method="POST" class="profile-info">
            @csrf
            @method('POST') {{-- Phương thức cập nhật --}}
            <div class="info-item">
                <label for="name">Họ và Tên:</label>
                <input type="text" name="name" id="name" value="{{ $learner->name }}" required>
            </div>
            <div class="info-item">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" value="{{ $learner->email }}" required>
            </div>
            <div class="info-item">
                <label for="phone">Số Điện Thoại:</label>
                <input type="tel" name="phone" id="phone" value="{{ $learner->phoneNumber }}" required>
            </div>
            <div class="info-item">
                <label for="address">Địa Chỉ:</label>
                <input type="text" name="address" id="address" value="{{ $learner->address }}" required>
            </div>
            <div class="info-item">
                <label for="gender">Giới Tính:</label>
                <select name="gender" id="gender">
                    <option value="male" {{ $learner->gender == 'male' ? 'selected' : '' }}>Nam</option>
                    <option value="female" {{ $learner->gender == 'female' ? 'selected' : '' }}>Nữ</option>
                    <option value="other" {{ $learner->gender == 'other' ? 'selected' : '' }}>Khác</option>
                </select>
            </div>
            <button type="submit" class="save-button">Lưu Thay Đổi</button>
        </form>
    </div>

    <!-- Modal for Changing Password -->
    <div id="passwordModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <h3>Đổi Mật Khẩu</h3>
            <form action="{{ route('profile.changePassword') }}" method="POST">
                @csrf
                <div class="info-item">
                    <label for="current-password">Mật Khẩu Hiện Tại:</label>
                    <input type="password" name="current_password" id="current-password" required>
                </div>
                <div class="info-item">
                    <label for="new-password">Mật Khẩu Mới:</label>
                    <input type="password" name="new_password" id="new-password" required>
                </div>
                <div class="info-item">
                    <label for="confirm-password">Xác Nhận Mật Khẩu:</label>
                    <input type="password" name="new_password_confirmation" id="confirm-password" required>
                </div>
                <button type="submit" class="save-button">Lưu Thay Đổi</button>
            </form>
        </div>
    </div>
</div>

<script>
    // Open the modal
    function openModal() {
        document.getElementById("passwordModal").style.display = "flex";
    }

    // Close the modal
    function closeModal() {
        document.getElementById("passwordModal").style.display = "none";
    }

    // Close the modal when clicking outside of it
    window.onclick = function(event) {
        const modal = document.getElementById("passwordModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };
</script>

{{-- Bao gồm footer --}}
@include('frontend.inc.footer')
