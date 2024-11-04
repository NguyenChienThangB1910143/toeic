<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="/Backend/asser/css/style.css">

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css">

</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <!-- Nội dung chính -->
    <div class="admin-content">
        <div class="admin-content-main">
            <h1>Trang chủ</h1>
            
            <div class="overview">
                <div class="card-overview">
                    <div class="card-body">
                        <h5 class="card-title">Tổng số học viên</h5>
                        <p class="card-text">1500</p>
                    </div>
                </div>
                <div class="card-overview">
                    <div class="card-body">
                        <h5 class="card-title">Tổng số bài thi</h5>
                        <p class="card-text">1200</p>
                    </div>
                </div>
                <div class="card-overview">
                    <div class="card-body">
                        <h5 class="card-title">Tổng số chủ đề</h5>
                        <p class="card-text">10</p>
                    </div>
                </div>
                <div class="card-overview">
                    <div class="card-body">
                        <h5 class="card-title">Tổng số tài liệu</h5>
                        <p class="card-text">5</p>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ thống kê -->
            <div class="chart">
                <div class="card-chart">
                    <h5 class="m-0">Thống kê</h5>
                </div>
                <div class="card-body">
                    <canvas id="myChart" style="max-height: 400px;"></canvas>
                </div>
            </div>

             <!-- Bảng dữ liệu -->
             <div class="table">
                <div class="card-table">
                    <h5 class="m-0">Danh sách học viên</h5>
                </div>

                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Email</th>
                                <th>Ngày đăng ký</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nguyễn Văn A</td>
                                <td>vana@example.com</td>
                                <td>01/01/2024</td>
                                <td><span class="badge badge-success">Đang hoạt động</span></td>
                            </tr>
                            <tr>
                                <td>Trần Thị B</td>
                                <td>tb@example.com</td>
                                <td>05/01/2024</td>
                                <td><span class="badge badge-danger">Ngưng hoạt động</span></td>
                            </tr>
                            <tr>
                                <td>Đỗ Minh C</td>
                                <td>mc@example.com</td>
                                <td>10/01/2024</td>
                                <td><span class="badge badge-success">Đang hoạt động</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </div>
    </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // Biểu đồ thống kê
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5'],
                datasets: [{
                    label: 'Người dùng mới',
                    data: [12, 19, 3, 5, 2],
                    backgroundColor: 'rgba(173, 216, 230, 0.2)',
                    borderColor: 'rgba(15, 109, 146, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
