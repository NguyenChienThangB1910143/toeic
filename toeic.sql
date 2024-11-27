-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 05:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toeic`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
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
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `account`, `password`, `name`, `email`, `image`, `created_at`, `updated_at`) VALUES
(1, 'admin', '123', 'ADMIN', 'admin@gmail.com', '', '2024-11-02 11:52:05', NULL),
(2, 'admin0', '$2y$12$ks9QRAs7TV.Dx.LRnFXXtuSNpiGYBm0MENrpzCRNTDZJU9Fp7laUm', 'Admin Name', 'admin@example.com', 'admin0.png', '2024-11-02 13:16:50', '2024-11-02 04:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `name`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Test 1', '120 phút', '2024-11-13 07:07:23', '2024-11-13 07:07:23'),
(2, 'Test 2', '120 phút', '2024-11-14 14:24:25', '2024-11-14 14:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `grammars`
--

CREATE TABLE `grammars` (
  `grammar_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grammars`
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
-- Table structure for table `jobs`
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
-- Table structure for table `job_batches`
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
-- Table structure for table `learners`
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
-- Dumping data for table `learners`
--

INSERT INTO `learners` (`learner_id`, `name`, `email`, `username`, `password`, `address`, `phoneNumber`, `gender`, `image`, `status`) VALUES
(1, 'abc', 'abc@gmail.com', 'abc', '123', 'a,b,c,d', '0123456789', 'Nam', NULL, 1),
(3, 'Lys', 'Lys@gmail.com', 'LYS', '$2y$12$uY5g947Y2sGKW1j4Y6vSle48qoVbNNYaCfINSTrbUAq1XTHldUKjO', NULL, '12345', NULL, '1732451775.jpg', NULL),
(4, 'a', 'a@gmail.com', 'a', '$2y$12$YUsjZzQ.jfp.CUS/0D6YoOrXpYZmEqW5zAgs11czTUcJiHrbzoclO', NULL, '1534651231', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`lesson_id`, `section_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 4, 'bai 1', '2024-11-14 07:09:53', '2024-11-14 07:09:53'),
(4, 3, 'Bài 1: Đoán những gì bạn sẽ nghe', '2024-11-16 08:52:02', '2024-11-16 08:52:02'),
(5, 3, 'Bài 2: Nghe động từ đúng', '2024-11-16 08:57:39', '2024-11-16 08:57:39'),
(6, 3, 'Bài 3: Nghe giới từ và các âm tương tự', '2024-11-16 08:59:20', '2024-11-16 08:59:20'),
(7, 3, 'Bài 4: Nghe để biết chi tiết', '2024-11-16 09:00:40', '2024-11-16 09:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_content`
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
-- Dumping data for table `lesson_content`
--

INSERT INTO `lesson_content` (`content_id`, `lesson_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 4, '1. Loại câu hỏi', 'Xem bức tranh và chọn mô tả đúng về bức tranh đó nhất. (tips: nên nghĩ đến chủ đề của bức tranh và các câu hỏi có thể xảy ra)', '2024-11-16 09:05:45', '2024-11-16 09:05:45'),
(2, 4, '2. Hướng dẫn trả lời', 'Hãy nghĩ đến chủ đề của bức tranh cũng như suy nghĩ các danh từ, động từ liên quan\r\nNên dữ đoán những câu có thể xảy ra như:\r\n- The activity\r\n- The general situation\r\n- Spatial relationship\r\nTập trung khi nghe và chọn phát biểu đúng', '2024-11-16 09:15:28', '2024-11-16 09:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `material_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
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
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `name`, `image`, `description`, `type`, `created_at`, `updated_at`) VALUES
(3, 'Phần 1: Mô tả tranh', 'images/f5SKVzt9MlkCRhn7mi3wkbrcP7ORXuDHBekrHIUE.png', 'Nghe 1 lần duy nhất mô tả 4 bức tranh, sau đó chọn 1 đáp án mô tả đúng nhất về bức tranh đó', 'listening', '2024-11-13 05:20:22', '2024-11-15 03:59:29'),
(4, 'Phần 2: Hỏi - đáp', 'images/LBrNDf6HPdGgwgRQDuv8U80KeSLqlOXYQgHyY4Vf.png', 'Nghe 1 lần duy nhất 3 câu hỏi đáp, sau đó chọn câu hỏi đáp phù hợp nhất', 'listening', '2024-11-13 05:21:12', '2024-11-15 03:59:38'),
(6, 'Phần 3: Đoạn hội thoại', 'images/ti02alRetgFHrg8BEYUME1cN4BvxoCohz2CpdO4c.png', 'Nghe đối thoại giữa 2 hoặc 3 người, sau đó chọn câu hỏi đáp phù hợp nhất', 'listening', '2024-11-15 02:56:37', '2024-11-15 03:59:47'),
(7, 'Phần 4: Bài nói ngắn', 'images/wFQe7GxLKqyrHDcqCKdqdZCTB0lWitAtG6nYwJlm.png', 'Nghe 1 lần duy nhất, mỗi bài có 3 câu hỏi, mỗi câu hỏi có 4 lựa chọn, sau đó chọn câu hỏi phù hợp nhất', 'listening', '2024-11-15 03:53:34', '2024-11-15 03:59:56'),
(8, 'Phần 5: Hoàn thành câu', 'images/xTYZDrN0Tu8uRqQeq94mq2Sv0LzQ9SisMgVVJre1.png', 'Chọn đáp án đúng nhất để hoàn thành câu', 'reading', '2024-11-15 03:55:41', '2024-11-15 04:00:08'),
(9, 'Phần 6: Hoàn thành đoạn văn', 'images/GBhl57VJlInGpMeIRWyLknY8zp425dsQbC2ESzBB.png', 'Hoàn thành câu', 'reading', '2024-11-15 03:58:47', '2024-11-15 03:58:47'),
(10, 'Phần 7: Đọc hiểu - Đoạn đơn', 'images/sSIsgsGoTtmew1F3keFmCiccrH074qEaitmFscJx.png', 'Bài đọc gồm 2 - 4 câu hỏi, chọn đáp án đúng nhất cho các câu hỏi', 'reading', '2024-11-15 04:02:46', '2024-11-15 04:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `section_questions`
--

CREATE TABLE `section_questions` (
  `question_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `question_group_id` int(11) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `option1` varchar(1024) DEFAULT NULL,
  `option2` varchar(1024) DEFAULT NULL,
  `option3` varchar(1024) DEFAULT NULL,
  `option4` varchar(1024) DEFAULT NULL,
  `correct_option` varchar(1024) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(2048) DEFAULT NULL,
  `text` varchar(2048) NOT NULL,
  `script` varchar(2048) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('b1Ngf7OIA0X4T0RYegvP2f2YhM0d8lLHe4qgiWp9', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSmU1bmVOcGlzN2NLZkNJajE1V3BRQjlyUjh2Q1UxZW9EZEVON2tpaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kaWN0aW9uYXJ5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1732452822);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_exam_question`
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
-- Table structure for table `tbl_grammar_content`
--

CREATE TABLE `tbl_grammar_content` (
  `content_id` int(11) NOT NULL,
  `grammar_id` int(11) NOT NULL,
  `title` int(11) DEFAULT NULL,
  `content` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_learner_exam`
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
-- Table structure for table `tbl_learner_exam_question`
--

CREATE TABLE `tbl_learner_exam_question` (
  `learner_exam_id` int(11) NOT NULL,
  `exam_question_id` int(11) NOT NULL,
  `is_correct` int(11) DEFAULT NULL,
  `selected_option` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_learner_vocabulary`
--

CREATE TABLE `tbl_learner_vocabulary` (
  `learner_id` int(11) NOT NULL,
  `vocabulary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question_group`
--

CREATE TABLE `tbl_question_group` (
  `question_group_id` int(11) NOT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `passage` varchar(255) DEFAULT NULL,
  `script` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_score`
--

CREATE TABLE `tbl_score` (
  `score_id` int(11) NOT NULL,
  `ans_correct` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_test`
--

CREATE TABLE `tbl_test` (
  `test_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `participants` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_test_question`
--

CREATE TABLE `tbl_test_question` (
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vocabulary`
--

CREATE TABLE `tbl_vocabulary` (
  `vocabulary_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meaning` varchar(255) DEFAULT NULL,
  `example_sentence` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `topic_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `image`, `description`, `topic_type`, `created_at`, `updated_at`) VALUES
(5, 'A', 'images/8kiOh1S0yVfKg834MyJnSWyNgT8mgXqBwREMz9Uy.png', 'a', 'reading', '2024-11-13 01:31:10', '2024-11-13 01:31:10'),
(6, 'abc', 'images/dOIYCTiUQy9UBbmI3X7gLlvWo7C9XFjiWV5wAURX.png', 'abc', 'listening', '2024-11-13 03:14:10', '2024-11-13 05:18:56'),
(7, 'Tài liệu sơ cấp (1-200)', 'images/8Fs1p55NMb7BN9s3a5NiuQgXU0Em4FrlyVTkbVzD.png', 'lv1', 'reading', '2024-11-13 03:18:06', '2024-11-13 03:34:44'),
(8, 'Tài liệu sơ cấp (1-200)', 'images/duYupl5Ck2w7CmvUCr3CLg93Mm71jWRzPzt6ddz4.jpg', 'sâc', 'listening', '2024-11-13 03:22:00', '2024-11-13 03:34:34'),
(9, 'A', 'images/JvH9iw8xq4bw8H2HYffIf64f3h5qCvQaQzDrH7JU.png', 'a', 'reading', '2024-11-13 03:34:20', '2024-11-13 03:34:20'),
(10, 'Tài liệu sơ cấp (1-200)', 'images/kW9zHQzJPoqzgdNeqMrwOAlyIm2Cn7b45l9zDloM.jpg', 'sâf', 'listening', '2024-11-13 03:36:43', '2024-11-13 03:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `grammars`
--
ALTER TABLE `grammars`
  ADD PRIMARY KEY (`grammar_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `learners`
--
ALTER TABLE `learners`
  ADD PRIMARY KEY (`learner_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `lesson_content`
--
ALTER TABLE `lesson_content`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`material_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `section_questions`
--
ALTER TABLE `section_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `question_group_id` (`question_group_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tbl_exam_question`
--
ALTER TABLE `tbl_exam_question`
  ADD PRIMARY KEY (`exam_question_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `tbl_grammar_content`
--
ALTER TABLE `tbl_grammar_content`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `grammar_id` (`grammar_id`);

--
-- Indexes for table `tbl_learner_exam`
--
ALTER TABLE `tbl_learner_exam`
  ADD PRIMARY KEY (`learner_exam_id`),
  ADD KEY `learner_id` (`learner_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `tbl_learner_exam_question`
--
ALTER TABLE `tbl_learner_exam_question`
  ADD PRIMARY KEY (`learner_exam_id`,`exam_question_id`),
  ADD KEY `exam_question_id` (`exam_question_id`);

--
-- Indexes for table `tbl_learner_vocabulary`
--
ALTER TABLE `tbl_learner_vocabulary`
  ADD PRIMARY KEY (`learner_id`,`vocabulary_id`),
  ADD KEY `vocabulary_id` (`vocabulary_id`);

--
-- Indexes for table `tbl_question_group`
--
ALTER TABLE `tbl_question_group`
  ADD PRIMARY KEY (`question_group_id`);

--
-- Indexes for table `tbl_score`
--
ALTER TABLE `tbl_score`
  ADD PRIMARY KEY (`score_id`);

--
-- Indexes for table `tbl_test`
--
ALTER TABLE `tbl_test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `tbl_test_question`
--
ALTER TABLE `tbl_test_question`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `tbl_vocabulary`
--
ALTER TABLE `tbl_vocabulary`
  ADD PRIMARY KEY (`vocabulary_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grammars`
--
ALTER TABLE `grammars`
  MODIFY `grammar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learners`
--
ALTER TABLE `learners`
  MODIFY `learner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lesson_content`
--
ALTER TABLE `lesson_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `section_questions`
--
ALTER TABLE `section_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_exam_question`
--
ALTER TABLE `tbl_exam_question`
  MODIFY `exam_question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_grammar_content`
--
ALTER TABLE `tbl_grammar_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_learner_exam`
--
ALTER TABLE `tbl_learner_exam`
  MODIFY `learner_exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_question_group`
--
ALTER TABLE `tbl_question_group`
  MODIFY `question_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_score`
--
ALTER TABLE `tbl_score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_test`
--
ALTER TABLE `tbl_test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_vocabulary`
--
ALTER TABLE `tbl_vocabulary`
  MODIFY `vocabulary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Constraints for table `lesson_content`
--
ALTER TABLE `lesson_content`
  ADD CONSTRAINT `lesson_content_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`);

--
-- Constraints for table `section_questions`
--
ALTER TABLE `section_questions`
  ADD CONSTRAINT `section_questions_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `section_questions_ibfk_2` FOREIGN KEY (`question_group_id`) REFERENCES `tbl_question_group` (`question_group_id`);

--
-- Constraints for table `tbl_exam_question`
--
ALTER TABLE `tbl_exam_question`
  ADD CONSTRAINT `tbl_exam_question_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`);

--
-- Constraints for table `tbl_grammar_content`
--
ALTER TABLE `tbl_grammar_content`
  ADD CONSTRAINT `tbl_grammar_content_ibfk_1` FOREIGN KEY (`grammar_id`) REFERENCES `grammars` (`grammar_id`);

--
-- Constraints for table `tbl_learner_exam`
--
ALTER TABLE `tbl_learner_exam`
  ADD CONSTRAINT `tbl_learner_exam_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`),
  ADD CONSTRAINT `tbl_learner_exam_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`);

--
-- Constraints for table `tbl_learner_exam_question`
--
ALTER TABLE `tbl_learner_exam_question`
  ADD CONSTRAINT `tbl_learner_exam_question_ibfk_1` FOREIGN KEY (`learner_exam_id`) REFERENCES `tbl_learner_exam` (`learner_exam_id`),
  ADD CONSTRAINT `tbl_learner_exam_question_ibfk_2` FOREIGN KEY (`exam_question_id`) REFERENCES `tbl_exam_question` (`exam_question_id`);

--
-- Constraints for table `tbl_learner_vocabulary`
--
ALTER TABLE `tbl_learner_vocabulary`
  ADD CONSTRAINT `tbl_learner_vocabulary_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`),
  ADD CONSTRAINT `tbl_learner_vocabulary_ibfk_2` FOREIGN KEY (`vocabulary_id`) REFERENCES `tbl_vocabulary` (`vocabulary_id`);

--
-- Constraints for table `tbl_test`
--
ALTER TABLE `tbl_test`
  ADD CONSTRAINT `tbl_test_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Constraints for table `tbl_test_question`
--
ALTER TABLE `tbl_test_question`
  ADD CONSTRAINT `tbl_test_question_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tbl_test` (`test_id`),
  ADD CONSTRAINT `tbl_test_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `section_questions` (`question_id`);

--
-- Constraints for table `tbl_vocabulary`
--
ALTER TABLE `tbl_vocabulary`
  ADD CONSTRAINT `tbl_vocabulary_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
