<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Bootstrap CSS -->
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <!-- Font Awesome -->
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css">
    
    <title>Admin Page</title>
    <style>
        :root {
            --main-color: #f9fbff;
            --color-dark: #fcfdff;
            --text-grey: hsl(217, 60%, 55%);
            --top-height: 70px; /* Bạn có thể điều chỉnh chiều cao này */
        }
        /* Global styles */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            list-style-type: none;
            text-decoration: none;
            font-family: Arial, sans-serif;
        }

        body {
            height: 100%; 
            margin: 0;
            background-color: #f8f9fc;
            font-family: 'Roboto', sans-serif;
        }

        /* Sidebar styling */
        .sidebar {
            width: 200px;
            position: fixed;
            left: 0;
            top: 0;
            height: 100%;
            background-color: var(--main-color);
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
        }

        .sidebar-brand span {
            display: inline-block;
            padding-right: 1rem;
        }

        .sidebar-menu li {
            width: 100%;
            margin-bottom: 1rem; /* Giảm khoảng cách giữa các mục */
            padding-left: 2rem;
        }

        .sidebar-menu a {
            padding: 0.8rem 1rem; /* Tăng khoảng cách bên trong */
            display: block;
            color: #000719;
            font-size: 1.2rem;
            border-radius: 30px 0px 0px 30px; /* Bo góc bên phải */
            transition: background-color 0.3s, color 0.3s; /* Hiệu ứng chuyển tiếp */
        }

        .sidebar-menu a:hover {
            background: #5595d9; /* Màu nền khi hover */
            color: #fff;
            text-decoration: none;
        }

        .sidebar-menu a span:first-child {
            font-size: 1.5rem;
            padding-right: 1rem;
        }

        /* Admin header */
        .header {
            display: flex;
            justify-content: space-between;
            padding: 1rem;
        }

        .admin-sidebar-top img {
            height: var(--top-height); /* Chiều cao logo */
            width: 70px; /* Chiều rộng logo */
            margin-bottom: 1.5rem; /* Khoảng cách dưới logo */
            border-bottom: 1px solid #4b5563; /* Đường viền dưới logo */
        }

        /* Admin content */
        .admin-content {
            margin-left: 220px; /* Khoảng cách bằng chiều rộng của sidebar */
            padding: 0px;
            background-color: #f8f9fc;
            min-height: 90vh;
        }

        .admin-content-main h1 {
            color: #244f7d;
            font-size: 1.5rem;
            font-weight: bold;
            padding-left: 20px;
        }

        .admin-sidebar-top {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-brand">
            <div class="admin-sidebar-top">
                <img src="{{ asset('images/logo.png') }}" alt="Logo">
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="{{ route('admin.index') }}" class="active">
                            <div class="header-account">
                                <i class="fa-solid fa-house"></i> Dashboard
                            </div>
                        </a>
                    </li> 
                    <li>
                        <a href="{{ route('qlsection') }}">
                            <div class="header-account">
                                <i class="fa-solid fa-section"></i> Section 
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('qltopic') }}">
                            <div class="header-account">
                                <i class="fa-solid fa-file-lines"></i> Topic
                            </div>
                        </a>
                    </li>
                    
                    <li>
                        <a href="{{ route('qlgrammar') }}">
                            <div class="header-account">
                                <i class="fa-solid fa-spell-check"></i> Grammar
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('qllearner') }}">
                            <div class="header-account">
                                <i class="fa-solid fa-user-graduate"></i> Learner
                            </div>
                        </a>
                    </li>                   

                    <li>
                        <a href="{{ route('qlexam') }}">
                            <div class="header-account">
                                <i class="fa-solid fa-file"></i> Exam
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('qlmaterial') }}">
                            <div class="header-account">
                                <i class="fa-solid fa-folder-open"></i> Material
                            </div>
                        </a>
                    </li>
 
                </ul>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>
