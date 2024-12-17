<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/css/QLLeaner.css') }}">
    <title>Quản Lý Học Viên</title>

</head>
<body>
    @include('backend.inc.topbar')
    @include('backend.inc.sidebar')

    <div class="admin-content">
        <div class="admin-learner">
            <h1 class="leaner-title">Quản Lý Học Viên</h1>
            <div class="search-learner">
                <input type="text" class="search-input" placeholder="Tìm kiếm học viên..." id="searchlearnerInput" onkeyup="filterlearners()">
            </div>
            <div class="table-container">
                <table class="table" id="learnerTable">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Hình ảnh</th>
                            <th>Email</th>
                            <th>Username</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th>Giới tính</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($learners as $learner)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>
                                <img src="{{ asset('storage/' . $learner->image) }}" alt="Hình ảnh" class="table-image" width="50" height="50">
                            </td>
                            <td>{{ $learner->email }}</td>
                            <td>{{ $learner->username }}</td>
                            <td>{{ $learner->address }}</td>
                            <td>{{ $learner->phoneNumber }}</td>
                            <td>{{ $learner->gender == 'male' ? 'Nam' : 'Nữ' }}</td>
                            <td>
                                @if ($learner->status == '1')
                                    <a class="badge badge-success" href="{{ route('learner.status', $learner->learner_id) }}">Đang hoạt động</a>
                                @else
                                    <a class="badge badge-danger" href="{{ route('learner.status', $learner->learner_id) }}">Ngưng hoạt động</a> 
                                @endif
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination links -->
            {{ $learners->links() }}
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function loadHTML(url, elementId) {
            fetch(url)
                .then(response => response.text())
                .then(data => {
                    document.getElementById(elementId).innerHTML = data;
                })
                .catch(error => console.error('Error loading HTML:', error));
        }

        function filterlearners() {
            const input = document.getElementById('searchlearnerInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('learnerTable');
            const trs = table.getElementsByTagName('tr');

            // for (let i = 1; i < trs.length; i++) {
            //     const tds = trs[i].getElementsByTagName('td');
            //     let found = false;

            //     for (let j = 0; j < tds.length; j++) {
            //         if (tds[j]) {
            //             const txtValue = tds[j].textContent || tds[j].innerText;
            //             if (txtValue.toLowerCase().indexOf(filter) > -1) {
            //                 found = true;
            //                 break;
            //             }
            //         }
            //     }
            //     trs[i].style.display = found ? '' : 'none';
            // }
            for (let i = 1; i < trs.length; i++) {
                const usernameCell = trs[i].getElementsByTagName('td')[3]; // Cột chứa username
                if (usernameCell) {
                    const txtValue = usernameCell.textContent || usernameCell.innerText;
                    trs[i].style.display = txtValue.toLowerCase().indexOf(filter) > -1 ? '' : 'none';
                }
            }
        }

        loadHTML('/backend/inc/topbar.html', 'topbar');
        loadHTML('/backend/inc/sidebar.html', 'sidebar');
    </script>
</body>
</html>
