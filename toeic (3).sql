-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 13, 2024 lúc 08:45 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `toeic`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `account`, `password`, `name`, `email`, `image`, `created_at`, `updated_at`) VALUES
(1, 'admin', '123', 'ADMIN', 'admin@gmail.com', '', '2024-11-02 11:52:05', NULL),
(2, 'admin0', '$2y$12$ks9QRAs7TV.Dx.LRnFXXtuSNpiGYBm0MENrpzCRNTDZJU9Fp7laUm', 'Admin Name', 'admin@example.com', 'admin0.png', '2024-11-02 13:16:50', '2024-11-02 04:54:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exams`
--

INSERT INTO `exams` (`exam_id`, `name`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Test 1', '120 phút', '2024-11-13 07:07:23', '2024-12-07 07:06:57'),
(4, 'Test 4', '120 phút', '2024-12-11 18:11:43', '2024-12-11 18:11:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam_tests`
--

CREATE TABLE `exam_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `part1_test_id` int(11) DEFAULT NULL,
  `part2_test_id` int(11) DEFAULT NULL,
  `part3_test_id` int(11) DEFAULT NULL,
  `part4_test_id` int(11) DEFAULT NULL,
  `part5_test_id` int(11) DEFAULT NULL,
  `part6_test_id` int(11) DEFAULT NULL,
  `part7_test_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `exam_tests`
--

INSERT INTO `exam_tests` (`id`, `exam_id`, `part1_test_id`, `part2_test_id`, `part3_test_id`, `part4_test_id`, `part5_test_id`, `part6_test_id`, `part7_test_id`, `created_at`, `updated_at`) VALUES
(11, 1, 1, 2, 3, 4, 5, 6, 7, NULL, NULL),
(12, 3, 1, 2, 3, 4, 5, 6, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `grammars`
--

CREATE TABLE `grammars` (
  `grammar_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `grammars`
--

INSERT INTO `grammars` (`grammar_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Nouns', '2024-11-13 06:13:22', '2024-11-13 06:13:22'),
(3, 'Adjective', '2024-11-13 06:20:11', '2024-11-13 06:20:11'),
(4, 'Adverb', '2024-11-13 06:27:45', '2024-11-13 06:27:45'),
(5, 'Pronouns', '2024-11-13 06:28:25', '2024-11-13 06:28:25'),
(6, 'Preposition', '2024-11-13 06:28:57', '2024-11-13 06:28:57'),
(7, 'Conjunction', '2024-11-13 06:30:49', '2024-11-13 06:30:49'),
(8, 'Relative clause', '2024-11-13 06:33:08', '2024-11-13 06:33:08'),
(9, 'Countable and Uncountable nouns', '2024-11-13 06:39:14', '2024-11-13 06:39:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `grammars_contents`
--

CREATE TABLE `grammars_contents` (
  `content_id` int(11) NOT NULL,
  `grammar_id` int(11) NOT NULL,
  `title` int(11) DEFAULT NULL,
  `content` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `learners`
--

CREATE TABLE `learners` (
  `learner_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(120) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `learners`
--

INSERT INTO `learners` (`learner_id`, `name`, `email`, `username`, `password`, `address`, `phoneNumber`, `gender`, `image`, `status`) VALUES
(1, 'abc', 'abc@gmail.com', 'abc', '123', 'a,b,c,d', '0123456789', 'Nam', NULL, 1),
(3, 'Lys', 'Lys@gmail.com', 'LYS', '$2y$12$uY5g947Y2sGKW1j4Y6vSle48qoVbNNYaCfINSTrbUAq1XTHldUKjO', NULL, '12345', NULL, '1732451775.jpg', NULL),
(4, 'a', 'a@gmail.com', 'a', '$2y$12$YUsjZzQ.jfp.CUS/0D6YoOrXpYZmEqW5zAgs11czTUcJiHrbzoclO', NULL, '1534651231', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lessons`
--

INSERT INTO `lessons` (`lesson_id`, `section_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 4, 'bai 1', '2024-11-14 07:09:53', '2024-11-14 07:09:53'),
(4, 3, 'Bài 1: Đoán những gì bạn sẽ nghe', '2024-11-16 08:52:02', '2024-11-16 08:52:02'),
(5, 3, 'Bài 2: Nghe động từ đúng', '2024-11-16 08:57:39', '2024-11-16 08:57:39'),
(6, 3, 'Bài 3: Nghe giới từ và các âm tương tự', '2024-11-16 08:59:20', '2024-11-16 08:59:20'),
(7, 3, 'Bài 4: Nghe để biết chi tiết', '2024-11-16 09:00:40', '2024-11-16 09:00:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lesson_content`
--

CREATE TABLE `lesson_content` (
  `content_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lesson_content`
--

INSERT INTO `lesson_content` (`content_id`, `lesson_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 4, '1. Loại câu hỏi', 'Xem bức tranh và chọn mô tả đúng về bức tranh đó nhất. (tips: nên nghĩ đến chủ đề của bức tranh và các câu hỏi có thể xảy ra)', '2024-11-16 09:05:45', '2024-11-16 09:05:45'),
(2, 4, '2. Hướng dẫn trả lời', 'Hãy nghĩ đến chủ đề của bức tranh cũng như suy nghĩ các danh từ, động từ liên quan\r\nNên dữ đoán những câu có thể xảy ra như:\r\n- The activity\r\n- The general situation\r\n- Spatial relationship\r\nTập trung khi nghe và chọn phát biểu đúng', '2024-11-16 09:15:28', '2024-11-16 09:15:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `materials`
--

CREATE TABLE `materials` (
  `material_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_pdf` longblob DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `materials`
--

INSERT INTO `materials` (`material_id`, `title`, `description`, `file_pdf`, `created_at`, `updated_at`) VALUES
(1, 'Very Easy', 'Very Easy', 0x6d6174657269616c732f59336c764d50764d38324954666b4f6366336452614958524b6357756c6e4a4d7946544a424a6a582e706466, '2024-11-26 04:15:15', '2024-11-26 04:15:15'),
(2, '600 ESSENTIAL WORDS', '600 word', 0x6d6174657269616c732f4467353277666f6a715978734e6751526e683252326d3762527042427555646d3830367a77454c572e706466, '2024-11-26 05:14:12', '2024-11-26 05:14:12'),
(3, 'Big Step 3', 'big step 3', 0x6d6174657269616c732f76724f49474c4c673163347a496d743258493552504f52634c4b5268735771746a76427a673973742e706466, '2024-11-26 05:19:11', '2024-11-26 05:19:11'),
(4, 'Starter', 'starter', 0x6d6174657269616c732f316d704c56786733476a545651766c434369776d6c5452416f5544444e675035544c3479634568722e706466, '2024-11-26 05:20:37', '2024-11-26 05:20:37'),
(5, 'Đề thi 2024', 'new', 0x6d6174657269616c732f413839374b5563304753414341567630745a3434475372703758664b66555356785034576a79344e2e706466, '2024-11-26 05:27:01', '2024-11-26 05:27:01'),
(6, 'abc', 'abc', 0x6d6174657269616c732f6a6969374e684854725630395239644b4463336e6e43446441653833797947616d4f5769716857732e706466, '2024-11-26 05:28:58', '2024-11-26 05:28:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sections`
--

INSERT INTO `sections` (`section_id`, `name`, `image`, `description`, `type`, `created_at`, `updated_at`) VALUES
(3, 'Phần 1: Mô tả tranh', 'images/f5SKVzt9MlkCRhn7mi3wkbrcP7ORXuDHBekrHIUE.png', 'Nghe 1 lần duy nhất mô tả 4 bức tranh, sau đó chọn 1 đáp án mô tả đúng nhất về bức tranh đó', 'part_1', '2024-11-13 05:20:22', '2024-11-15 03:59:29'),
(4, 'Phần 2: Hỏi - đáp', 'images/LBrNDf6HPdGgwgRQDuv8U80KeSLqlOXYQgHyY4Vf.png', 'Nghe 1 lần duy nhất 3 câu hỏi đáp, sau đó chọn câu hỏi đáp phù hợp nhất', 'part_2', '2024-11-13 05:21:12', '2024-11-15 03:59:38'),
(6, 'Phần 3: Đoạn hội thoại', 'images/ti02alRetgFHrg8BEYUME1cN4BvxoCohz2CpdO4c.png', 'Nghe đối thoại giữa 2 hoặc 3 người, sau đó chọn câu hỏi đáp phù hợp nhất', 'part_3', '2024-11-15 02:56:37', '2024-11-15 03:59:47'),
(7, 'Phần 4: Bài nói ngắn', 'images/wFQe7GxLKqyrHDcqCKdqdZCTB0lWitAtG6nYwJlm.png', 'Nghe 1 lần duy nhất, mỗi bài có 3 câu hỏi, mỗi câu hỏi có 4 lựa chọn, sau đó chọn câu hỏi phù hợp nhất', 'part_4', '2024-11-15 03:53:34', '2024-11-15 03:59:56'),
(8, 'Phần 5: Hoàn thành câu', 'images/xTYZDrN0Tu8uRqQeq94mq2Sv0LzQ9SisMgVVJre1.png', 'Chọn đáp án đúng nhất để hoàn thành câu', 'part_5', '2024-11-15 03:55:41', '2024-11-15 04:00:08'),
(9, 'Phần 6: Hoàn thành đoạn văn', 'images/GBhl57VJlInGpMeIRWyLknY8zp425dsQbC2ESzBB.png', 'Hoàn thành câu', 'part_6', '2024-11-15 03:58:47', '2024-11-15 03:58:47'),
(10, 'Phần 7: Đọc hiểu - Đoạn đơn', 'images/sSIsgsGoTtmew1F3keFmCiccrH074qEaitmFscJx.png', 'Bài đọc gồm 2 - 4 câu hỏi, chọn đáp án đúng nhất cho các câu hỏi', 'part_7', '2024-11-15 04:02:46', '2024-11-15 04:02:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `section_questions`
--

CREATE TABLE `section_questions` (
  `question_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `question_group_id` int(11) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `option1` varchar(1024) DEFAULT NULL,
  `option2` varchar(1024) DEFAULT NULL,
  `option3` varchar(1024) DEFAULT NULL,
  `option4` varchar(1024) DEFAULT NULL,
  `correct_option` varchar(1024) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `text` varchar(2048) DEFAULT NULL,
  `script` varchar(2048) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `section_questions`
--

INSERT INTO `section_questions` (`question_id`, `section_id`, `question_group_id`, `content`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `image`, `audio`, `text`, `script`, `updated_at`, `created_at`) VALUES
(2, 3, NULL, 'p1 ls', 'a', 'b', 'c', 'd', 'A', 'questions/images/82x9GGW34mKivDYr4U8naGieajjKx38ayxIu09TS.jpg', 'questions/audio/wKNpWb0RwuEW8lLv2ekeF9Es2qZmKerE0BFnmnD0.mp3', NULL, NULL, '2024-12-02 20:19:54', '2024-12-02 20:19:54'),
(3, 3, NULL, 'p1 ls2', 'a', 'b', 'c', 'd', 'A', 'questions/images/pkT9opYmevQVxxd8W0vf3rvL7ZoN8hqYUJOKPSOd.jpg', 'questions/audio/s9EKYK2QoiVRhkUv1KiIbIdO7OUJkpOpHTxCR2uh.mp3', NULL, NULL, '2024-12-02 20:20:53', '2024-12-02 20:20:53'),
(4, 3, NULL, 'p1 ls', 'a', 'b', 'c', 'd', 'A', 'questions/images/hZo9EI9a4CFheSGlITW8ZQ5HOME1tLUFrgw0u1Zm.jpg', 'questions/audio/rIpL7U1QsJixCjHr0eNz9h8CqGIlqWKHvMPsI5fI.mp3', NULL, NULL, '2024-12-02 20:21:42', '2024-12-02 20:21:42'),
(5, 3, NULL, 'p1 ls 5', 'a', 'b', 'c', 'd', 'A', 'questions/images/ALBfJpX9YSzEtT3eSRRnraHjLpdm6wXHLzkfrfCr.png', 'questions/audio/sBK3fTts3mvTxlUrhDNraYgonqKl9eZk5BlRJV9M.mp3', NULL, NULL, '2024-12-02 20:22:24', '2024-12-02 20:22:24'),
(6, 3, NULL, 'p1 ls 6', 'a', 'b', 'c', 'd', 'A', 'questions/images/buWsN4G1jJWDesHh3KOqa13a1ftl2lvGShJss3DJ.png', 'questions/audio/ibZB3PQKqRN5tI86DBBm70Ap6XcwB9CkBHwQyiSR.mp3', NULL, NULL, '2024-12-02 20:22:58', '2024-12-02 20:22:58'),
(7, 3, NULL, 'p1 ls1', 'a', 'b', 'c', 'd', 'A', 'questions/images/n2QGBjjMgx3gx35Vkgt5NnZAH0Yfkc8rgqjjpUzu.jpg', 'questions/audio/tXAGUziq5yztcJlnAJJF9LVeI6akkHTAcOXKKWYq.mp3', NULL, NULL, '2024-12-02 21:03:05', '2024-12-02 21:03:05'),
(8, 4, NULL, 'p1 ls', 'a', 'b', 'c', NULL, 'A', NULL, 'questions/audio/VvUmsuyGZe3jJ8YsrIoNrJMVSapT0z0Lbm9tGztW.mp3', NULL, NULL, '2024-12-08 04:58:01', '2024-12-08 04:58:01'),
(9, 6, 1, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-12 23:13:45', '2024-12-08 05:07:25'),
(10, 6, 1, 'a', 'b', 'c', 'd', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 05:07:25', '2024-12-08 05:07:25'),
(11, 6, 1, 'a', 'b', 'c', 'd', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 05:07:25', '2024-12-08 05:07:25'),
(12, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/MfmALW0mGKprkTUsy5t9Fvv8b4Uj87J6FMDqUb0i.mp3', NULL, NULL, '2024-12-08 05:45:03', '2024-12-08 05:45:03'),
(13, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/0VoSAP4DkNx9nINLSkUNFNz1nNbsIMH2NSi5VsQe.mp3', NULL, NULL, '2024-12-08 05:45:03', '2024-12-08 05:45:03'),
(14, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/vKLdj0cdUpFfEZ4pszLPyczXpwbrGqWjQRdIlMqf.mp3', NULL, NULL, '2024-12-08 05:45:04', '2024-12-08 05:45:04'),
(15, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/LEXRkYKA73fIUQnvbCG1SrNTvIKZTmnSRCvYdhog.mp3', NULL, NULL, '2024-12-08 05:46:26', '2024-12-08 05:46:26'),
(16, 4, NULL, 'p1 ls', 'b', 'c', 'b', NULL, 'A', NULL, 'questions/audio/TIzzIR6hH5ubvGuM6yuP3fnmPoxTWo7WoAw3x8qt.mp3', NULL, NULL, '2024-12-08 05:46:57', '2024-12-08 05:46:57'),
(17, 4, NULL, 'p1 ls', 'c', 'c', 'c', NULL, 'A', NULL, 'questions/audio/N2ohO4rDdmonEpe4qvQSyVv6LwJcmO91rnTIsGjx.mp3', NULL, NULL, '2024-12-08 05:47:28', '2024-12-08 05:47:28'),
(18, 4, NULL, 'b', 'as', 's', 's', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 05:47:48', '2024-12-08 05:47:48'),
(19, 4, NULL, 'b', 'as', 's', 's', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 05:47:49', '2024-12-08 05:47:49'),
(20, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/28UKNCdvnfi7Xpk5ladXKAQcwRTmHBBjLIN8suot.mp3', NULL, NULL, '2024-12-08 05:48:10', '2024-12-08 05:48:10'),
(21, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/sh6mJYjZxho0A1fBVFLs4GlkEK14HQ25vTEiL08l.mp3', NULL, NULL, '2024-12-08 05:48:11', '2024-12-08 05:48:11'),
(22, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/sDhly1m6Yfqq4WVs67kx2O39lT5ZDJBTmxmDEvwT.mp3', NULL, NULL, '2024-12-08 05:48:11', '2024-12-08 05:48:11'),
(23, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/JPaaENQclTxGTyngGIkGGl1Pujdl6gilyjlIdBj2.mp3', NULL, NULL, '2024-12-08 05:48:12', '2024-12-08 05:48:12'),
(24, 4, NULL, 'a', 'a', 'a', 'a', NULL, 'A', NULL, 'questions/audio/Lcjzj6A010bOYkiYETxj7IqzieQG3GFrYDeZbzwV.mp3', NULL, NULL, '2024-12-08 05:48:13', '2024-12-08 05:48:13'),
(25, 4, NULL, 'a', 'b', 'b', 'b', NULL, 'A', NULL, 'questions/audio/nw6NH4C7mBAHULvT1HtjEX0YdPORAl3nn0W3pJGX.mp3', NULL, NULL, '2024-12-08 05:48:31', '2024-12-08 05:48:31'),
(26, 4, NULL, 'a', 'b', 'b', 'b', NULL, 'A', NULL, 'questions/audio/n5U9u6PxlgHewlhrub8XxVhcE1Y157bKlZGUBBge.mp3', NULL, NULL, '2024-12-08 05:48:32', '2024-12-08 05:48:32'),
(27, 4, NULL, 'a', 'b', 'b', 'b', NULL, 'A', NULL, 'questions/audio/Le4MbVnwsyx2YDfwMVuFizm29yAyk7SqwrbYaWdY.mp3', NULL, NULL, '2024-12-08 05:48:33', '2024-12-08 05:48:33'),
(28, 4, NULL, 'a', 'b', 'b', 'b', NULL, 'A', NULL, 'questions/audio/HzvQWrcfNAGoC187EISogAFU0n71j2M9QB1AlwRO.mp3', NULL, NULL, '2024-12-08 05:48:33', '2024-12-08 05:48:33'),
(29, 4, NULL, 'a', 'b', 'b', 'b', NULL, 'A', NULL, 'questions/audio/dewjuqKWT9KrjTpeNlFNtPQyEBYUvj0d5Qob45lZ.mp3', NULL, NULL, '2024-12-08 05:48:34', '2024-12-08 05:48:34'),
(30, 4, NULL, 'a', 'b', 'b', 'b', NULL, 'A', NULL, 'questions/audio/zeLMjuuqgUvAyVpUCvK6mQgF3a6bYPVzgxkqPJqX.mp3', NULL, NULL, '2024-12-08 05:48:35', '2024-12-08 05:48:35'),
(31, 4, NULL, 'a', 'b', 'b', 'b', NULL, 'A', NULL, 'questions/audio/BHk1iNy0kAWOvwHZlCvdQdXZgil0V0nwwBWpeFf0.mp3', NULL, NULL, '2024-12-08 05:48:35', '2024-12-08 05:48:35'),
(32, 4, NULL, 'a', 's', 'v', 'g', NULL, 'A', NULL, 'questions/audio/ItuUYbBVTDdWGPdf4uo2Vnp26wd1ng16I50xO1ln.mp3', NULL, NULL, '2024-12-08 05:48:57', '2024-12-08 05:48:57'),
(33, 4, NULL, 'acsaca', 's', 'd', 'f', NULL, 'A', NULL, 'questions/audio/uxuT62T7ExZDPVPJTAauVi2BXytVfn4AwebHbIgE.mp3', NULL, NULL, '2024-12-08 05:49:14', '2024-12-08 05:49:14'),
(34, 4, NULL, 'acsaca', 's', 'd', 'f', NULL, 'A', NULL, 'questions/audio/AEfvqRSjq6CGaGAwyvtwb4Y3tLK6oWpNxcGlYAfD.mp3', NULL, NULL, '2024-12-08 05:49:15', '2024-12-08 05:49:15'),
(35, 4, NULL, 'acsaca', 's', 'd', 'f', NULL, 'A', NULL, 'questions/audio/g5pCnnoH0gGW1Zjl90CIvYvo2h4yhzvAX4OtuDpD.mp3', NULL, NULL, '2024-12-08 05:49:15', '2024-12-08 05:49:15'),
(36, 4, NULL, 'acsaca', 's', 'd', 'f', NULL, 'A', NULL, 'questions/audio/eINhqFhjSeDysLlJSCGtoPk1rWMNGlHKwZ7GnY5D.mp3', NULL, NULL, '2024-12-08 05:49:16', '2024-12-08 05:49:16'),
(37, 6, 2, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(38, 6, 2, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(39, 6, 2, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(40, 6, 3, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(41, 6, 3, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(42, 6, 3, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(43, 6, 4, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(44, 6, 4, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(45, 6, 4, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(46, 6, 5, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(47, 6, 5, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(48, 6, 5, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(49, 6, 6, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(50, 6, 6, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(51, 6, 6, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(52, 6, 7, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(53, 6, 7, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(54, 6, 7, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(55, 6, 8, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(56, 6, 8, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(57, 6, 8, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(58, 6, 9, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(59, 6, 9, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(60, 6, 9, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(61, 6, 10, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(62, 6, 10, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(63, 6, 10, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(64, 6, 11, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(65, 6, 11, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(66, 6, 11, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(67, 6, 12, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(68, 6, 12, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(69, 6, 12, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(70, 6, 13, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(71, 6, 13, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(72, 6, 13, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(73, 6, 14, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(74, 6, 14, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(75, 6, 14, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(76, 6, 15, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(77, 6, 15, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(78, 6, 15, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(79, 6, 16, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(80, 6, 16, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(81, 6, 16, 'b', 'b', 'b', 'b', NULL, 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(82, 7, 17, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(83, 7, 17, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(84, 7, 17, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(85, 7, 18, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(86, 7, 18, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(87, 7, 18, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(88, 7, 19, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(89, 7, 19, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(90, 7, 19, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(91, 7, 20, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(92, 7, 20, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(93, 7, 20, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(94, 7, 21, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(95, 7, 21, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(96, 7, 21, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(97, 7, 22, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(98, 7, 22, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(99, 7, 22, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(100, 7, 23, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(101, 7, 23, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(102, 7, 23, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(103, 7, 24, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(104, 7, 24, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(105, 7, 24, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(106, 7, 25, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(107, 7, 25, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(108, 7, 25, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(109, 7, 26, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(110, 7, 26, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(111, 7, 26, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(112, 7, 27, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(113, 7, 27, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(114, 7, 27, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(115, 7, 28, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(116, 7, 28, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(117, 7, 28, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(118, 7, 29, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(119, 7, 29, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(120, 7, 29, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(121, 7, 30, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(122, 7, 30, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(123, 7, 30, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(124, 7, 31, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(125, 7, 31, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(126, 7, 31, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(127, 7, 32, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(128, 7, 32, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(129, 7, 32, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(130, 7, 33, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(131, 7, 33, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(132, 7, 33, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(133, 7, 34, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(134, 7, 34, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(135, 7, 34, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(136, 7, 35, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(137, 7, 35, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(138, 7, 35, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(139, 7, 36, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(140, 7, 36, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(141, 7, 36, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(142, 7, 37, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(143, 7, 37, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(144, 7, 37, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(145, 7, 38, 'a b c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:57', '2024-12-08 06:28:57'),
(146, 7, 38, 'c', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:57', '2024-12-08 06:28:57'),
(147, 7, 38, 'cc', 'c', 'c', 'c', 'c', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:28:57', '2024-12-08 06:28:57'),
(148, 8, 39, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:09', '2024-12-08 06:33:09'),
(149, 8, 40, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:09', '2024-12-08 06:33:09'),
(150, 8, 41, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(151, 8, 42, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(152, 8, 43, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(153, 8, 44, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(154, 8, 45, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(155, 8, 46, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(156, 8, 47, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(157, 8, 48, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(158, 8, 49, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(159, 8, 50, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(160, 8, 51, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(161, 8, 52, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(162, 8, 53, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(163, 8, 54, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(164, 8, 55, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(165, 8, 56, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(166, 8, 57, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(167, 8, 58, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(168, 8, 59, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(169, 8, 60, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(170, 8, 61, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(171, 8, 62, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(172, 8, 63, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(173, 8, 64, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:15', '2024-12-08 06:33:15'),
(174, 8, 65, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:15', '2024-12-08 06:33:15'),
(175, 8, 66, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:15', '2024-12-08 06:33:15'),
(176, 8, 67, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:16', '2024-12-08 06:33:16'),
(177, 8, 68, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:16', '2024-12-08 06:33:16'),
(178, 8, 69, NULL, 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:33:16', '2024-12-08 06:33:16'),
(179, 9, 70, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:38:54', '2024-12-08 06:38:54'),
(180, 9, 70, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:38:54', '2024-12-08 06:38:54'),
(181, 9, 70, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:38:54', '2024-12-08 06:38:54'),
(182, 9, 70, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:38:54', '2024-12-08 06:38:54'),
(183, 9, 71, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(184, 9, 71, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(185, 9, 71, 'a', 'a', 'a', 'a', 'â', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(186, 9, 71, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(187, 9, 72, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(188, 9, 72, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(189, 9, 72, 'a', 'a', 'a', 'a', 'â', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(190, 9, 72, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(191, 9, 73, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(192, 9, 73, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(193, 9, 73, 'a', 'a', 'a', 'a', 'â', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(194, 9, 73, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(195, 9, 74, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(196, 9, 74, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(197, 9, 74, 'a', 'a', 'a', 'a', 'â', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(198, 9, 74, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(199, 9, 75, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(200, 9, 75, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(201, 9, 75, 'a', 'a', 'a', 'a', 'â', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(202, 9, 75, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(203, 10, 76, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(204, 10, 76, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(205, 10, 76, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(206, 10, 76, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(207, 10, 76, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(208, 10, 77, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(209, 10, 77, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(210, 10, 77, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(211, 10, 77, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(212, 10, 77, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(213, 10, 78, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(214, 10, 78, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(215, 10, 78, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(216, 10, 78, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(217, 10, 78, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(218, 10, 79, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(219, 10, 79, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(220, 10, 79, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(221, 10, 79, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(222, 10, 79, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(223, 10, 80, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(224, 10, 80, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(225, 10, 80, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(226, 10, 80, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(227, 10, 80, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(228, 10, 81, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:23', '2024-12-08 06:51:23'),
(229, 10, 81, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:23', '2024-12-08 06:51:23'),
(230, 10, 81, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:23', '2024-12-08 06:51:23'),
(231, 10, 81, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:23', '2024-12-08 06:51:23'),
(232, 10, 82, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(233, 10, 82, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(234, 10, 82, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(235, 10, 82, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(236, 10, 83, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(237, 10, 83, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(238, 10, 83, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(239, 10, 83, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(240, 10, 84, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(241, 10, 84, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(242, 10, 84, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(243, 10, 84, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(244, 10, 85, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(245, 10, 85, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(246, 10, 85, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(247, 10, 85, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(248, 10, 86, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:44', '2024-12-08 06:51:44'),
(249, 10, 86, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:44', '2024-12-08 06:51:44'),
(250, 10, 86, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:51:44', '2024-12-08 06:51:44'),
(251, 10, 87, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:52:10', '2024-12-08 06:52:10'),
(252, 10, 87, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:52:10', '2024-12-08 06:52:10'),
(253, 10, 87, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:52:10', '2024-12-08 06:52:10'),
(254, 10, 88, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:52:11', '2024-12-08 06:52:11'),
(255, 10, 88, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:52:11', '2024-12-08 06:52:11'),
(256, 10, 88, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-08 06:52:11', '2024-12-08 06:52:11'),
(257, 6, 89, 'â', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-12 21:31:38', '2024-12-12 21:31:38'),
(258, 6, 89, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-12 21:31:38', '2024-12-12 21:31:38'),
(259, 6, 89, 'a', 'a', 'a', 'a', 'a', 'A', NULL, NULL, NULL, NULL, '2024-12-12 21:31:38', '2024-12-12 21:31:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('NvWLtaLfeytwExQRWw5lhZIG7uzUhXTnQtOt7E8Q', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYmVkQlplbFhVb2dDZEtTUUtYOG55aXR3WnM0U1R0UXhuVGEycUNNdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9JbmRleEFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1734075430);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_exam_question`
--

CREATE TABLE `tbl_exam_question` (
  `exam_question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `option1` varchar(1024) DEFAULT NULL,
  `option2` varchar(1024) DEFAULT NULL,
  `option3` varchar(1024) DEFAULT NULL,
  `option4` varchar(1024) DEFAULT NULL,
  `correct_option` varchar(1024) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `passage` text DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `part` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_learner_exam`
--

CREATE TABLE `tbl_learner_exam` (
  `learner_exam_id` int(11) NOT NULL,
  `learner_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `completion_time` int(11) DEFAULT NULL,
  `num_listen_correct_ans` int(11) DEFAULT NULL,
  `listen_score` int(11) DEFAULT NULL,
  `num_read_correct_ans` int(11) DEFAULT NULL,
  `read_score` int(11) DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `num_correct_ans` int(11) DEFAULT NULL,
  `num_wrong_ans` int(11) DEFAULT NULL,
  `num_skip_ans` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_learner_exam_question`
--

CREATE TABLE `tbl_learner_exam_question` (
  `learner_exam_id` int(11) NOT NULL,
  `exam_question_id` int(11) NOT NULL,
  `is_correct` int(11) DEFAULT NULL,
  `selected_option` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_learner_vocabulary`
--

CREATE TABLE `tbl_learner_vocabulary` (
  `learner_id` int(11) NOT NULL,
  `vocabulary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_question_group`
--

CREATE TABLE `tbl_question_group` (
  `question_group_id` int(11) NOT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `passage` varchar(255) DEFAULT NULL,
  `script` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_question_group`
--

INSERT INTO `tbl_question_group` (`question_group_id`, `audio`, `image`, `passage`, `script`, `text`, `created_at`, `updated_at`) VALUES
(1, 'questions/audio/LUqwxX0yh1FXWsfXvOziobgQWdNhsFFDWsAkQ7Pj.mp3', NULL, NULL, NULL, NULL, '2024-12-08 05:07:25', '2024-12-08 05:07:25'),
(2, 'questions/audio/qK5dB9JQM7JbyLvf4i3IRvsFFuci0ixsiu15uNnv.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(3, 'questions/audio/v8IrAyI0tNRHtjQefcxaRQhMBuiDfE22NfFbaKYc.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(4, 'questions/audio/iWzTgwnRHAcVBIsF2AiUHuW92dSPAO1dBofDuNyl.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:56', '2024-12-08 06:03:56'),
(5, 'questions/audio/Kkv76x9q9OKQNEGyobq3ITS9BzHB5H063917mqex.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(6, 'questions/audio/T1Dgf2LetCCTLYuRNrN2SAmoeADYBU2MHEKZhaAt.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(7, 'questions/audio/ZDXsWzciRCr4ExShQJYSFjU0sKG6RSkNdQxy6Q4W.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:57', '2024-12-08 06:03:57'),
(8, 'questions/audio/92svT6elonjL0r7iIpGWUKPr0Ggegki8TqHIs2SX.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(9, 'questions/audio/6PF1RSJglnuN9EJHawdYMkaZbz3QFXEXdW5I2NCP.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(10, 'questions/audio/g1vwb5t4J75HuxboLswb3eZ1h3dfCJvx6ghaUoLb.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(11, 'questions/audio/haeHP32RXUFYwRutVfygrD0u7RtX7DwYFnNDhJro.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:58', '2024-12-08 06:03:58'),
(12, 'questions/audio/BQbv3WukPEyOJcAzxeNRO1dEf7RbPmrpy09gt1nj.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(13, 'questions/audio/X5M7m7KqVgVmst3m4RbLST3dCCtTBjGoQ1ZE3ECh.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:03:59', '2024-12-08 06:03:59'),
(14, 'questions/audio/bf2en45ozSjqVXU7EYtZsglRceYWtXO2j2XnQxSe.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(15, 'questions/audio/Xt5GPzopcVcL4ONeUgeULgulPFiVU0wDxm8e9Clv.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(16, 'questions/audio/Lz62NCynaqqI1aM5Pg2ZlGFdOK3JFK7UJkBHsAvl.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:04:00', '2024-12-08 06:04:00'),
(17, 'questions/audio/bMGm2GJ1Q97K3NHvPxkZigM2TpD2FYPteWWie8UY.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(18, 'questions/audio/AIQbfuIOyIQEQEi7ANnoZtv7cpdCmY45WEGmy870.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(19, 'questions/audio/phCkl0ItrXq2Ae5Kq8AUeP4aVVo63YZk9uxh5xtZ.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:52', '2024-12-08 06:28:52'),
(20, 'questions/audio/WkTCsK0SAeg2Vu2I0JbrXpNXCAKqzM21ymcZvcHC.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(21, 'questions/audio/QwUkPOJwACuKqpAvL3tceGuVhhnjcgyBnL0ocWh3.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(22, 'questions/audio/mECIdEvAB3Ee1UnOI6oZTjVO66oZrR6hbdqeVoEb.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(23, 'questions/audio/OTRy4g7gs3lOcN2eqMadjqSMDXvQgnOsXMdfpnPr.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(24, 'questions/audio/HwDn9f6VpM53HK87tFPvvZy9yURl28LWQpOZROAR.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(25, 'questions/audio/xlwNmldfZkvkRbOpeKoTPYfRWcLngOpvjKeO8KTY.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(26, 'questions/audio/yhaqpjgL4xIM3GIiFPj3HQnSeiEPXccrbO0On0km.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(27, 'questions/audio/xDVyivkk2qRUir1rRf0MNm1yRxHcYtURVF8wRkzt.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(28, 'questions/audio/FzhFeFCcpbtjtMDLwNbu503JaRHPrGJ4XXMpSDBW.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:54', '2024-12-08 06:28:54'),
(29, 'questions/audio/zVmab8aucRcTR3Ed2zqSOkyAAsjoEvv2t9VK6Hvo.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(30, 'questions/audio/CvYc7Uo5FL6LYdvEPxzQAfyo5J3NMwe4oIswkBEW.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(31, 'questions/audio/ETsHEYdAuDWbSeXggkgY7lORHQku4YuH6sJs4zbo.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(32, 'questions/audio/LFJnJi7MM4t9CeBq7oHMlpeaWb54JWz7D5Z7ueCX.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(33, 'questions/audio/6w4LDYlLKVfi9FHdcHyJjQwx2KLwlGv9hRMVGMbn.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:55', '2024-12-08 06:28:55'),
(34, 'questions/audio/WFPNt1qPdidjJxGiKuJZPasU3QpexejttSHBn8pw.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(35, 'questions/audio/hfdfIGLgj40DowkSayIVlFFOEY4e3fOwpfaHU0Cf.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(36, 'questions/audio/3xsVf6aATVpbSDdHtlOCaTi6WFaoyvFjgL3zs0eq.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(37, 'questions/audio/AZ6lMNMjyc2Q3U0NWkerJFkiLKlfB9q8Dx6bqDlM.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:56', '2024-12-08 06:28:56'),
(38, 'questions/audio/Z7owbKpEyJ8jKZWwus0kieSO8uVP37RXG5RBNBpP.mp3', NULL, NULL, NULL, NULL, '2024-12-08 06:28:57', '2024-12-08 06:28:57'),
(39, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:09', '2024-12-08 06:33:09'),
(40, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:09', '2024-12-08 06:33:09'),
(41, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(42, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(43, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(44, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(45, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:10', '2024-12-08 06:33:10'),
(46, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(47, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(48, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(49, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(50, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:11', '2024-12-08 06:33:11'),
(51, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(52, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(53, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(54, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:12', '2024-12-08 06:33:12'),
(55, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(56, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(57, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(58, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(59, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:13', '2024-12-08 06:33:13'),
(60, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(61, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(62, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(63, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:14', '2024-12-08 06:33:14'),
(64, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:15', '2024-12-08 06:33:15'),
(65, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:15', '2024-12-08 06:33:15'),
(66, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:15', '2024-12-08 06:33:15'),
(67, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:16', '2024-12-08 06:33:16'),
(68, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:16', '2024-12-08 06:33:16'),
(69, NULL, NULL, NULL, NULL, 'a', '2024-12-08 06:33:16', '2024-12-08 06:33:16'),
(70, NULL, NULL, NULL, NULL, '<p>a</p>\n\n<p>adfcafavfsva</p>\n\n<p>sdvSDFAF</p>\n\n<p>&nbsp;</p>', '2024-12-08 06:38:54', '2024-12-08 06:38:54'),
(71, NULL, NULL, NULL, NULL, '<p>&acirc;vvadv</p>', '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(72, NULL, NULL, NULL, NULL, '<p>&acirc;vvadv</p>', '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(73, NULL, NULL, NULL, NULL, '<p>&acirc;vvadv</p>', '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(74, NULL, NULL, NULL, NULL, '<p>&acirc;vvadv</p>', '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(75, NULL, NULL, NULL, NULL, '<p>&acirc;vvadv</p>', '2024-12-08 06:39:36', '2024-12-08 06:39:36'),
(76, NULL, NULL, NULL, NULL, '<p>sadfasda</p>', '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(77, NULL, NULL, NULL, NULL, '<p>sadfasda</p>', '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(78, NULL, NULL, NULL, NULL, '<p>sadfasda</p>', '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(79, NULL, NULL, NULL, NULL, '<p>sadfasda</p>', '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(80, NULL, NULL, NULL, NULL, '<p>sadfasda</p>', '2024-12-08 06:49:33', '2024-12-08 06:49:33'),
(81, NULL, NULL, NULL, NULL, '<p>&agrave;asfgasfvsdgfe</p>', '2024-12-08 06:51:23', '2024-12-08 06:51:23'),
(82, NULL, NULL, NULL, NULL, '<p>&agrave;asfgasfvsdgfe</p>', '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(83, NULL, NULL, NULL, NULL, '<p>&agrave;asfgasfvsdgfe</p>', '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(84, NULL, NULL, NULL, NULL, '<p>&agrave;asfgasfvsdgfe</p>', '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(85, NULL, NULL, NULL, NULL, '<p>&agrave;asfgasfvsdgfe</p>', '2024-12-08 06:51:24', '2024-12-08 06:51:24'),
(86, NULL, NULL, NULL, NULL, '<p>fwdbgfwefe</p>', '2024-12-08 06:51:44', '2024-12-08 06:51:44'),
(87, NULL, NULL, NULL, NULL, '<p>&agrave;gwfd</p>', '2024-12-08 06:52:10', '2024-12-08 06:52:10'),
(88, NULL, NULL, NULL, NULL, '<p>&agrave;gwfd</p>', '2024-12-08 06:52:11', '2024-12-08 06:52:11'),
(89, 'questions/audio/hwDL0jPMKgiZtaJz9SimWltl6Ibl4Yzh0RwgQsAd.mp3', NULL, NULL, NULL, NULL, '2024-12-12 21:31:38', '2024-12-12 21:31:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_score`
--

CREATE TABLE `tbl_score` (
  `score_id` int(11) NOT NULL,
  `ans_correct` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tests`
--

INSERT INTO `tests` (`test_id`, `section_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 3, 'Test 1', '2024-11-30 14:02:31', '2024-11-30 14:02:31'),
(2, 4, 'Test 1 p2', '2024-12-08 04:51:47', '2024-12-08 04:51:47'),
(3, 6, 'Test 1 p3', '2024-12-08 06:05:03', '2024-12-08 06:05:03'),
(4, 7, 'Test 1 p4', '2024-12-08 06:29:18', '2024-12-08 06:29:18'),
(5, 8, 'Test 1 p5', '2024-12-08 06:34:34', '2024-12-08 06:34:34'),
(6, 9, 'Test 1 p6', '2024-12-08 06:40:02', '2024-12-08 06:40:02'),
(7, 10, 'test 1 p7', '2024-12-08 06:52:32', '2024-12-08 06:52:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test_question`
--

CREATE TABLE `test_question` (
  `test_question_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `test_question`
--

INSERT INTO `test_question` (`test_question_id`, `test_id`, `question_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-12-07 06:54:53', '2024-12-07 06:54:53'),
(2, 1, 3, '2024-12-07 06:54:53', '2024-12-07 06:54:53'),
(3, 1, 4, '2024-12-07 06:54:53', '2024-12-07 06:54:53'),
(4, 1, 5, '2024-12-07 06:54:53', '2024-12-07 06:54:53'),
(5, 1, 6, '2024-12-07 06:54:53', '2024-12-07 06:54:53'),
(6, 1, 7, '2024-12-07 06:54:53', '2024-12-07 06:54:53'),
(7, 1, 2, '2024-12-08 05:37:12', '2024-12-08 05:37:12'),
(8, 1, 3, '2024-12-08 05:37:13', '2024-12-08 05:37:13'),
(9, 1, 4, '2024-12-08 05:37:13', '2024-12-08 05:37:13'),
(10, 1, 5, '2024-12-08 05:37:13', '2024-12-08 05:37:13'),
(11, 1, 6, '2024-12-08 05:37:13', '2024-12-08 05:37:13'),
(12, 1, 7, '2024-12-08 05:37:13', '2024-12-08 05:37:13'),
(13, 2, 8, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(14, 2, 12, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(15, 2, 13, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(16, 2, 14, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(17, 2, 15, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(18, 2, 16, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(19, 2, 17, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(20, 2, 18, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(21, 2, 19, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(22, 2, 20, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(23, 2, 21, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(24, 2, 22, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(25, 2, 23, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(26, 2, 24, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(27, 2, 25, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(28, 2, 26, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(29, 2, 27, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(30, 2, 28, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(31, 2, 29, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(32, 2, 30, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(33, 2, 31, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(34, 2, 32, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(35, 2, 33, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(36, 2, 34, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(37, 2, 35, '2024-12-08 05:50:42', '2024-12-08 05:50:42'),
(38, 1, 2, '2024-12-08 06:00:37', '2024-12-08 06:00:37'),
(39, 1, 3, '2024-12-08 06:00:37', '2024-12-08 06:00:37'),
(40, 1, 4, '2024-12-08 06:00:37', '2024-12-08 06:00:37'),
(41, 1, 5, '2024-12-08 06:00:37', '2024-12-08 06:00:37'),
(42, 1, 6, '2024-12-08 06:00:37', '2024-12-08 06:00:37'),
(43, 1, 7, '2024-12-08 06:00:37', '2024-12-08 06:00:37'),
(44, 3, 9, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(45, 3, 10, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(46, 3, 11, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(47, 3, 37, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(48, 3, 38, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(49, 3, 39, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(50, 3, 40, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(51, 3, 41, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(52, 3, 42, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(53, 3, 43, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(54, 3, 44, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(55, 3, 45, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(56, 3, 46, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(57, 3, 47, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(58, 3, 48, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(59, 3, 49, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(60, 3, 50, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(61, 3, 51, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(62, 3, 52, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(63, 3, 53, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(64, 3, 54, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(65, 3, 55, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(66, 3, 56, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(67, 3, 57, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(68, 3, 58, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(69, 3, 59, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(70, 3, 60, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(71, 3, 61, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(72, 3, 62, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(73, 3, 63, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(74, 3, 64, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(75, 3, 65, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(76, 3, 66, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(77, 3, 67, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(78, 3, 68, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(79, 3, 69, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(80, 3, 70, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(81, 3, 71, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(82, 3, 72, '2024-12-08 06:05:54', '2024-12-08 06:05:54'),
(83, 4, 82, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(84, 4, 83, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(85, 4, 84, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(86, 4, 85, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(87, 4, 86, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(88, 4, 87, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(89, 4, 88, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(90, 4, 89, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(91, 4, 90, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(92, 4, 91, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(93, 4, 92, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(94, 4, 93, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(95, 4, 94, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(96, 4, 95, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(97, 4, 96, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(98, 4, 97, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(99, 4, 98, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(100, 4, 99, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(101, 4, 100, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(102, 4, 101, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(103, 4, 102, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(104, 4, 103, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(105, 4, 104, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(106, 4, 105, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(107, 4, 106, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(108, 4, 107, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(109, 4, 108, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(110, 4, 109, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(111, 4, 110, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(112, 4, 111, '2024-12-08 06:30:50', '2024-12-08 06:30:50'),
(113, 5, 148, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(114, 5, 149, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(115, 5, 150, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(116, 5, 151, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(117, 5, 152, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(118, 5, 153, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(119, 5, 154, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(120, 5, 155, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(121, 5, 156, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(122, 5, 157, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(123, 5, 158, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(124, 5, 159, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(125, 5, 160, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(126, 5, 161, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(127, 5, 162, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(128, 5, 163, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(129, 5, 164, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(130, 5, 165, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(131, 5, 166, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(132, 5, 167, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(133, 5, 168, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(134, 5, 169, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(135, 5, 170, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(136, 5, 171, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(137, 5, 172, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(138, 5, 173, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(139, 5, 174, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(140, 5, 175, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(141, 5, 176, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(142, 5, 177, '2024-12-08 06:37:44', '2024-12-08 06:37:44'),
(143, 6, 179, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(144, 6, 180, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(145, 6, 181, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(146, 6, 182, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(147, 6, 183, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(148, 6, 184, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(149, 6, 185, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(150, 6, 186, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(151, 6, 187, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(152, 6, 188, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(153, 6, 189, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(154, 6, 190, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(155, 6, 191, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(156, 6, 192, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(157, 6, 193, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(158, 6, 194, '2024-12-08 06:41:56', '2024-12-08 06:41:56'),
(159, 7, 203, '2024-12-08 06:53:12', '2024-12-08 06:53:12'),
(160, 7, 204, '2024-12-08 06:53:12', '2024-12-08 06:53:12'),
(161, 7, 205, '2024-12-08 06:53:12', '2024-12-08 06:53:12'),
(162, 7, 206, '2024-12-08 06:53:12', '2024-12-08 06:53:12'),
(163, 7, 207, '2024-12-08 06:53:12', '2024-12-08 06:53:12'),
(164, 7, 208, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(165, 7, 209, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(166, 7, 210, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(167, 7, 211, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(168, 7, 212, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(169, 7, 213, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(170, 7, 214, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(171, 7, 215, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(172, 7, 216, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(173, 7, 217, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(174, 7, 218, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(175, 7, 219, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(176, 7, 220, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(177, 7, 221, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(178, 7, 222, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(179, 7, 223, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(180, 7, 224, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(181, 7, 225, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(182, 7, 226, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(183, 7, 227, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(184, 7, 228, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(185, 7, 229, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(186, 7, 230, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(187, 7, 231, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(188, 7, 232, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(189, 7, 233, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(190, 7, 234, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(191, 7, 235, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(192, 7, 236, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(193, 7, 237, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(194, 7, 238, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(195, 7, 239, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(196, 7, 240, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(197, 7, 241, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(198, 7, 242, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(199, 7, 243, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(200, 7, 244, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(201, 7, 245, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(202, 7, 246, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(203, 7, 247, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(204, 7, 248, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(205, 7, 249, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(206, 7, 250, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(207, 7, 251, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(208, 7, 252, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(209, 7, 253, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(210, 7, 254, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(211, 7, 255, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(212, 7, 256, '2024-12-08 06:53:13', '2024-12-08 06:53:13'),
(213, 7, 203, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(214, 7, 204, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(215, 7, 205, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(216, 7, 206, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(217, 7, 207, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(218, 7, 208, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(219, 7, 209, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(220, 7, 210, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(221, 7, 211, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(222, 7, 212, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(223, 7, 213, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(224, 7, 214, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(225, 7, 215, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(226, 7, 216, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(227, 7, 217, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(228, 7, 218, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(229, 7, 219, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(230, 7, 220, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(231, 7, 221, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(232, 7, 222, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(233, 7, 223, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(234, 7, 224, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(235, 7, 225, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(236, 7, 226, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(237, 7, 227, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(238, 7, 228, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(239, 7, 229, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(240, 7, 230, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(241, 7, 231, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(242, 7, 232, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(243, 7, 233, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(244, 7, 234, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(245, 7, 235, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(246, 7, 236, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(247, 7, 237, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(248, 7, 238, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(249, 7, 239, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(250, 7, 240, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(251, 7, 241, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(252, 7, 242, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(253, 7, 243, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(254, 7, 244, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(255, 7, 245, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(256, 7, 246, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(257, 7, 247, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(258, 7, 248, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(259, 7, 249, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(260, 7, 250, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(261, 7, 251, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(262, 7, 252, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(263, 7, 253, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(264, 7, 254, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(265, 7, 255, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(266, 7, 256, '2024-12-11 02:43:15', '2024-12-11 02:43:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `topics`
--

INSERT INTO `topics` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(5, 'CONTRACTS', 'images/GZdETa5v2pwJRrlHxcbA0ziH3itFf2xLOHR97dsE.jpg', '2024-11-13 01:31:10', '2024-11-29 12:33:43'),
(6, 'MARKETING', 'images/Uu4HcY003Q56kuByowi2h3s22WzEVyeIuKVWjHLJ.jpg', '2024-11-13 03:14:10', '2024-11-29 12:31:38'),
(7, 'WARRANTIES', 'images/2xyQFVDsRTtRdwnuGXscy7Lq1KPAoi01NjLWDq6W.jpg', '2024-11-13 03:18:06', '2024-11-29 12:31:26'),
(8, 'Business Planning', 'images/vABdehhv29zxHx4JqGAdPEtqzYmy2JuEHJOmZ5hz.jpg', '2024-11-13 03:22:00', '2024-11-29 12:36:28'),
(9, 'Conferences', 'images/NN67apzrAO3bW3YSMORGw5fVPvATzMwIfBjSp5mn.jpg', '2024-11-13 03:34:20', '2024-11-29 12:38:42'),
(10, 'Computers', 'images/qm216oPjUl7yE4HaECu23SIGamIG3BiGFUyjCV4h.jpg', '2024-11-13 03:36:43', '2024-11-29 12:39:37'),
(11, 'Office Technology', 'images/9Zhai0TRH2fx3Mli4ukFrD3vt8GnvxkL6hsx96J7.jpg', '2024-11-29 12:40:29', '2024-11-29 12:40:29'),
(12, 'Office Procedures', 'images/WbvM2PJz4g5lnGZ12WimCTwFFm7MtMHEUqAfpURG.jpg', '2024-11-29 12:41:22', '2024-11-29 12:41:22'),
(13, 'Electronics', 'images/a2VgVnIazYv75pu3ijpftiu2EtIWE101lQmIWTo3.jpg', '2024-11-29 12:42:40', '2024-11-29 12:42:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vocabularys`
--

CREATE TABLE `vocabularys` (
  `vocabulary_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  `ipa` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meaning` varchar(255) DEFAULT NULL,
  `example_sentence` varchar(1024) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Chỉ mục cho bảng `exam_tests`
--
ALTER TABLE `exam_tests`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `grammars`
--
ALTER TABLE `grammars`
  ADD PRIMARY KEY (`grammar_id`);

--
-- Chỉ mục cho bảng `grammars_contents`
--
ALTER TABLE `grammars_contents`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `grammar_id` (`grammar_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `learners`
--
ALTER TABLE `learners`
  ADD PRIMARY KEY (`learner_id`);

--
-- Chỉ mục cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Chỉ mục cho bảng `lesson_content`
--
ALTER TABLE `lesson_content`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Chỉ mục cho bảng `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`material_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Chỉ mục cho bảng `section_questions`
--
ALTER TABLE `section_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `question_group_id` (`question_group_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `tbl_exam_question`
--
ALTER TABLE `tbl_exam_question`
  ADD PRIMARY KEY (`exam_question_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Chỉ mục cho bảng `tbl_learner_exam`
--
ALTER TABLE `tbl_learner_exam`
  ADD PRIMARY KEY (`learner_exam_id`),
  ADD KEY `learner_id` (`learner_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Chỉ mục cho bảng `tbl_learner_exam_question`
--
ALTER TABLE `tbl_learner_exam_question`
  ADD PRIMARY KEY (`learner_exam_id`,`exam_question_id`),
  ADD KEY `exam_question_id` (`exam_question_id`);

--
-- Chỉ mục cho bảng `tbl_learner_vocabulary`
--
ALTER TABLE `tbl_learner_vocabulary`
  ADD PRIMARY KEY (`learner_id`,`vocabulary_id`),
  ADD KEY `vocabulary_id` (`vocabulary_id`);

--
-- Chỉ mục cho bảng `tbl_question_group`
--
ALTER TABLE `tbl_question_group`
  ADD PRIMARY KEY (`question_group_id`);

--
-- Chỉ mục cho bảng `tbl_score`
--
ALTER TABLE `tbl_score`
  ADD PRIMARY KEY (`score_id`);

--
-- Chỉ mục cho bảng `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Chỉ mục cho bảng `test_question`
--
ALTER TABLE `test_question`
  ADD PRIMARY KEY (`test_question_id`);

--
-- Chỉ mục cho bảng `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `vocabularys`
--
ALTER TABLE `vocabularys`
  ADD PRIMARY KEY (`vocabulary_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `exam_tests`
--
ALTER TABLE `exam_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `grammars`
--
ALTER TABLE `grammars`
  MODIFY `grammar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `grammars_contents`
--
ALTER TABLE `grammars_contents`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `learners`
--
ALTER TABLE `learners`
  MODIFY `learner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `lesson_content`
--
ALTER TABLE `lesson_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `materials`
--
ALTER TABLE `materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `section_questions`
--
ALTER TABLE `section_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT cho bảng `tbl_exam_question`
--
ALTER TABLE `tbl_exam_question`
  MODIFY `exam_question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_learner_exam`
--
ALTER TABLE `tbl_learner_exam`
  MODIFY `learner_exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_question_group`
--
ALTER TABLE `tbl_question_group`
  MODIFY `question_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT cho bảng `tbl_score`
--
ALTER TABLE `tbl_score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `test_question`
--
ALTER TABLE `test_question`
  MODIFY `test_question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT cho bảng `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vocabularys`
--
ALTER TABLE `vocabularys`
  MODIFY `vocabulary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `grammars_contents`
--
ALTER TABLE `grammars_contents`
  ADD CONSTRAINT `grammars_contents_ibfk_1` FOREIGN KEY (`grammar_id`) REFERENCES `grammars` (`grammar_id`);

--
-- Các ràng buộc cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Các ràng buộc cho bảng `lesson_content`
--
ALTER TABLE `lesson_content`
  ADD CONSTRAINT `lesson_content_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`);

--
-- Các ràng buộc cho bảng `section_questions`
--
ALTER TABLE `section_questions`
  ADD CONSTRAINT `section_questions_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `section_questions_ibfk_2` FOREIGN KEY (`question_group_id`) REFERENCES `tbl_question_group` (`question_group_id`);

--
-- Các ràng buộc cho bảng `tbl_exam_question`
--
ALTER TABLE `tbl_exam_question`
  ADD CONSTRAINT `tbl_exam_question_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`);

--
-- Các ràng buộc cho bảng `tbl_learner_exam`
--
ALTER TABLE `tbl_learner_exam`
  ADD CONSTRAINT `tbl_learner_exam_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`),
  ADD CONSTRAINT `tbl_learner_exam_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`);

--
-- Các ràng buộc cho bảng `tbl_learner_exam_question`
--
ALTER TABLE `tbl_learner_exam_question`
  ADD CONSTRAINT `tbl_learner_exam_question_ibfk_1` FOREIGN KEY (`learner_exam_id`) REFERENCES `tbl_learner_exam` (`learner_exam_id`),
  ADD CONSTRAINT `tbl_learner_exam_question_ibfk_2` FOREIGN KEY (`exam_question_id`) REFERENCES `tbl_exam_question` (`exam_question_id`);

--
-- Các ràng buộc cho bảng `tbl_learner_vocabulary`
--
ALTER TABLE `tbl_learner_vocabulary`
  ADD CONSTRAINT `tbl_learner_vocabulary_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`),
  ADD CONSTRAINT `tbl_learner_vocabulary_ibfk_2` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabularys` (`vocabulary_id`);

--
-- Các ràng buộc cho bảng `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Các ràng buộc cho bảng `vocabularys`
--
ALTER TABLE `vocabularys`
  ADD CONSTRAINT `vocabularys_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
