-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 03:43 PM
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
(4, 'Test 4', '120 phút', '2024-12-11 18:11:43', '2024-12-11 18:11:43'),
(5, 'Test 1', '120', '2024-12-17 11:05:15', '2024-12-17 11:05:15'),
(6, 'Test 2', '120', '2024-12-17 11:05:31', '2024-12-17 11:05:31'),
(7, 'Test 3', '120', '2024-12-17 11:05:37', '2024-12-17 11:05:37'),
(8, 'Test 5', '120', '2024-12-18 08:02:41', '2024-12-18 08:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `exam_tests`
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
-- Dumping data for table `exam_tests`
--

INSERT INTO `exam_tests` (`id`, `exam_id`, `part1_test_id`, `part2_test_id`, `part3_test_id`, `part4_test_id`, `part5_test_id`, `part6_test_id`, `part7_test_id`, `created_at`, `updated_at`) VALUES
(11, 1, 1, 2, 3, 4, 5, 6, 7, NULL, NULL),
(12, 3, 1, 2, 3, 4, 5, 6, 7, NULL, NULL),
(13, 8, 11, 12, 13, 14, 15, 10, 16, NULL, NULL);

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
-- Table structure for table `grammars_contents`
--

CREATE TABLE `grammars_contents` (
  `content_id` int(11) NOT NULL,
  `grammar_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grammars_contents`
--

INSERT INTO `grammars_contents` (`content_id`, `grammar_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, '1. Danh từ là gì?', 'Danh từ là từ dùng để chỉ người, đồ vật, con vật, khái niệm,hiện tượng,…như các từ “ con trai, con cún, lửa, hạnh phúc,…”', '2024-12-15 06:06:00', '2024-12-15 06:11:50'),
(2, 1, '2. Các loại danh từ', '- Danh từ đếm được dùng để chỉ những đối tượng cụ thể có thể nhìn được, đếm được như người, con vật, đồ vật ,… “man, dog”…\r\n- Danh từ không đếm được dùng để chỉ những thứ trìu tượng không nhìn thấy được mà chỉ cảm nhận được như cảm giác, hiện tượng, cảm xúc,…“fire, happiness, history”', '2024-12-15 06:13:33', '2024-12-15 06:14:54'),
(3, 1, '3. Dấu hiệu nhận biết', 'Danh từ thường kết thúc bằng các đuôi câu “ tion,sion,-ion, ness,ance, ence, ment, -ty”', '2024-12-15 06:15:45', '2024-12-15 06:15:45'),
(4, 3, '1. Tính từ là gì?', 'Tính từ (adjective, viết tắt là adj) là có vai trò giúp bổ trợ cho danh từ hoặc đại từ, nó giúp miêu tả các đặc tính của sự vật, hiện tượng mà danh từ đó đại diện.', '2024-12-15 06:18:51', '2024-12-15 06:18:51'),
(5, 3, '2. Phân loại tính từ', 'Tính từ riêng: Là tên riêng để gọi của của sự vật, hiện tượng \r\n\r\nTính từ miêu tả: Tính từ miêu tả tính chất sự vật \r\n\r\nCác tính từ miêu tả thường được sắp xếp như sau: sự miêu tả tổng quát (bao gồm những tính từ chỉ cá tính và sự xúc cảm) – kích thước – hình dáng – màu sắc – nguồn gốc – chất liệu – mục đích (những từ này là danh động từ được dùng để hình thành danh từ kép: fishing rod (cần câu cá), sleeping bag (túi ngủ)...)\r\n\r\nTính từ sở hữu: dùng để chỉ danh từ đó thuộc về ai \r\n\r\nTính từ số mục: từ chỉ số đếm hoặc số thứ tự\r\n\r\nTính từ chỉ thị: từ đi với danh từ để chỉ cái này, cái kia Đây là loại tính từ duy nhất thay đối theo số của danh từ. This, That thay đổi thành These, Those khi đi trước danh từ số nhiều. This, vàThese được dùng cho các đối tượng, vật và người ở gần trong khi That và Those dùng cho các đối tượng ở xa hơn.\r\n\r\nTính từ liên hệ: từ có hình thức như đại từ liên hệ', '2024-12-15 06:20:56', '2024-12-15 06:20:56'),
(6, 4, '1. Trạng từ là gì?', 'Trạng từ là từ loại được dùng để bổ nghĩa cho động từ, tính từ, một trạng từ khác hay cho cả câu. Tùy trường hợp câu nói mà ngưới ta có thể đặt nó đứng sau hay cuối câu.', '2024-12-15 06:22:51', '2024-12-15 06:22:51'),
(7, 4, '2. Phân loại trạng từ', 'Trạng từ chỉ cách thức (manner)\r\n\r\nDiễn tả cách thức một hành động được thực hiện ra sao? dùng để trả lời các câu hỏi với How?\r\n\r\nTrạng từ chỉ thời gian (Time)\r\n\r\nDiễn tả thời gian hành động được thực hiện, dùng để trả lời với câu hỏi WHEN? (Khi nào?)\r\nCác trạng từ chỉ thời gian thường được đặt ở cuối câu (vị trí thông thường) hoặc đầu câu (vị trí nhấn mạnh)\r\n\r\nTrạng từ chỉ tần suất (Frequency)\r\n\r\nDiễn tả mức độ thường xuyên của một hành động, dùng để trả lời câu hỏi HOW OFTEN? và được đặt sau động từ \"to be\" hoặc trước động  từ chính.Trạng từ chỉ tần suất (Frequency)\r\n\r\nTrạng từ chỉ nơi chốn (Place)\r\n\r\nDiễn tả hành động diễn tả nơi nào, ở đâu hoặc gần xa thế nào, dùng để trả lời cho câu hỏi WHERE?\r\nMột số trạng từ nơi chốn thường xuất hiện nhiều nhất là here, there ,out, away, everywhere, somewhere... above (bên trên), below (bên dưới), along (dọc theo), around (xung quanh), away (đi xa, khỏi, mất), back (đi lại), somewhere (đâu đó), through (xuyên qua).\r\n\r\nTrạng từ chỉ mức độ (Grade)\r\n\r\nTrạng từ chỉ mức độ được sử dụng để diễn tả mức độ, cho biết hành động diễn ra đến mức độ nào, thường các trạng từ này được đứng trước các tính từ hay một trạng từ khác hơn là dùng với động từ:\r\n\r\nrạng từ chỉ số lượng (Quantity)\r\n\r\nTrạng từ này để nhấn mạnh, nhắc tới các sự việc được diễn ra với số lượng/lượt (ít hoặc nhiều, một, hai ... lần...)', '2024-12-15 06:25:32', '2024-12-15 06:25:32'),
(8, 5, '1. Đại từ là gì?', 'Đại từ (Pronouns) trong tiếng Anh là từ dùng để xưng hô, để chỉ vào sự vật hay sự việc, thay thế cho danh từ, động từ và tính từ trong câu, để tránh khỏi lặp những từ ngữ ấy, tránh để câu bị lủng củng khi lặp từ nhiều lần.', '2024-12-15 06:26:26', '2024-12-15 06:26:26'),
(9, 5, '2. Các loại đại từ', 'Đại từ nhân xưng (Personal pronouns)\r\n\r\nĐại từ phản thân (Reflexive pronouns)\r\n\r\nĐại từ chỉ định (Demonstrative pronouns)\r\n\r\nĐại từ sở hữu (Possessive pronoun)\r\n\r\nĐại từ quan hệ (Relative pronouns)\r\n\r\nĐại từ bất định (Indefinite pronouns)\r\n\r\nĐại từ nhấn mạnh (Intensive pronouns)', '2024-12-15 06:26:50', '2024-12-15 06:26:50');

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
(1, 'abc', 'abc@gmail.com', 'abc', '123', 'a,b,c,d', '0123456789', 'Nam', NULL, 0),
(3, 'Lys', 'Lys@gmail.com', 'LYS', '$2y$12$uY5g947Y2sGKW1j4Y6vSle48qoVbNNYaCfINSTrbUAq1XTHldUKjO', NULL, '12345', NULL, '1732451775.jpg', 1),
(4, 'a', 'a@gmail.com', 'a', '$2y$12$YUsjZzQ.jfp.CUS/0D6YoOrXpYZmEqW5zAgs11czTUcJiHrbzoclO', NULL, '1534651231', NULL, NULL, 0),
(5, 'Linh', 'linh@gmail.com', 'LINH', '$2y$12$5xX.cKEVQyJ./NlRidJAzeaqBi1.srCQaBKlsqJRG95nO3jTQYGkq', NULL, '048626556', NULL, NULL, 1);

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
  `file_pdf` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`material_id`, `title`, `description`, `file_pdf`, `created_at`, `updated_at`) VALUES
(1, 'Very Easy', 'Very Easy', 'materials/Y3lvMPvM82ITfkOcf3dRaIXRKcWulnJMyFTJBJjX.pdf', '2024-11-26 04:15:15', '2024-11-26 04:15:15'),
(2, '600 ESSENTIAL WORDS', '600 word', 'materials/Dg52wfojqYxsNgQRnh2R2m7bRpBBuUdm806zwELW.pdf', '2024-11-26 05:14:12', '2024-11-26 05:14:12'),
(3, 'Big Step 3', 'big step 3', 'materials/vrOIGLLg1c4zImt2XI5RPORcLKRhsWqtjvBzg9st.pdf', '2024-11-26 05:19:11', '2024-11-26 05:19:11'),
(4, 'Starter', 'starter', 'materials/1mpLVxg3GjTVQvlCCiwmlTRAoUDDNgP5TL4ycEhr.pdf', '2024-11-26 05:20:37', '2024-11-26 05:20:37'),
(5, 'Đề thi 2024', 'new', 'materials/A897KUc0GSACAVv0tZ44GSrp7XfKfUSVxP4Wjy4N.pdf', '2024-11-26 05:27:01', '2024-11-26 05:27:01'),
(6, 'abc', 'abc', 'materials/jii7NhHTrV09R9dKDc3nnCDdAe83yyGamOWiqhWs.pdf', '2024-11-26 05:28:58', '2024-11-26 05:28:58');

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
(3, 'Phần 1: Mô tả tranh', 'images/f5SKVzt9MlkCRhn7mi3wkbrcP7ORXuDHBekrHIUE.png', 'Nghe 1 lần duy nhất mô tả 4 bức tranh, sau đó chọn 1 đáp án mô tả đúng nhất về bức tranh đó', 'part_1', '2024-11-13 05:20:22', '2024-11-15 03:59:29'),
(4, 'Phần 2: Hỏi - đáp', 'images/LBrNDf6HPdGgwgRQDuv8U80KeSLqlOXYQgHyY4Vf.png', 'Nghe 1 lần duy nhất 3 câu hỏi đáp, sau đó chọn câu hỏi đáp phù hợp nhất', 'part_2', '2024-11-13 05:21:12', '2024-11-15 03:59:38'),
(6, 'Phần 3: Đoạn hội thoại', 'images/ti02alRetgFHrg8BEYUME1cN4BvxoCohz2CpdO4c.png', 'Nghe đối thoại giữa 2 hoặc 3 người, sau đó chọn câu hỏi đáp phù hợp nhất', 'part_3', '2024-11-15 02:56:37', '2024-11-15 03:59:47'),
(7, 'Phần 4: Bài nói ngắn', 'images/wFQe7GxLKqyrHDcqCKdqdZCTB0lWitAtG6nYwJlm.png', 'Nghe 1 lần duy nhất, mỗi bài có 3 câu hỏi, mỗi câu hỏi có 4 lựa chọn, sau đó chọn câu hỏi phù hợp nhất', 'part_4', '2024-11-15 03:53:34', '2024-11-15 03:59:56'),
(8, 'Phần 5: Hoàn thành câu', 'images/xTYZDrN0Tu8uRqQeq94mq2Sv0LzQ9SisMgVVJre1.png', 'Chọn đáp án đúng nhất để hoàn thành câu', 'part_5', '2024-11-15 03:55:41', '2024-11-15 04:00:08'),
(9, 'Phần 6: Hoàn thành đoạn văn', 'images/GBhl57VJlInGpMeIRWyLknY8zp425dsQbC2ESzBB.png', 'Hoàn thành câu', 'part_6', '2024-11-15 03:58:47', '2024-11-15 03:58:47'),
(10, 'Phần 7: Đọc hiểu - Đoạn đơn', 'images/sSIsgsGoTtmew1F3keFmCiccrH074qEaitmFscJx.png', 'Bài đọc gồm 2 - 4 câu hỏi, chọn đáp án đúng nhất cho các câu hỏi', 'part_7', '2024-11-15 04:02:46', '2024-11-15 04:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `section_questions`
--

CREATE TABLE `section_questions` (
  `question_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `question_group_id` int(11) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  `option1` varchar(1024) DEFAULT NULL,
  `option2` varchar(1024) DEFAULT NULL,
  `option3` varchar(1024) DEFAULT NULL,
  `option4` varchar(1024) DEFAULT NULL,
  `correct_option` varchar(1024) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `text` varchar(4000) DEFAULT NULL,
  `script` varchar(2048) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section_questions`
--

INSERT INTO `section_questions` (`question_id`, `section_id`, `question_group_id`, `content`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `image`, `audio`, `text`, `script`, `updated_at`, `created_at`) VALUES
(260, 3, NULL, 'part1 ls1', 'A', 'B', 'C', 'D', 'A', 'questions/images/xrYc8rkZ8n672m6kTruJUK1ZI5qGElyk6smbduWf.jpg', 'questions/audio/HfqNrfCyQmWJwGPfMU4gDSRXF5hK3czt3x4IxfDy.mp3', NULL, '(A) The woman is talking on the phone.(B) The woman is using her cell phone.(C) The woman is typing on the laptop.(D) The woman is writing in her notebook.', '2024-12-15 12:42:40', '2024-12-15 11:54:16'),
(262, 3, NULL, 'part1 ls2', 'A', 'B', 'C', 'D', 'A', 'questions/images/AAGn26NKT06I70uVxsH71xCDuxhSdnzRxp0EOggN.jpg', 'questions/audio/33FUst5ObemPhJSqnDMDQobGGSottEFJGKuhQdfH.mp3', NULL, '(A) The woman is cooking some bacon.(B) The woman is baking a cake.(C) The woman is preparing for dinner.(D) The woman is frying some fish.', '2024-12-15 12:27:19', '2024-12-15 12:27:19'),
(263, 3, NULL, 'part1 ls3', 'A', 'B', 'C', 'D', 'A', 'questions/images/f42DQyb1kNoJS7RPbfLi4iacuRQwqLfHZhU9gy4u.jpg', 'questions/audio/Awdn5DZ0W0kdACamBJzhrNmgU8ok8Qk15i9AxIxB.mp3', NULL, '(A) The man is holding some seafood.(B) The woman is baking a crab.(C) They are scared of the crab.(D) The family is shopping for breakfast.', '2024-12-15 12:28:34', '2024-12-15 12:28:34'),
(264, 3, NULL, 'part1 ls4', 'A', 'B', 'C', 'D', 'B', 'questions/images/q21CmIgOm7PRxNXTYBYbIT5aaOuEQJleS7uXEMwl.jpg', 'questions/audio/a6mc6x4HxSfKTWVF2Dw3jVsH7v2esKjmHY6Sar57.mp3', NULL, '(A) The man is using a screwdriver to screw a nail into the building frame.(B) The man is hammering something into a building frame.(C) The man is making the frame with his hand.(D) The man is wearing protective glasses.', '2024-12-15 12:29:12', '2024-12-15 12:29:12'),
(265, 3, NULL, 'part1 ls5', 'A', 'B', 'C', 'D', 'A', 'questions/images/e2alCVijExLBuy28EF6YfRQR9FuaTF2QlU6wqyYB.jpg', 'questions/audio/vr07BGRLpJMlGJtT9utUzU5ZR6uwXmueAp0EJY3h.mp3', NULL, '(A) There are some tables and chairs outdoors.(B) There are some people sitting at the tables.(C) There are plastic umbrellas on the tables.(D) There are many flowers in the garden.', '2024-12-15 12:31:54', '2024-12-15 12:31:54'),
(266, 3, NULL, 'part1 ls6', 'A', 'B', 'C', 'D', 'D', 'questions/images/xuIWrvxen1yFHGkBLGRvd4I0p0sbaZbotHMivx1v.jpg', 'questions/audio/khajCeZhAmK8p5J5fSZEN8ljYPBTv22fM5OyHzxI.mp3', NULL, '(A) They are looking at each other.(B) The woman is typing on her computer.(C) The man is using the calculator.(D) The man is writing something onto the notepad.', '2024-12-15 12:32:33', '2024-12-15 12:32:33'),
(267, 4, NULL, 'part2 ls1', 'A', 'B', 'C', NULL, 'C', NULL, 'questions/audio/3J4eHrnwKgMSPJRIYcpRpPhyvfHXVhO8vzOBtv3P.mp3', NULL, 'Where was the company picnic held?(A) In April.(B) Refreshments will be provided.(C) At a park next to a lake.', '2024-12-15 12:33:41', '2024-12-15 12:33:41'),
(268, 4, NULL, 'part2 ls2', 'A', 'B', 'C', NULL, 'B', NULL, 'questions/audio/DTsnwIY2ZSdPrfcZwi9gddRMbJOV6WEH4HBvC6Rj.mp3', NULL, 'Who\'s working at the front desk today?(A) That\'s a difficult request.(B) It\'s Katie Miller.(C) Make room on your desk.', '2024-12-15 12:34:24', '2024-12-15 12:34:24'),
(269, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/s3ZT3kMIeOzJFCi8gva3e56YGMuXJkxqoa9o8mI3.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:03', '2024-12-15 12:35:03'),
(270, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/HWVJJz9GgxzNuQiS73XGpqTUYPYZHaIaP8My0901.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:03', '2024-12-15 12:35:03'),
(271, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/hcbVb7AW7fKn8xYsdW4PhApNsHSAOhTbyuLs0ZCN.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:04', '2024-12-15 12:35:04'),
(272, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/ihAPyegFOnYwsrIomf3LEcUjFCVm9QxMilQlCjqT.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:04', '2024-12-15 12:35:04'),
(273, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/Ts6uAAU3fUVsySWyj8k5PQLJKzfRgz6i95p3ZdCZ.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:04', '2024-12-15 12:35:04'),
(274, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/rpmsFW4PxMwoFw6M57AQIFvwn0Yz9VTE03M98Xp7.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:05', '2024-12-15 12:35:05'),
(275, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/3bc9pe63HZEEroVyCtTQY6tWjOo7khaVvI1fcA9Z.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:05', '2024-12-15 12:35:05'),
(276, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/9PIXuxJ3px4uXFk9u3OcKhDNN6MAPzjXLMeIbNcj.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:05', '2024-12-15 12:35:05'),
(277, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/2SdGjnU24y0dNWDIJo7YN8ujHyxAmV0qwf10DUNv.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:06', '2024-12-15 12:35:06'),
(278, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/WRPqhOIYiDJK2FCts1BNhHHx6Lu0rEttUHKztUeD.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:06', '2024-12-15 12:35:06'),
(279, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/OvyIxHV7XjPBODmJsVvXdoEM0XAC34FVsUc35RuJ.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:07', '2024-12-15 12:35:07'),
(280, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/4RGTDfY4qceqWvDpeZ00dw788REhLuQTb0kQeTzU.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:07', '2024-12-15 12:35:07'),
(281, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/cZZanhpohmXZddGWHn3LOpX65i2M6PcWPTaxvhsV.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:07', '2024-12-15 12:35:07'),
(282, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/Zt2OxvCKxFJmCuvYgJqgNQnNMf68yzAHRHgU2MUi.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:08', '2024-12-15 12:35:08'),
(283, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/8JDu4kpb2ZEbdW5igvoohf5UTFGHdD0IVEBtZAaI.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:08', '2024-12-15 12:35:08'),
(284, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/S57u8uvjSMgQGYtF8gijiS7CMGHWqu8fd0HSkF2U.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:08', '2024-12-15 12:35:08'),
(285, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/hdPXqwl1ld3DDajPTPpr0zSoeGCs3LlgPVZlqpbk.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:09', '2024-12-15 12:35:09'),
(286, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/x6OXS643GLlPeBgCRwN92UujZSXx5dkbg1JD87M2.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:09', '2024-12-15 12:35:09'),
(287, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/FyhzMeIY2Ftn9mOkuvMlaEv0fjlSgOPjNXs9yzUN.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:09', '2024-12-15 12:35:09'),
(288, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/0K1OA6DDibeXiotlUv2fqCqEsWBBgqGbdV7XdN2Y.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:10', '2024-12-15 12:35:10'),
(289, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/qoJjblNk3V0w4VzUnuDyiUSL8ysZNcDnSDpDKag7.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:10', '2024-12-15 12:35:10'),
(290, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/u7n0O2lAkACNYATga3mNyj0YQoQRa4085Vn8JkI3.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 12:35:11', '2024-12-15 12:35:11'),
(292, 6, 90, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-15 12:41:11', '2024-12-15 12:41:11'),
(293, 6, 90, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-15 12:41:11', '2024-12-15 12:41:11'),
(294, 6, 90, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-15 12:41:11', '2024-12-15 12:41:11'),
(295, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/uf5oBaqihwTSjWPZyqC5iLEX3WWxoxJqVN2vQdDl.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 13:26:33', '2024-12-15 13:26:33'),
(296, 6, 91, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:08', '2024-12-17 02:32:08'),
(297, 6, 91, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:08', '2024-12-17 02:32:08'),
(298, 6, 91, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:08', '2024-12-17 02:32:08'),
(299, 6, 92, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(300, 6, 92, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(301, 6, 92, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(302, 6, 93, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(303, 6, 93, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(304, 6, 93, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(305, 6, 94, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(306, 6, 94, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(307, 6, 94, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(308, 6, 95, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(309, 6, 95, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(310, 6, 95, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(311, 6, 96, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(312, 6, 96, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(313, 6, 96, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(314, 6, 97, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(315, 6, 97, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(316, 6, 97, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(317, 6, 98, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(318, 6, 98, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(319, 6, 98, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(320, 6, 99, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(321, 6, 99, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(322, 6, 99, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(323, 6, 100, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(324, 6, 100, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(325, 6, 100, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(326, 6, 101, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(327, 6, 101, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(328, 6, 101, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(329, 6, 102, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(330, 6, 102, 'What is the problem?', 'A. The necessary tools are unavailable.', 'B. The office is closed.', 'C. The wall is too weak.', 'D. The phone number was wrong.', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(331, 6, 102, 'What most likely will the man do first tomorrow?', 'A. Order a replacement part.', 'B. Consult an instruction manual.', 'C. Contact the woman.', 'D. Fill out a work order.', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(332, 7, 103, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(333, 7, 103, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(334, 7, 103, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(335, 7, 104, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(336, 7, 104, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(337, 7, 104, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(338, 7, 105, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(339, 7, 105, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(340, 7, 105, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(341, 7, 106, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(342, 7, 106, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(343, 7, 106, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(344, 7, 107, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(345, 7, 107, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(346, 7, 107, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(347, 7, 108, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(348, 7, 108, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(349, 7, 108, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(350, 7, 109, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(351, 7, 109, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(352, 7, 109, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(353, 7, 110, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(354, 7, 110, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(355, 7, 110, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(356, 7, 111, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(357, 7, 111, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(358, 7, 111, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(359, 7, 112, 'What did the listener offer to do?', 'A. Attend a meeting', 'B. Go to New York', 'C. Take care of the speaker\'s child', 'D. Lend a personal item', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:02', '2024-12-17 02:36:02'),
(360, 7, 112, 'What will happen in April?', 'A. An annual conference', 'B. A business merger', 'C. A budget review', 'D. A town meeting', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:02', '2024-12-17 02:36:02'),
(361, 7, 112, 'What will the listener most likely inform the speaker about?', 'A. The time of arrival', 'B. The payment', 'C. An event location', 'D. A weekend schedule', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:36:02', '2024-12-17 02:36:02'),
(362, 8, 113, NULL, 'A. Until', 'B. Because', 'C. Before', 'D. So', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(363, 8, 114, NULL, 'A. Until', 'B. Because', 'C. Before', 'D. So', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(364, 8, 115, NULL, 'A. Until', 'B. Because', 'C. Before', 'D. So', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(365, 8, 116, NULL, 'A. Until', 'B. Because', 'C. Before', 'D. So', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(366, 8, 117, NULL, 'A. Until', 'B. Because', 'C. Before', 'D. So', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:37:22', '2024-12-17 02:37:22'),
(367, 8, 118, NULL, 'A. clearly', 'B. clear', 'C. cleared', 'D. clearing', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:38:06', '2024-12-17 02:38:06'),
(368, 8, 119, NULL, 'A. clearly', 'B. clear', 'C. cleared', 'D. clearing', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:38:07', '2024-12-17 02:38:07'),
(369, 8, 120, NULL, 'A. clearly', 'B. clear', 'C. cleared', 'D. clearing', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:38:07', '2024-12-17 02:38:07'),
(370, 8, 121, NULL, 'A. clearly', 'B. clear', 'C. cleared', 'D. clearing', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:38:08', '2024-12-17 02:38:08'),
(371, 8, 122, NULL, 'A. clearly', 'B. clear', 'C. cleared', 'D. clearing', 'B', NULL, NULL, NULL, 'abc', '2024-12-17 02:38:08', '2024-12-17 02:38:08'),
(372, 8, 123, NULL, 'A. generates', 'B. generated', 'C. generating', 'D. to generate', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:38:52', '2024-12-17 02:38:52'),
(373, 8, 124, NULL, 'A. generates', 'B. generated', 'C. generating', 'D. to generate', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:39:00', '2024-12-17 02:39:00'),
(374, 8, 125, NULL, 'A. generates', 'B. generated', 'C. generating', 'D. to generate', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:39:00', '2024-12-17 02:39:00'),
(375, 8, 126, NULL, 'A. generates', 'B. generated', 'C. generating', 'D. to generate', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:39:01', '2024-12-17 02:39:01'),
(376, 8, 127, NULL, 'A. generates', 'B. generated', 'C. generating', 'D. to generate', 'D', NULL, NULL, NULL, 'abc', '2024-12-17 02:39:01', '2024-12-17 02:39:01'),
(377, 8, 128, NULL, 'A. duration', 'B. response', 'C. treatment', 'D. maintenance', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:40:15', '2024-12-17 02:40:15'),
(378, 8, 129, NULL, 'A. duration', 'B. response', 'C. treatment', 'D. maintenance', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(379, 8, 130, NULL, 'A. duration', 'B. response', 'C. treatment', 'D. maintenance', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(380, 8, 131, NULL, 'A. duration', 'B. response', 'C. treatment', 'D. maintenance', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(381, 8, 132, NULL, 'A. duration', 'B. response', 'C. treatment', 'D. maintenance', 'A', NULL, NULL, NULL, 'abc', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(382, 8, 133, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:40:59', '2024-12-17 02:40:59'),
(383, 8, 134, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:40:59', '2024-12-17 02:40:59'),
(384, 8, 135, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:00', '2024-12-17 02:41:00'),
(385, 8, 136, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:00', '2024-12-17 02:41:00'),
(386, 8, 137, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:00', '2024-12-17 02:41:00'),
(387, 8, 138, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(388, 8, 139, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(389, 8, 140, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(390, 8, 141, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(391, 8, 142, NULL, 'A. routinely', 'B. finally', 'C. rarely', 'D. strongly', 'C', NULL, NULL, NULL, 'abc', '2024-12-17 02:41:02', '2024-12-17 02:41:02'),
(392, 9, 143, 'Điền vào chỗ trống', 'A. is requesting', 'B. has requested', 'C. have to request', 'D. had to request', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:41:07', '2024-12-17 02:46:34'),
(393, 9, 143, 'Điền vào chỗ trống', 'A. Unfortunately', 'B. Therefore', 'C. Regardless', 'D. Finally', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:41:41', '2024-12-17 02:46:34'),
(394, 9, 143, 'Điền vào chỗ trống', 'A. upon', 'B. during', 'C. before', 'D. at', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:41:51', '2024-12-17 02:46:34'),
(395, 9, 143, 'Điền vào chỗ trống', 'A. The move from keys to keyless entry should make the facility more secure.', 'B. We will be looking forward to seeing you sometime next week', 'C. The security office is open 24 hours a day.', 'D. This is for product security.', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:42:38', '2024-12-17 02:46:34'),
(396, 9, 144, 'Điền vào chỗ trống', 'A. is requesting', 'B. has requested', 'C. have to request', 'D. had to request', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:43:37', '2024-12-17 02:46:34'),
(397, 9, 144, 'Điền vào chỗ trống', 'A. Unfortunately', 'B. Therefore', 'C. Regardless', 'D. Finally', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:45:06', '2024-12-17 02:46:34'),
(398, 9, 144, 'Điền vào chỗ trống', 'A. upon', 'B. during', 'C. before', 'D. at', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:45:17', '2024-12-17 02:46:34'),
(399, 9, 144, 'Điền vào chỗ trống', 'A. The move from keys to keyless entry should make the facility more secure.', 'B. We will be looking forward to seeing you sometime next week', 'C. The security office is open 24 hours a day.', 'D. This is for product security.', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:45:30', '2024-12-17 02:46:34'),
(400, 9, 145, 'Điền vào chỗ trống', 'A. is requesting', 'B. has requested', 'C. have to request', 'D. had to request', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:45:48', '2024-12-17 02:46:35'),
(401, 9, 145, 'Điền vào chỗ trống', 'A. Unfortunately', 'B. Therefore', 'C. Regardless', 'D. Finally', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:46:02', '2024-12-17 02:46:35'),
(402, 9, 145, 'Điền vào chỗ trống', 'A. upon', 'B. during', 'C. before', 'D. at', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:47:20', '2024-12-17 02:46:35'),
(403, 9, 145, 'Điền vào chỗ trống', 'A. The move from keys to keyless entry should make the facility more secure.', 'B. We will be looking forward to seeing you sometime next week', 'C. The security office is open 24 hours a day.', 'D. This is for product security.', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:47:33', '2024-12-17 02:46:35'),
(404, 9, 146, 'Điền vào chỗ trống', 'A. is requesting', 'B. has requested', 'C. have to request', 'D. had to request', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:47:57', '2024-12-17 02:46:35'),
(405, 9, 146, 'Điền vào chỗ trống', 'A. Unfortunately', 'B. Therefore', 'C. Regardless', 'D. Finally', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:51:43', '2024-12-17 02:46:35');
INSERT INTO `section_questions` (`question_id`, `section_id`, `question_group_id`, `content`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `image`, `audio`, `text`, `script`, `updated_at`, `created_at`) VALUES
(406, 9, 146, 'Điền vào chỗ trống', 'A. upon', 'B. during', 'C. before', 'D. at', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:51:54', '2024-12-17 02:46:35'),
(407, 9, 146, 'Điền vào chỗ trống', 'A. The move from keys to keyless entry should make the facility more secure.', 'B. We will be looking forward to seeing you sometime next week', 'C. The security office is open 24 hours a day.', 'D. This is for product security.', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-17 11:52:13', '2024-12-17 02:46:35'),
(408, 10, 147, 'What is indicated about TriStar Sports Gear?', 'A. It is a family business.', 'B. It is located next to a school.', 'C. It holds a sale every year.', 'D. It mainly sells weight training equipment.', 'A', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 11:57:07', '2024-12-17 02:52:38'),
(409, 10, 147, 'How can customers receive a discount on athletic shoes?', 'A. By buying more than two pairs', 'B. By visiting on July 1', 'C. By placing an order online', 'D. By presenting a flyer', 'C', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 11:58:06', '2024-12-17 02:52:38'),
(410, 10, 148, 'What is indicated about TriStar Sports Gear?', 'A. It is a family business.', 'B. It is located next to a school.', 'C. It holds a sale every year.', 'D. It mainly sells weight training equipment.', 'A', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 11:58:22', '2024-12-17 02:52:38'),
(411, 10, 148, 'How can customers receive a discount on athletic shoes?', 'A. By buying more than two pairs', 'B. By visiting on July 1', 'C. By placing an order online', 'D. By presenting a flyer', 'C', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 11:58:29', '2024-12-17 02:52:38'),
(412, 10, 149, 'What is indicated about TriStar Sports Gear?', 'A. It is a family business.', 'B. It is located next to a school.', 'C. It holds a sale every year.', 'D. It mainly sells weight training equipment.', 'A', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 11:58:40', '2024-12-17 02:52:38'),
(413, 10, 149, 'How can customers receive a discount on athletic shoes?', 'A. By buying more than two pairs', 'B. By visiting on July 1', 'C. By placing an order online', 'D. By presenting a flyer', 'C', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 11:59:38', '2024-12-17 02:52:38'),
(414, 10, 150, 'What is indicated about TriStar Sports Gear?', 'A. It is a family business.', 'B. It is located next to a school.', 'C. It holds a sale every year.', 'D. It mainly sells weight training equipment.', 'A', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 11:59:55', '2024-12-17 02:52:39'),
(415, 10, 150, 'How can customers receive a discount on athletic shoes?', 'A. By buying more than two pairs', 'B. By visiting on July 1', 'C. By placing an order online', 'D. By presenting a flyer', 'C', NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', 'abc', '2024-12-17 12:00:29', '2024-12-17 02:52:39'),
(462, 10, 162, 'What is indicated about Lichtenberg Air?', 'A. It is asking passengers to keep a baggage limit.', 'B. It is responding to customer complaints.', 'C. It has not increased its baggage fees for a decade.', 'D. It has added new destinations.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 12:58:59', '2024-12-17 12:58:59'),
(463, 10, 162, 'What is suggested about passengers?', 'A. They are allowed to bring electronics.', 'B. They can take one bag onto the plane without any charge.', 'C. They must pay the increased airline ticket price from October 1.', 'D. They can get a 20 percent discount next month.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 12:58:59', '2024-12-17 12:58:59'),
(464, 10, 162, 'According to the notice, what will happen when the price of fuel drops?', 'A. The stock price for Lichtenberg Air will increase.', 'B. Passengers will be offered gift certificates.', 'C. More flight attendants will be employed.', 'D. The extra charge will be waived.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 12:58:59', '2024-12-17 12:58:59'),
(468, 10, 164, 'What is indicated about Lichtenberg Air?', 'A. It is asking passengers to keep a baggage limit.', 'B. It is responding to customer complaints.', 'C. It has not increased its baggage fees for a decade.', 'D. It has added new destinations.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 13:09:45', '2024-12-17 13:09:45'),
(469, 10, 164, 'What is suggested about passengers?', 'A. They are allowed to bring electronics.', 'B. They can take one bag onto the plane without any charge.', 'C. They must pay the increased airline ticket price from October 1.', 'D. They can get a 20 percent discount next month.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 13:09:45', '2024-12-17 13:09:45'),
(470, 10, 164, 'According to the notice, what will happen when the price of fuel drops?', 'A. The stock price for Lichtenberg Air will increase.', 'B. Passengers will be offered gift certificates.', 'C. More flight attendants will be employed.', 'D. The extra charge will be waived.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 13:09:45', '2024-12-17 13:09:45'),
(471, 10, 165, 'What is indicated about Lichtenberg Air?', 'A. It is asking passengers to keep a baggage limit.', 'B. It is responding to customer complaints.', 'C. It has not increased its baggage fees for a decade.', 'D. It has added new destinations.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 13:13:06', '2024-12-17 13:13:06'),
(472, 10, 165, 'What is suggested about passengers?', 'A. They are allowed to bring electronics.', 'B. They can take one bag onto the plane without any charge.', 'C. They must pay the increased airline ticket price from October 1.', 'D. They can get a 20 percent discount next month.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 13:13:06', '2024-12-17 13:13:06'),
(473, 10, 165, 'According to the notice, what will happen when the price of fuel drops?', 'A. The stock price for Lichtenberg Air will increase.', 'B. Passengers will be offered gift certificates.', 'C. More flight attendants will be employed.', 'D. The extra charge will be waived.', 'A', NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', 'abc', '2024-12-17 13:13:06', '2024-12-17 13:13:06'),
(474, 10, 166, 'What can be inferred about Ms. Lynch?', 'A. She lives in Salem, Oregon', 'B. She can speak a second language.', 'C. She is a motivational speaker.', 'D. She is a conference organizer.', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:13', '2024-12-17 13:18:13'),
(475, 10, 166, 'What is the purpose of the conference?', 'A. To attract foreign investment', 'B. To share teaching methods', 'C. To set curriculum standards', 'D. To establish a charitable foundation', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:13', '2024-12-17 13:18:13'),
(476, 10, 166, 'When must speakers return borrowed supplies?', 'A. April 4', 'B. April 10', 'C. July 12', 'D. July 16', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:13', '2024-12-17 13:18:13'),
(477, 10, 166, 'What is Ms. Lynch asked to inform Mr. Klein about?', 'A. When she will arrive', 'B. What supplies she will need', 'C. What room she will use', 'D. Who will accompany her', 'C', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:13', '2024-12-17 13:18:13'),
(478, 10, 167, 'What can be inferred about Ms. Lynch?', 'A. She lives in Salem, Oregon', 'B. She can speak a second language.', 'C. She is a motivational speaker.', 'D. She is a conference organizer.', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(479, 10, 167, 'What is the purpose of the conference?', 'A. To attract foreign investment', 'B. To share teaching methods', 'C. To set curriculum standards', 'D. To establish a charitable foundation', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(480, 10, 167, 'When must speakers return borrowed supplies?', 'A. April 4', 'B. April 10', 'C. July 12', 'D. July 16', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(481, 10, 167, 'What is Ms. Lynch asked to inform Mr. Klein about?', 'A. When she will arrive', 'B. What supplies she will need', 'C. What room she will use', 'D. Who will accompany her', 'C', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(482, 10, 168, 'What can be inferred about Ms. Lynch?', 'A. She lives in Salem, Oregon', 'B. She can speak a second language.', 'C. She is a motivational speaker.', 'D. She is a conference organizer.', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(483, 10, 168, 'What is the purpose of the conference?', 'A. To attract foreign investment', 'B. To share teaching methods', 'C. To set curriculum standards', 'D. To establish a charitable foundation', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(484, 10, 168, 'When must speakers return borrowed supplies?', 'A. April 4', 'B. April 10', 'C. July 12', 'D. July 16', 'A', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(485, 10, 168, 'What is Ms. Lynch asked to inform Mr. Klein about?', 'A. When she will arrive', 'B. What supplies she will need', 'C. What room she will use', 'D. Who will accompany her', 'C', NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', 'abc', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(486, 10, 169, 'Where is most likely true about James and Aaron?', 'A. They are competitors.', 'B. They are related.', 'C. They are married.', 'D. They are friends.', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14');
INSERT INTO `section_questions` (`question_id`, `section_id`, `question_group_id`, `content`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `image`, `audio`, `text`, `script`, `updated_at`, `created_at`) VALUES
(487, 10, 169, 'What is indicated about Aaron?', 'A. He is not very good at his job these days.', 'B. The owner loves him.', 'C. There are problems in the main office.', 'D. He will keep his job after the evaluations come in.', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(488, 10, 169, 'According to the information provided, what is true about James?', 'A. He has done very well at work.', 'B. He needs more sales.', 'C. He wants to work with James.', 'D. He will become a barber.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(489, 10, 169, 'What is the problem with the sales leads James gave to Aaron?', 'A. They are rated too highly.', 'B. They are worth too much money.', 'C. He doesn\'t know the contacts.', 'D. They are in a field he is struggling in.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(490, 10, 169, 'What is the job that Mr. Jones most likely has?', 'A. Human resource agent', 'B. Sales Executive', 'C. Owner', 'D. Associate Secretary', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(491, 10, 170, 'Where is most likely true about James and Aaron?', 'A. They are competitors.', 'B. They are related.', 'C. They are married.', 'D. They are friends.', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(492, 10, 170, 'What is indicated about Aaron?', 'A. He is not very good at his job these days.', 'B. The owner loves him.', 'C. There are problems in the main office.', 'D. He will keep his job after the evaluations come in.', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(493, 10, 170, 'According to the information provided, what is true about James?', 'A. He has done very well at work.', 'B. He needs more sales.', 'C. He wants to work with James.', 'D. He will become a barber.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(494, 10, 170, 'What is the problem with the sales leads James gave to Aaron?', 'A. They are rated too highly.', 'B. They are worth too much money.', 'C. He doesn\'t know the contacts.', 'D. They are in a field he is struggling in.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(495, 10, 170, 'What is the job that Mr. Jones most likely has?', 'A. Human resource agent', 'B. Sales Executive', 'C. Owner', 'D. Associate Secretary', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(496, 10, 171, 'Where is most likely true about James and Aaron?', 'A. They are competitors.', 'B. They are related.', 'C. They are married.', 'D. They are friends.', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(497, 10, 171, 'What is indicated about Aaron?', 'A. He is not very good at his job these days.', 'B. The owner loves him.', 'C. There are problems in the main office.', 'D. He will keep his job after the evaluations come in.', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(498, 10, 171, 'According to the information provided, what is true about James?', 'A. He has done very well at work.', 'B. He needs more sales.', 'C. He wants to work with James.', 'D. He will become a barber.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15');
INSERT INTO `section_questions` (`question_id`, `section_id`, `question_group_id`, `content`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `image`, `audio`, `text`, `script`, `updated_at`, `created_at`) VALUES
(499, 10, 171, 'What is the problem with the sales leads James gave to Aaron?', 'A. They are rated too highly.', 'B. They are worth too much money.', 'C. He doesn\'t know the contacts.', 'D. They are in a field he is struggling in.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(500, 10, 171, 'What is the job that Mr. Jones most likely has?', 'A. Human resource agent', 'B. Sales Executive', 'C. Owner', 'D. Associate Secretary', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(501, 10, 172, 'Where is most likely true about James and Aaron?', 'A. They are competitors.', 'B. They are related.', 'C. They are married.', 'D. They are friends.', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(502, 10, 172, 'What is indicated about Aaron?', 'A. He is not very good at his job these days.', 'B. The owner loves him.', 'C. There are problems in the main office.', 'D. He will keep his job after the evaluations come in.', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(503, 10, 172, 'According to the information provided, what is true about James?', 'A. He has done very well at work.', 'B. He needs more sales.', 'C. He wants to work with James.', 'D. He will become a barber.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(504, 10, 172, 'What is the problem with the sales leads James gave to Aaron?', 'A. They are rated too highly.', 'B. They are worth too much money.', 'C. He doesn\'t know the contacts.', 'D. They are in a field he is struggling in.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(505, 10, 172, 'What is the job that Mr. Jones most likely has?', 'A. Human resource agent', 'B. Sales Executive', 'C. Owner', 'D. Associate Secretary', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(506, 10, 173, 'Where is most likely true about James and Aaron?', 'A. They are competitors.', 'B. They are related.', 'C. They are married.', 'D. They are friends.', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(507, 10, 173, 'What is indicated about Aaron?', 'A. He is not very good at his job these days.', 'B. The owner loves him.', 'C. There are problems in the main office.', 'D. He will keep his job after the evaluations come in.', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(508, 10, 173, 'According to the information provided, what is true about James?', 'A. He has done very well at work.', 'B. He needs more sales.', 'C. He wants to work with James.', 'D. He will become a barber.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(509, 10, 173, 'What is the problem with the sales leads James gave to Aaron?', 'A. They are rated too highly.', 'B. They are worth too much money.', 'C. He doesn\'t know the contacts.', 'D. They are in a field he is struggling in.', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(510, 10, 173, 'What is the job that Mr. Jones most likely has?', 'A. Human resource agent', 'B. Sales Executive', 'C. Owner', 'D. Associate Secretary', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', 'abc', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(511, 3, NULL, 'part1 ls7', 'A', 'B', 'C', 'D', 'C', 'questions/images/Du2foLRzHlcYPYWMNDrLZ0VYpGfafntsJTQZmOIy.jpg', 'questions/audio/L35X0f0ccU4rcGFXPpn6Cfxc6jAxEDQ82OeHTJVk.mp3', NULL, '(A) The woman is talking on the phone.(B) The woman is using her cell phone.(C) The woman is typing on the laptop.(D) The woman is writing in her notebook.', '2024-12-17 13:50:18', '2024-12-17 13:50:18'),
(512, 3, NULL, 'part1 ls7', 'A', 'B', 'C', 'D', 'C', 'questions/images/vsCytsOpC2DAaqB27BAfOagq9OiFC3JN9i791rRT.jpg', 'questions/audio/aN4juduiaXAfkldB6oPaoC9rKTp1oUYQzvIXTOy2.mp3', NULL, '(A) The woman is talking on the phone.(B) The woman is using her cell phone.(C) The woman is typing on the laptop.(D) The woman is writing in her notebook.', '2024-12-17 13:50:19', '2024-12-17 13:50:19'),
(513, 3, NULL, 'part1 ls7', 'A', 'B', 'C', 'D', 'C', 'questions/images/Q8bFoR8iPSTdOXsSd2zXW8PNG2ZdKsEwkcXA0x73.jpg', 'questions/audio/vEc2EwU76MhEqdDl9j8RUZ4NFWXUeMUbo9c7PKSD.mp3', NULL, '(A) The woman is talking on the phone.(B) The woman is using her cell phone.(C) The woman is typing on the laptop.(D) The woman is writing in her notebook.', '2024-12-17 13:50:19', '2024-12-17 13:50:19'),
(514, 3, NULL, 'part1 ls7', 'A', 'B', 'C', 'D', 'C', 'questions/images/wzHvroWNU9XfEGgxRgO504YLtryi1u23AZ5rBOCz.jpg', 'questions/audio/qtJRzQTPO4n2gDtqqJ4IFeQgmwYGSumV8VsJTSKp.mp3', NULL, '(A) The woman is talking on the phone.(B) The woman is using her cell phone.(C) The woman is typing on the laptop.(D) The woman is writing in her notebook.', '2024-12-17 13:50:19', '2024-12-17 13:50:19'),
(515, 3, NULL, 'part1 ls7', 'A', 'B', 'C', 'D', 'C', 'questions/images/dwMPxEaInXXcNWsjiMO9UK1gXruzzPkd3Y70JomE.jpg', 'questions/audio/mHu9eBm6ieIjCNa2i0NeExfV59ffQvxW212zUpXN.mp3', NULL, '(A) The woman is talking on the phone.(B) The woman is using her cell phone.(C) The woman is typing on the laptop.(D) The woman is writing in her notebook.', '2024-12-17 13:50:19', '2024-12-17 13:50:19');
INSERT INTO `section_questions` (`question_id`, `section_id`, `question_group_id`, `content`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `image`, `audio`, `text`, `script`, `updated_at`, `created_at`) VALUES
(516, 9, 174, 'Điền vào chỗ trống', 'A. is requesting', 'B. has requested', 'C. have to request', 'D. had to request', 'A', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-18 06:48:15', '2024-12-18 06:48:15'),
(517, 9, 174, 'Điền vào chỗ trống', 'A. Unfortunately', 'B. Therefore', 'C. Regardless', 'D. Finally', 'B', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-18 06:48:15', '2024-12-18 06:48:15'),
(518, 9, 174, 'Điền vào chỗ trống', 'A. upon', 'B. during', 'C. before', 'D. at', 'C', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-18 06:48:15', '2024-12-18 06:48:15'),
(519, 9, 174, 'Điền vào chỗ trống', 'A. The move from keys to keyless entry should make the facility more secure.', 'B. We will be looking forward to seeing you sometime next week', 'C. The security office is open 24 hours a day.', 'D. This is for product security.', 'D', NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', 'abc', '2024-12-18 06:48:15', '2024-12-18 06:48:15'),
(520, 9, 175, '...', 'A. active', 'B. actived', 'C. actively', 'D. activated', 'A', NULL, NULL, '<p><strong>Music Teacher Needed</strong></p>\r\n\r\n<p>Mike&rsquo;s Music School is seeking a new piano instructor for weekend and evening classes. Mike&rsquo;s Music School has been operating in the Central district since 1992. Because of this, we hope to hire a long-time resident of Central to join our team. Applicants should be well-versed in teaching techniques. If you are interested in the position, we will be holding interviews and auditions this Saturday at 12 noon, at our main studio on Elm Street and Dupont Ave.</p>', 'ahkdhy', '2024-12-18 06:53:23', '2024-12-18 06:53:23'),
(521, 9, 175, '...', 'A. Our company tries to work with outside communities.', 'B. Our commitment to the community is as important as our commitment to our students.', 'C. Our company is unique and uses strange instruments.', 'D. Our company is in a special location, next to the auto service center.', 'A', NULL, NULL, '<p><strong>Music Teacher Needed</strong></p>\r\n\r\n<p>Mike&rsquo;s Music School is seeking a new piano instructor for weekend and evening classes. Mike&rsquo;s Music School has been operating in the Central district since 1992. Because of this, we hope to hire a long-time resident of Central to join our team. Applicants should be well-versed in teaching techniques. If you are interested in the position, we will be holding interviews and auditions this Saturday at 12 noon, at our main studio on Elm Street and Dupont Ave.</p>', 'ahkdhy', '2024-12-18 06:53:23', '2024-12-18 06:53:23'),
(522, 9, 175, '...', 'A. contemporary', 'B. unknown', 'C. strange', 'D. boring', 'C', NULL, NULL, '<p><strong>Music Teacher Needed</strong></p>\r\n\r\n<p>Mike&rsquo;s Music School is seeking a new piano instructor for weekend and evening classes. Mike&rsquo;s Music School has been operating in the Central district since 1992. Because of this, we hope to hire a long-time resident of Central to join our team. Applicants should be well-versed in teaching techniques. If you are interested in the position, we will be holding interviews and auditions this Saturday at 12 noon, at our main studio on Elm Street and Dupont Ave.</p>', 'ahkdhy', '2024-12-18 06:53:23', '2024-12-18 06:53:23'),
(523, 9, 175, '...', 'A. apply', 'B. applied', 'C. applying', 'D. to apply', 'D', NULL, NULL, '<p><strong>Music Teacher Needed</strong></p>\r\n\r\n<p>Mike&rsquo;s Music School is seeking a new piano instructor for weekend and evening classes. Mike&rsquo;s Music School has been operating in the Central district since 1992. Because of this, we hope to hire a long-time resident of Central to join our team. Applicants should be well-versed in teaching techniques. If you are interested in the position, we will be holding interviews and auditions this Saturday at 12 noon, at our main studio on Elm Street and Dupont Ave.</p>', 'ahkdhy', '2024-12-18 06:53:23', '2024-12-18 06:53:23'),
(524, 9, 176, '...', 'A. make', 'B. plan', 'C. conceive', 'D. deliver', 'B', NULL, NULL, '<p><strong>Employee Message Board</strong></p>\r\n\r\n<p><strong>Request for Feedback</strong></p>\r\n\r\n<p><strong>Posted by James Frohm, Human Resource Director</strong></p>\r\n\r\n<p><strong>Hello colleagues,</strong></p>\r\n\r\n<p>The holiday season is fast approaching and we need to plan our office party! There have been several suggestions for locations and themes made to me directly, but I wanted to invite everyone in the office to give me their feedback. All ideas are welcome, but I must remind everyone that our office policies must be respected. Our party can include all forms of secular celebration, but out of respect for everyone, there may be no religious themes. Please respond to me directly by email at jamesfrohm@ccn.net, so I can get started making plans.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>James</strong></p>', 'abc', '2024-12-18 07:05:44', '2024-12-18 07:05:44'),
(525, 9, 176, '...', 'A. comments', 'B. suggestions', 'C. spots', 'D. suggested', 'D', NULL, NULL, '<p><strong>Employee Message Board</strong></p>\r\n\r\n<p><strong>Request for Feedback</strong></p>\r\n\r\n<p><strong>Posted by James Frohm, Human Resource Director</strong></p>\r\n\r\n<p><strong>Hello colleagues,</strong></p>\r\n\r\n<p>The holiday season is fast approaching and we need to plan our office party! There have been several suggestions for locations and themes made to me directly, but I wanted to invite everyone in the office to give me their feedback. All ideas are welcome, but I must remind everyone that our office policies must be respected. Our party can include all forms of secular celebration, but out of respect for everyone, there may be no religious themes. Please respond to me directly by email at jamesfrohm@ccn.net, so I can get started making plans.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>James</strong></p>', 'abc', '2024-12-18 07:05:44', '2024-12-18 07:05:44'),
(526, 9, 176, 'zzz', 'A. is a safe space for all customs and cultures', 'B. stays open late on Tuesday', 'C. needs a new janitor', 'D. will move next week', 'C', NULL, NULL, '<p><strong>Employee Message Board</strong></p>\r\n\r\n<p><strong>Request for Feedback</strong></p>\r\n\r\n<p><strong>Posted by James Frohm, Human Resource Director</strong></p>\r\n\r\n<p><strong>Hello colleagues,</strong></p>\r\n\r\n<p>The holiday season is fast approaching and we need to plan our office party! There have been several suggestions for locations and themes made to me directly, but I wanted to invite everyone in the office to give me their feedback. All ideas are welcome, but I must remind everyone that our office policies must be respected. Our party can include all forms of secular celebration, but out of respect for everyone, there may be no religious themes. Please respond to me directly by email at jamesfrohm@ccn.net, so I can get started making plans.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>James</strong></p>', 'abc', '2024-12-18 07:05:44', '2024-12-18 07:05:44'),
(527, 9, 176, 'aa', 'A. I look forward to your ideas and enthusiasm.', 'B. I\'m look forward to your ideas and enthusiasm.', 'C. I look forward to you\'re undivided attention.', 'D. I hope you reply before its too late.', 'A', NULL, NULL, '<p><strong>Employee Message Board</strong></p>\r\n\r\n<p><strong>Request for Feedback</strong></p>\r\n\r\n<p><strong>Posted by James Frohm, Human Resource Director</strong></p>\r\n\r\n<p><strong>Hello colleagues,</strong></p>\r\n\r\n<p>The holiday season is fast approaching and we need to plan our office party! There have been several suggestions for locations and themes made to me directly, but I wanted to invite everyone in the office to give me their feedback. All ideas are welcome, but I must remind everyone that our office policies must be respected. Our party can include all forms of secular celebration, but out of respect for everyone, there may be no religious themes. Please respond to me directly by email at jamesfrohm@ccn.net, so I can get started making plans.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>James</strong></p>', 'abc', '2024-12-18 07:05:44', '2024-12-18 07:05:44'),
(528, 6, 177, 'What are the speakers mainly discussing?', 'A. A training seminar.', 'B. The installation of a television.', 'C. The date of a presentation.', 'D. A software upgrade.', 'A', NULL, NULL, NULL, 'abc', '2024-12-18 10:03:20', '2024-12-18 10:03:20'),
(529, 6, 177, 'Where is most likely true about James and Aaron?', 'A. They are competitors.', 'B. They are related.', 'C. They are married.', 'D. They are friends.', 'A', NULL, NULL, NULL, 'abc', '2024-12-18 10:03:20', '2024-12-18 10:03:20'),
(530, 6, 177, 'What is indicated about Aaron?', 'A. He is not very good at his job these days.', 'B. The owner loves him.', 'C. There are problems in the main office.', 'D. He will keep his job after the evaluations come in.', 'A', NULL, NULL, NULL, 'abc', '2024-12-18 10:03:20', '2024-12-18 10:03:20');

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
('AdSVvdWHYI3RLsnBJgfCkKtsZFyWyOCWWMj2wZvN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoielVsRXhYRjQ1TTc1SlRncVVBejdQT0JiMHc1TEI2QzVEUU1VNTUxWCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2MDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3FsdGVzdF9xdWVzdGlvbj9zZWN0aW9uX2lkPTYmdGVzdF9pZD0zIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9xbHRvcGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1734532819);

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
  `text` varchar(4000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_question_group`
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
(89, 'questions/audio/hwDL0jPMKgiZtaJz9SimWltl6Ibl4Yzh0RwgQsAd.mp3', NULL, NULL, NULL, NULL, '2024-12-12 21:31:38', '2024-12-12 21:31:38'),
(90, 'questions/audio/BeYCTFcEtluNUM77tn2BFOS6Uew0J5VtoosWATw2.mp3', NULL, NULL, NULL, NULL, '2024-12-15 12:41:11', '2024-12-15 12:41:11'),
(91, 'questions/audio/ndmqq4gkwUVXxtjYgbU2ldnq6Ii2Oy3ekFZ1HBok.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:32:08', '2024-12-17 02:32:08'),
(92, 'questions/audio/14c9DfB6omnRhmXdOakuHJdkg4Q9xpeJHmcryFpJ.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(93, 'questions/audio/Zh5asRAweNmiLsODssKlGzepuZ6VAug1I8CPP3AN.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(94, 'questions/audio/J0bJSHxM0WR6Qyk1AtgytZPPlAwrConRA2mZxwNf.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:32:58', '2024-12-17 02:32:58'),
(95, 'questions/audio/qDoGjRFLXPdXdRcemEl0Z1uBZG05Os6s8hH2oBQ7.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(96, 'questions/audio/cgSGWiartDXOE47tPOmQijDaqr7bSPx2lw0zz4Y7.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:32:59', '2024-12-17 02:32:59'),
(97, 'questions/audio/Qo3eUhihQMluep6ov2MuOgh9z3ZKgGASEm3WF8tU.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(98, 'questions/audio/H193JQmB0AxIpmoiJVAtgaqPBIZI0nZ2dtqoXCp7.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(99, 'questions/audio/FFZhs5efGwYd2wapzUut6IIQ9P4R1JDQXAKEIFC3.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:33:00', '2024-12-17 02:33:00'),
(100, 'questions/audio/a2qixSwXldL6sLxx9aovGfoDAugHMohDXCXtmbVh.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(101, 'questions/audio/Qbl8JxAalrd2vJ2VoXA0a7eL2dZdEvYamIEbXJrL.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(102, 'questions/audio/N3MbMWo736FrSJE2KEJtUp5ZsJOWIBkmIsOPfcnw.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:33:01', '2024-12-17 02:33:01'),
(103, 'questions/audio/P4ctuNleWC53k9914HXVnmb3IJKNVK1Fdrv1zCYF.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(104, 'questions/audio/OMNSaPQT0qbUmGXFlLrpZlWZ5YKJlCUnx91ruQ7N.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(105, 'questions/audio/47KXjWe9BHCjkQlcymvST87uhzUHAit53C6u5tas.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:35:59', '2024-12-17 02:35:59'),
(106, 'questions/audio/ux6Dw4KvWvHlom44bTxRxh1zUZval6WgSHP4ICYO.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(107, 'questions/audio/oLPwEzlhZc7atlSeYgHtiMVa1r5G9gGUFLjfpo46.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(108, 'questions/audio/2qf1D89qEHUg7DAoFaglfli1FSA0jcLX31FjPXM4.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:36:00', '2024-12-17 02:36:00'),
(109, 'questions/audio/GgL69AT56tdrHQu5YytuRKaYpFDDgWolCaRdK5sb.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(110, 'questions/audio/w51j3BV3JifNeESx14N6pwWKjFoOUroqvIWGNxne.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(111, 'questions/audio/NOZ7Jeb6Ohb4XEBNz2ZpjPjlqzBk7Olz2fobtxsV.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:36:01', '2024-12-17 02:36:01'),
(112, 'questions/audio/rf1UOKVAGkhgY2XUmNnC64Q4BYBTBWqmlFMz6YKA.mp3', NULL, NULL, NULL, NULL, '2024-12-17 02:36:02', '2024-12-17 02:36:02'),
(113, NULL, NULL, NULL, NULL, '------- the difference between the two brands is small, most consumers purchase the cheaper one.', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(114, NULL, NULL, NULL, NULL, '------- the difference between the two brands is small, most consumers purchase the cheaper one.', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(115, NULL, NULL, NULL, NULL, '------- the difference between the two brands is small, most consumers purchase the cheaper one.', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(116, NULL, NULL, NULL, NULL, '------- the difference between the two brands is small, most consumers purchase the cheaper one.', '2024-12-17 02:37:21', '2024-12-17 02:37:21'),
(117, NULL, NULL, NULL, NULL, '------- the difference between the two brands is small, most consumers purchase the cheaper one.', '2024-12-17 02:37:22', '2024-12-17 02:37:22'),
(118, NULL, NULL, NULL, NULL, 'Audience members were impressed that the question asked of the candidate was answered -------.', '2024-12-17 02:38:06', '2024-12-17 02:38:06'),
(119, NULL, NULL, NULL, NULL, 'Audience members were impressed that the question asked of the candidate was answered -------.', '2024-12-17 02:38:07', '2024-12-17 02:38:07'),
(120, NULL, NULL, NULL, NULL, 'Audience members were impressed that the question asked of the candidate was answered -------.', '2024-12-17 02:38:07', '2024-12-17 02:38:07'),
(121, NULL, NULL, NULL, NULL, 'Audience members were impressed that the question asked of the candidate was answered -------.', '2024-12-17 02:38:08', '2024-12-17 02:38:08'),
(122, NULL, NULL, NULL, NULL, 'Audience members were impressed that the question asked of the candidate was answered -------.', '2024-12-17 02:38:08', '2024-12-17 02:38:08'),
(123, NULL, NULL, NULL, NULL, 'In an attempt ------- sustainable energy, city officials have had solar panels affixed to some public buildings.', '2024-12-17 02:38:52', '2024-12-17 02:38:52'),
(124, NULL, NULL, NULL, NULL, 'In an attempt ------- sustainable energy, city officials have had solar panels affixed to some public buildings.', '2024-12-17 02:39:00', '2024-12-17 02:39:00'),
(125, NULL, NULL, NULL, NULL, 'In an attempt ------- sustainable energy, city officials have had solar panels affixed to some public buildings.', '2024-12-17 02:39:00', '2024-12-17 02:39:00'),
(126, NULL, NULL, NULL, NULL, 'In an attempt ------- sustainable energy, city officials have had solar panels affixed to some public buildings.', '2024-12-17 02:39:01', '2024-12-17 02:39:01'),
(127, NULL, NULL, NULL, NULL, 'In an attempt ------- sustainable energy, city officials have had solar panels affixed to some public buildings.', '2024-12-17 02:39:01', '2024-12-17 02:39:01'),
(128, NULL, NULL, NULL, NULL, 'The slow ------- of the fire department resulted in severe damage to the building.', '2024-12-17 02:40:15', '2024-12-17 02:40:15'),
(129, NULL, NULL, NULL, NULL, 'The slow ------- of the fire department resulted in severe damage to the building.', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(130, NULL, NULL, NULL, NULL, 'The slow ------- of the fire department resulted in severe damage to the building.', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(131, NULL, NULL, NULL, NULL, 'The slow ------- of the fire department resulted in severe damage to the building.', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(132, NULL, NULL, NULL, NULL, 'The slow ------- of the fire department resulted in severe damage to the building.', '2024-12-17 02:40:16', '2024-12-17 02:40:16'),
(133, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:40:59', '2024-12-17 02:40:59'),
(134, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:40:59', '2024-12-17 02:40:59'),
(135, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:00', '2024-12-17 02:41:00'),
(136, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:00', '2024-12-17 02:41:00'),
(137, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:00', '2024-12-17 02:41:00'),
(138, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(139, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(140, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(141, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:01', '2024-12-17 02:41:01'),
(142, NULL, NULL, NULL, NULL, 'After hours of searching, the source of the water leak was ------- identified by the plumber.', '2024-12-17 02:41:02', '2024-12-17 02:41:02'),
(143, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', '2024-12-17 02:46:34', '2024-12-17 11:17:22'),
(144, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', '2024-12-17 02:46:34', '2024-12-17 11:43:37'),
(145, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', '2024-12-17 02:46:35', '2024-12-17 11:45:48'),
(146, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', '2024-12-17 02:46:35', '2024-12-17 11:47:57'),
(147, NULL, NULL, NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', '2024-12-17 02:52:38', '2024-12-17 11:57:07'),
(148, NULL, NULL, NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', '2024-12-17 02:52:38', '2024-12-17 11:58:22'),
(149, NULL, NULL, NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', '2024-12-17 02:52:38', '2024-12-17 11:58:40'),
(150, NULL, NULL, NULL, NULL, '<p><strong>TriStar Sports Gear</strong><br />\r\n5477 Fairmont Avenue<br />\r\nBemidji, MN 56634<br />\r\n218-555-3412<br />\r\nwww.tristarsportsgear.com</p>\r\n\r\n<p><strong>Summer sale from July 1 to July 14</strong></p>\r\n\r\n<p>The school year has ended and summer has arrived. Stop by TriStar Sports Gear and take advantage of our huge annual summer sale beginning this Friday. Now is the time to get ready for summer fun. We will be selling jerseys from your favorite sports teams for 20% off the original price. Also, if you buy two pairs of athletic shoes, you can get the third pair at half price. There is much more on sale, so please see the sale list on the back page.</p>\r\n\r\n<ul>\r\n	<li>Bring this flyer to our store and you can get a 10% discount on all kinds of balls.</li>\r\n</ul>', '2024-12-17 02:52:39', '2024-12-17 11:59:55'),
(156, NULL, NULL, NULL, NULL, '<p><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/e12919415bd08090d9451c16b89d7a9004a44afa.jpg\" /></p>', '2024-12-17 03:00:33', '2024-12-17 03:00:33'),
(157, NULL, NULL, NULL, NULL, '<p><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/82de6308101a061ff3d54fc80f094ece8ca297f3.jpg\" /><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/1dca031339c4893dfb65216e746b5b4d9209299c.jpg\" /></p>', '2024-12-17 03:13:30', '2024-12-17 03:13:30'),
(158, NULL, NULL, NULL, NULL, '<p><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/82de6308101a061ff3d54fc80f094ece8ca297f3.jpg\" /><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/1dca031339c4893dfb65216e746b5b4d9209299c.jpg\" /></p>', '2024-12-17 03:13:31', '2024-12-17 03:13:31'),
(159, NULL, NULL, NULL, NULL, '<p><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/82de6308101a061ff3d54fc80f094ece8ca297f3.jpg\" /><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/1dca031339c4893dfb65216e746b5b4d9209299c.jpg\" /></p>', '2024-12-17 03:13:31', '2024-12-17 03:13:31'),
(160, NULL, NULL, NULL, NULL, '<p><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/82de6308101a061ff3d54fc80f094ece8ca297f3.jpg\" /><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/1dca031339c4893dfb65216e746b5b4d9209299c.jpg\" /></p>', '2024-12-17 03:13:31', '2024-12-17 03:13:31'),
(161, NULL, NULL, NULL, NULL, '<p><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/82de6308101a061ff3d54fc80f094ece8ca297f3.jpg\" /><img src=\"https://s4-media1.study4.com/media/gg_imgs/test/1dca031339c4893dfb65216e746b5b4d9209299c.jpg\" /></p>', '2024-12-17 03:13:32', '2024-12-17 03:13:32'),
(162, NULL, NULL, NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', '2024-12-17 12:58:59', '2024-12-17 12:58:59'),
(163, NULL, NULL, NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', '2024-12-17 13:05:34', '2024-12-17 13:05:34'),
(164, NULL, NULL, NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', '2024-12-17 13:09:45', '2024-12-17 13:09:45'),
(165, NULL, NULL, NULL, NULL, '<h3><strong>Lichtenberg Air</strong></h3>\r\n\r\n<p><strong>September 24</strong></p>\r\n\r\n<p><strong>To our passengers:</strong></p>\r\n\r\n<p>Beginning October 1, Lichtenberg Air will ask passengers to pay an extra 20 percent in baggage fees. As you know, the reason for this increase is because of the rising fuel costs. We regret that the baggage fees have to be increased.</p>\r\n\r\n<p>However, passengers are still allowed to have one carry-on bag free of charge. We would also like to emphasize that this has been the first increase in baggage fees for Lichtenberg Air in ten years.</p>\r\n\r\n<p>As always, our goal is to provide safe and reliable transportation at a reasonable price. As the price of fuel lowers, we expect to eliminate the fee increase.</p>\r\n\r\n<p>We thank you for choosing Lichtenberg Air.</p>', '2024-12-17 13:13:06', '2024-12-17 13:13:06'),
(166, NULL, NULL, NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', '2024-12-17 13:18:13', '2024-12-17 13:18:13'),
(167, NULL, NULL, NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(168, NULL, NULL, NULL, NULL, '<p><strong>April 4</strong></p>\r\n\r\n<p><strong>Paula Lynch</strong></p>\r\n\r\n<p><strong>344 Culler Boulevard</strong></p>\r\n\r\n<p><strong>Ellie, MN 42195</strong></p>\r\n\r\n<p><strong>Dear Ms. Lynch,</strong></p>\r\n\r\n<p>We are pleased that you have accepted our request to give a presentation at this year&rsquo;s Conference for Second Language Education. As you know, this conference will gather teachers of German, French, Chinese, and many other languages in one place to share classroom techniques and approaches. Aside from attending workshops and seminars, attendees will have ample opportunities to converse and network at a variety of events. This is an opportunity not to be missed.</p>\r\n\r\n<p>This year&rsquo;s conference will be held at the Wilson Convention Center in Salem, Oregon. It will begin on Thursday, July 12, and last through Sunday, July 16. If requested, a laptop and other equipment can be loaned to speakers to be used during the conference. Any borrowed supplies must be returned on the final day of the conference. In addition to your payment for speaking, all speakers are also allowed to attend any other workshops and seminars free of charge.</p>\r\n\r\n<p>Please notify us of your detailed travel itinerary. One of our staff members will arrive in a car at the airport to meet you and give you a ride to the venue. Please call our office at (456) 555-1345 to give this information before April 10.</p>\r\n\r\n<p>We are looking forward to seeing you at the conference.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Dirk Klein</strong></p>\r\n\r\n<p><strong>Conference Organizer</strong></p>', '2024-12-17 13:18:14', '2024-12-17 13:18:14'),
(169, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(170, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', '2024-12-17 13:41:14', '2024-12-17 13:41:14'),
(171, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', '2024-12-17 13:41:15', '2024-12-17 13:41:15');
INSERT INTO `tbl_question_group` (`question_group_id`, `audio`, `image`, `passage`, `script`, `text`, `created_at`, `updated_at`) VALUES
(172, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(173, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 13</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Hello Mr. Alberts,</strong></p>\r\n\r\n<p>I am writing on behalf of my company, Action Services. Our company specializes in creating personalized flower arrangements, gift baskets, and novelty gifts. Recently, we have been reviewing our shipping costs and realized we are paying too much to our current shipping company. We would be interested in offering you the opportunity to take over our account if you could provide us with some competitive rates. I have included a recent invoice of shipping costs with our current carrier, Express Corp. If you feel that you could beat their prices, we would like to try to work with you. Please let me know what you think.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong><br />\r\n&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>From:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentservices.com\" target=\"_blank\">kalberts@emergentservices.com</a></p>\r\n\r\n<p><strong>To:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices.com\" target=\"_blank\">cpierce@actionservices.com</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 14</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Dear Ms. Pierce,</strong></p>\r\n\r\n<p>Thank you for contacting us at Emergent Solutions. I have taken a look at your invoice from your last bill from Express Corp, and I believe that we can beat their prices. I would be happy to send over my account director to talk to you about a delivery package that is perfect for your needs. Since most of the shipping that you do is within the state, we use fuel-efficient vehicles to run our small express courier service with perfect and composed reliability for small items, I believe or express courier service will be perfect. We focus on the future health of both our environment and are able to pass on savings to our customers. As the Accounts Director, I look forward to working with Action Services in cutting costs while achieving real results.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>Ken Alberts</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>To:</strong>&nbsp;Ken Alberts&nbsp;<a href=\"mailto:kalberts@emergentsolutions.com\" target=\"_blank\">kalberts@emergentsolutions.com</a></p>\r\n\r\n<p><strong>From:</strong>&nbsp;Clarissa Pierce&nbsp;<a href=\"mailto:cpierce@actionservices\" target=\"_blank\">cpierce@actionservices</a></p>\r\n\r\n<p><strong>Date:</strong>&nbsp;June 16</p>\r\n\r\n<p><strong>Subject:</strong>&nbsp;Shipping contracts</p>\r\n\r\n<p><strong>Mr. Alberts,</strong></p>\r\n\r\n<p>This sounds amazing! You have no idea how much it means to our company that you are using environmentally responsible transportation. Action Services was originally formed by a collection of Environmental Studies students at City College here. Everything we do is ethically sourced and recyclable. We can&rsquo;t wait to meet with your team.</p>\r\n\r\n<p><strong>Best,</strong></p>\r\n\r\n<p><strong>Clarissa Pierce</strong></p>\r\n\r\n<p><strong>Account Manager, Action Services</strong></p>', '2024-12-17 13:41:15', '2024-12-17 13:41:15'),
(174, NULL, NULL, NULL, NULL, '<p><strong>To:</strong>&nbsp;All Staff<br />\r\n<strong>From:</strong>&nbsp;Michael Davis, Head Technician<br />\r\n<strong>Subject:</strong>&nbsp;Network Upgrade</p>\r\n\r\n<p>We regret to inform the staff that as of next week, Monday the 13th of November to sometime midweek, the employee key card system will not be active. In order to get into and out of the building, you will need to buzz security. In order to unlock, or lock, any door, you will ___(1)__ assistance from the security team.</p>\r\n\r\n<p>The old system was reviewed and many vulnerabilities were discovered. ___(2)___the company has decided to replace the old system. This process should take 3 to four days.</p>\r\n\r\n<p>As part of the process, new key cards will be issued to each member of the staff. Key cards will be available for you to pick up from Wednesday, the 15th of November, in the security office. Please, feel free to stop by any time ___(3)___ the day to collect yours___(4)___.</p>\r\n\r\n<p>We apologize for any inconvenience this may cause.</p>', '2024-12-18 06:48:15', '2024-12-18 06:48:15'),
(175, NULL, NULL, NULL, NULL, '<p><strong>Music Teacher Needed</strong></p>\r\n\r\n<p>Mike&rsquo;s Music School is seeking a new piano instructor for weekend and evening classes. Mike&rsquo;s Music School has been operating in the Central district since 1992. Because of this, we hope to hire a long-time resident of Central to join our team. Applicants should be well-versed in teaching techniques. If you are interested in the position, we will be holding interviews and auditions this Saturday at 12 noon, at our main studio on Elm Street and Dupont Ave.</p>', '2024-12-18 06:53:23', '2024-12-18 06:53:23'),
(176, NULL, NULL, NULL, NULL, '<p><strong>Employee Message Board</strong></p>\r\n\r\n<p><strong>Request for Feedback</strong></p>\r\n\r\n<p><strong>Posted by James Frohm, Human Resource Director</strong></p>\r\n\r\n<p><strong>Hello colleagues,</strong></p>\r\n\r\n<p>The holiday season is fast approaching and we need to plan our office party! There have been several suggestions for locations and themes made to me directly, but I wanted to invite everyone in the office to give me their feedback. All ideas are welcome, but I must remind everyone that our office policies must be respected. Our party can include all forms of secular celebration, but out of respect for everyone, there may be no religious themes. Please respond to me directly by email at jamesfrohm@ccn.net, so I can get started making plans.</p>\r\n\r\n<p><strong>Sincerely,</strong></p>\r\n\r\n<p><strong>James</strong></p>', '2024-12-18 07:05:44', '2024-12-18 07:05:44'),
(177, 'questions/audio/EKiPTsGjnrGcnkPhWKQoZ4pNabaCvB3YflL0VMBm.mp3', NULL, NULL, NULL, NULL, '2024-12-18 10:03:20', '2024-12-18 10:03:20');

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
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_id`, `section_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 3, 'Part 1 Test 1', '2024-11-30 14:02:31', '2024-12-17 13:46:38'),
(2, 4, 'Test 1 p2', '2024-12-08 04:51:47', '2024-12-08 04:51:47'),
(3, 6, 'Test 1 p3', '2024-12-08 06:05:03', '2024-12-08 06:05:03'),
(4, 7, 'Test 1 p4', '2024-12-08 06:29:18', '2024-12-08 06:29:18'),
(5, 8, 'Test 1 p5', '2024-12-08 06:34:34', '2024-12-08 06:34:34'),
(6, 9, 'Test 1 p6', '2024-12-08 06:40:02', '2024-12-08 06:40:02'),
(7, 10, 'test 1 p7', '2024-12-08 06:52:32', '2024-12-08 06:52:32'),
(8, 3, 'Part 1 Test 2', '2024-12-17 03:29:53', '2024-12-17 13:46:17'),
(9, 3, 'Part 1 Test 3', '2024-12-18 03:08:23', '2024-12-18 03:08:23'),
(10, 9, 'Part 6 Test 1', '2024-12-18 04:17:39', '2024-12-18 04:17:39'),
(11, 3, 'Part 1 Test 4', '2024-12-18 07:57:29', '2024-12-18 07:57:29'),
(12, 4, 'Part 2 Test 1', '2024-12-18 07:58:11', '2024-12-18 07:58:19'),
(13, 6, 'Part 3 Test 1', '2024-12-18 07:59:35', '2024-12-18 07:59:35'),
(14, 7, 'Part 4 Test 1', '2024-12-18 08:00:06', '2024-12-18 08:00:06'),
(15, 8, 'Part 5 Test 1', '2024-12-18 08:00:45', '2024-12-18 08:00:45'),
(16, 10, 'Part 7 Test 1', '2024-12-18 08:01:46', '2024-12-18 08:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `test_question`
--

CREATE TABLE `test_question` (
  `test_question_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_question`
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
(266, 7, 256, '2024-12-11 02:43:15', '2024-12-11 02:43:15'),
(267, 1, 260, '2024-12-16 13:17:49', '2024-12-16 13:17:49'),
(268, 1, 262, '2024-12-16 13:17:49', '2024-12-16 13:17:49'),
(269, 1, 263, '2024-12-16 13:17:49', '2024-12-16 13:17:49'),
(270, 1, 264, '2024-12-16 13:17:49', '2024-12-16 13:17:49'),
(271, 1, 265, '2024-12-16 13:17:49', '2024-12-16 13:17:49'),
(272, 1, 266, '2024-12-16 13:17:49', '2024-12-16 13:17:49'),
(273, 2, 267, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(274, 2, 268, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(275, 2, 269, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(276, 2, 270, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(277, 2, 271, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(278, 2, 272, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(279, 2, 273, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(280, 2, 274, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(281, 2, 275, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(282, 2, 276, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(283, 2, 277, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(284, 2, 278, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(285, 2, 279, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(286, 2, 280, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(287, 2, 281, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(288, 2, 282, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(289, 2, 283, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(290, 2, 284, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(291, 2, 285, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(292, 2, 286, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(293, 2, 287, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(294, 2, 288, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(295, 2, 289, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(296, 2, 290, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(297, 2, 295, '2024-12-16 13:19:22', '2024-12-16 13:19:22'),
(298, 1, 260, '2024-12-17 03:27:48', '2024-12-17 03:27:48'),
(299, 1, 262, '2024-12-17 03:27:48', '2024-12-17 03:27:48'),
(300, 1, 263, '2024-12-17 03:27:48', '2024-12-17 03:27:48'),
(301, 1, 264, '2024-12-17 03:27:48', '2024-12-17 03:27:48'),
(302, 1, 265, '2024-12-17 03:27:48', '2024-12-17 03:27:48'),
(303, 1, 266, '2024-12-17 03:27:48', '2024-12-17 03:27:48'),
(304, 1, 260, '2024-12-17 03:29:21', '2024-12-17 03:29:21'),
(305, 1, 262, '2024-12-17 03:29:21', '2024-12-17 03:29:21'),
(306, 1, 263, '2024-12-17 03:29:21', '2024-12-17 03:29:21'),
(307, 1, 264, '2024-12-17 03:29:21', '2024-12-17 03:29:21'),
(308, 1, 265, '2024-12-17 03:29:21', '2024-12-17 03:29:21'),
(309, 1, 266, '2024-12-17 03:29:21', '2024-12-17 03:29:21'),
(310, 8, 260, '2024-12-17 03:30:05', '2024-12-17 03:30:05'),
(311, 8, 262, '2024-12-17 03:30:05', '2024-12-17 03:30:05'),
(312, 8, 263, '2024-12-17 03:30:05', '2024-12-17 03:30:05'),
(313, 8, 264, '2024-12-17 03:30:05', '2024-12-17 03:30:05'),
(314, 8, 265, '2024-12-17 03:30:05', '2024-12-17 03:30:05'),
(315, 8, 266, '2024-12-17 03:30:05', '2024-12-17 03:30:05'),
(316, 1, 260, '2024-12-17 13:43:32', '2024-12-17 13:43:32'),
(317, 1, 262, '2024-12-17 13:43:32', '2024-12-17 13:43:32'),
(318, 1, 263, '2024-12-17 13:43:32', '2024-12-17 13:43:32'),
(319, 1, 264, '2024-12-17 13:43:32', '2024-12-17 13:43:32'),
(320, 1, 265, '2024-12-17 13:43:32', '2024-12-17 13:43:32'),
(321, 1, 266, '2024-12-17 13:43:32', '2024-12-17 13:43:32'),
(322, 9, 263, '2024-12-18 03:08:34', '2024-12-18 03:08:34'),
(323, 9, 264, '2024-12-18 03:08:34', '2024-12-18 03:08:34'),
(324, 9, 266, '2024-12-18 03:08:34', '2024-12-18 03:08:34'),
(325, 9, 511, '2024-12-18 03:08:34', '2024-12-18 03:08:34'),
(326, 9, 512, '2024-12-18 03:08:34', '2024-12-18 03:08:34'),
(327, 9, 515, '2024-12-18 03:08:34', '2024-12-18 03:08:34'),
(328, 10, 392, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(329, 10, 393, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(330, 10, 394, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(331, 10, 395, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(332, 10, 396, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(333, 10, 397, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(334, 10, 398, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(335, 10, 399, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(336, 10, 400, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(337, 10, 401, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(338, 10, 402, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(339, 10, 403, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(340, 10, 404, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(341, 10, 405, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(342, 10, 406, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(343, 10, 407, '2024-12-18 04:18:07', '2024-12-18 04:18:07'),
(344, 11, 262, '2024-12-18 07:57:49', '2024-12-18 07:57:49'),
(345, 11, 264, '2024-12-18 07:57:50', '2024-12-18 07:57:50'),
(346, 11, 266, '2024-12-18 07:57:50', '2024-12-18 07:57:50'),
(347, 11, 511, '2024-12-18 07:57:50', '2024-12-18 07:57:50'),
(348, 11, 512, '2024-12-18 07:57:50', '2024-12-18 07:57:50'),
(349, 11, 514, '2024-12-18 07:57:50', '2024-12-18 07:57:50'),
(350, 12, 267, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(351, 12, 268, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(352, 12, 269, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(353, 12, 270, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(354, 12, 271, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(355, 12, 272, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(356, 12, 273, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(357, 12, 274, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(358, 12, 275, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(359, 12, 276, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(360, 12, 277, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(361, 12, 278, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(362, 12, 279, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(363, 12, 280, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(364, 12, 281, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(365, 12, 282, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(366, 12, 283, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(367, 12, 284, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(368, 12, 285, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(369, 12, 286, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(370, 12, 287, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(371, 12, 288, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(372, 12, 289, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(373, 12, 290, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(374, 12, 295, '2024-12-18 07:59:07', '2024-12-18 07:59:07'),
(375, 13, 292, '2024-12-18 07:59:47', '2024-12-18 07:59:47'),
(376, 13, 293, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(377, 13, 294, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(378, 13, 296, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(379, 13, 297, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(380, 13, 298, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(381, 13, 299, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(382, 13, 300, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(383, 13, 301, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(384, 13, 302, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(385, 13, 303, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(386, 13, 304, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(387, 13, 305, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(388, 13, 306, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(389, 13, 307, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(390, 13, 308, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(391, 13, 309, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(392, 13, 310, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(393, 13, 311, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(394, 13, 312, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(395, 13, 313, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(396, 13, 314, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(397, 13, 315, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(398, 13, 316, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(399, 13, 317, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(400, 13, 318, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(401, 13, 319, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(402, 13, 320, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(403, 13, 321, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(404, 13, 322, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(405, 13, 323, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(406, 13, 324, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(407, 13, 325, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(408, 13, 326, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(409, 13, 327, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(410, 13, 328, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(411, 13, 329, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(412, 13, 330, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(413, 13, 331, '2024-12-18 07:59:48', '2024-12-18 07:59:48'),
(414, 14, 332, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(415, 14, 333, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(416, 14, 334, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(417, 14, 335, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(418, 14, 336, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(419, 14, 337, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(420, 14, 338, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(421, 14, 339, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(422, 14, 340, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(423, 14, 341, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(424, 14, 342, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(425, 14, 343, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(426, 14, 344, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(427, 14, 345, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(428, 14, 346, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(429, 14, 347, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(430, 14, 348, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(431, 14, 349, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(432, 14, 350, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(433, 14, 351, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(434, 14, 352, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(435, 14, 353, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(436, 14, 354, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(437, 14, 355, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(438, 14, 356, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(439, 14, 357, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(440, 14, 358, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(441, 14, 359, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(442, 14, 360, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(443, 14, 361, '2024-12-18 08:00:13', '2024-12-18 08:00:13'),
(444, 15, 362, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(445, 15, 363, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(446, 15, 364, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(447, 15, 365, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(448, 15, 366, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(449, 15, 367, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(450, 15, 368, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(451, 15, 369, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(452, 15, 370, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(453, 15, 371, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(454, 15, 372, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(455, 15, 373, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(456, 15, 374, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(457, 15, 375, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(458, 15, 376, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(459, 15, 377, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(460, 15, 378, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(461, 15, 379, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(462, 15, 380, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(463, 15, 381, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(464, 15, 382, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(465, 15, 383, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(466, 15, 384, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(467, 15, 385, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(468, 15, 386, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(469, 15, 387, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(470, 15, 388, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(471, 15, 389, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(472, 15, 390, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(473, 15, 391, '2024-12-18 08:00:52', '2024-12-18 08:00:52'),
(474, 16, 408, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(475, 16, 409, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(476, 16, 410, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(477, 16, 411, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(478, 16, 412, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(479, 16, 413, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(480, 16, 414, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(481, 16, 415, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(482, 16, 462, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(483, 16, 463, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(484, 16, 464, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(485, 16, 468, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(486, 16, 469, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(487, 16, 470, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(488, 16, 471, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(489, 16, 472, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(490, 16, 473, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(491, 16, 474, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(492, 16, 475, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(493, 16, 476, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(494, 16, 477, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(495, 16, 478, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(496, 16, 479, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(497, 16, 480, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(498, 16, 481, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(499, 16, 482, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(500, 16, 483, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(501, 16, 484, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(502, 16, 485, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(503, 16, 486, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(504, 16, 487, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(505, 16, 488, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(506, 16, 489, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(507, 16, 490, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(508, 16, 491, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(509, 16, 492, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(510, 16, 493, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(511, 16, 494, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(512, 16, 495, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(513, 16, 496, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(514, 16, 497, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(515, 16, 498, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(516, 16, 499, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(517, 16, 500, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(518, 16, 501, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(519, 16, 502, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(520, 16, 503, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(521, 16, 504, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(522, 16, 505, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(523, 16, 506, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(524, 16, 507, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(525, 16, 508, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(526, 16, 509, '2024-12-18 08:02:15', '2024-12-18 08:02:15'),
(527, 16, 510, '2024-12-18 08:02:15', '2024-12-18 08:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topics`
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

-- --------------------------------------------------------

--
-- Table structure for table `vocabularies`
--

CREATE TABLE `vocabularies` (
  `vocabulary_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  `ipa` varchar(255) DEFAULT NULL,
  `image` varchar(1024) DEFAULT NULL,
  `meaning` varchar(1024) DEFAULT NULL,
  `example_sentence` varchar(1024) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vocabularies`
--

INSERT INTO `vocabularies` (`vocabulary_id`, `topic_id`, `word`, `ipa`, `image`, `meaning`, `example_sentence`, `updated_at`, `created_at`) VALUES
(1, 5, 'abide by', '/əˈbaɪd baɪ/', 'images/PJ0ZxOJk4ZGE5dnyLi4mhMRaF4z0lDTY0TMX9gUu.jpg', 'chấp nhận và hành động theo pháp luật, một thỏa thuận', 'The two parties agreed to abide by the judge\'s decision', '2024-12-15 07:12:35', '2024-12-15 07:12:35'),
(2, 5, 'agreement', '/əˈɡriːmənt/', 'images/gQBlyv3yAdgVLZsU1Aa6xCl2pKdw07v7qxBpm6FI.jpg', '(noun) an arrangement, a promise or a contract made with somebody', 'According to the agreement, the caterer will also supply the flowers for the event', '2024-12-15 11:02:38', '2024-12-15 11:02:38'),
(3, 5, 'assurance', '/əˈʃʊrəns/', 'images/ERI9f7ca5elwtSbJWXpPXkaVMx6jaGuEK4MzeV0W.jpg', '(noun) a statement that something will certainly be true or will certainly happen, particularly when there has been doubt about it', 'The sales associate gave his assurance that the missing keyboard would be replaced the next day.', '2024-12-15 13:13:38', '2024-12-15 13:13:38'),
(4, 5, 'cancellation', '/ˌkænsəˈleɪʃn/', 'images/13kAtcZShG8vmITa0Dn2s789sMJWhspTKRLWF0TI.jpg', '(noun) a decision to stop something that has already been arranged from happening; a statement that something will not happen', 'The cancelation of her flight caused her problems for the rest of the week', '2024-12-15 13:14:15', '2024-12-15 13:14:15'),
(5, 5, 'determine', '/dɪˈtɜːrmɪn/', 'images/yX72CKWlRyhhEkGAt5nq7EGohh98i7Kq3DaSJ5LK.jpg', '(verb) to discover the facts about something; to calculate something exactly', 'After reading the contract, I was still unable to detemine if our company was liable for back wages.', '2024-12-15 13:14:44', '2024-12-15 13:14:44'),
(6, 6, 'attract', '/əˈtrækt/', 'images/9oqIvrfqaTUtfq5caC1KipSv83tvZPO5w1b4KzGt.jpg', '(verb) if you are attracted by something, it interests you and makes you want it; if you are attracted by somebody, you like or admire them', 'The display attracted a number of people at the convention', '2024-12-15 13:15:27', '2024-12-15 13:15:27'),
(7, 6, 'compare', '/kəmˈper/', 'images/WR38OUwuSiEVP9fHUPLAKN5GVdFC4Kx5iJL9gzJo.jpg', '(verb) to examine people or things to see how they are similar and how they are different', 'Once the customer compared the two products, her choice was easy.', '2024-12-15 13:16:06', '2024-12-15 13:16:06'),
(8, 6, 'competition', '/ˌkɑːmpəˈtɪʃn/', 'images/SmROMe0P5rG0QcHevxXTS0Rlmt33TrSQto6QrdpY.jpg', '(noun) an event in which people compete with each other to find out who is the best at something', 'In the competition for afternoon dinners, Hector\'s has come out on top', '2024-12-15 13:16:55', '2024-12-15 13:16:55'),
(9, 6, 'consume', '/kənˈsuːm/', 'images/x8u6hg1TFOAGoyaVpRprfvdzXNmRyDVXyLtBKIxt.jpg', '(verb) to use something, especially fuel, energy or time', 'The printer consumes more toner than the downstairs printer', '2024-12-15 13:17:21', '2024-12-15 13:17:21'),
(10, 6, 'convince', '/kənˈvɪns/', 'images/2AAg9vYvvIEiZrN33s6xgmep1W5GBfDVf57hlmNd.jpg', '(verb) to make somebody/yourself believe that something is true', 'He convinced me that he was right.', '2024-12-15 13:17:50', '2024-12-15 13:17:50'),
(11, 7, 'characteristic', '/ˌkærəktəˈrɪstɪk/', 'images/ydFYRwyI93wpCrMx1Kk1h728wZwKkmR17f8faXLW.jpg', '(noun) a typical feature or quality that something/somebody has', 'One characteristic of the store is that it is slow in mailing refund checks.', '2024-12-15 13:19:10', '2024-12-15 13:19:10'),
(12, 7, 'consequence', '/ˈkɑːnsɪkwens/', 'images/lG6fOmpSaUuqqmNoTaoEykcSyNJLazebF9Mt6Jhe.jpg', '(noun) a result of something that has happened, especially an unpleasant result', 'As a consequence of not having seen a dentist for several years, Lydia had several cavities.', '2024-12-15 13:19:38', '2024-12-15 13:19:38'),
(13, 7, 'consider', '/kənˈsɪdər/', 'images/JQDzLQpjwba78xhdVm3mfe8IjJ3O7h1Bzb8vUAAp.jpg', '(verb) to think about something carefully, especially in order to make a decision', 'After considering all the options, Della decided to buy a used car', '2024-12-15 13:20:09', '2024-12-15 13:20:09'),
(14, 7, 'cover', '/ˈkʌvər/', 'images/FPtQpwBF0Mi2wVntdQTFsbH9KNGhJPXZnsrHyyjl.jpg', '(verb) to place something over or in front of something in order to hide, protect or decorate it', 'Will my medical insurance cover this surgery?', '2024-12-15 13:20:40', '2024-12-15 13:20:40'),
(15, 7, 'expiration', '/ˌekspəˈreɪʃn/', 'images/okMjxnXuZFEyRf1GudcHnKGpB535XeKYijvAAJli.jpg', '(noun) an ending of the period of time when an official document can be used, or when an agreement is legally acceptable', 'Have you checked the expriration date on this yogurt?', '2024-12-15 13:21:09', '2024-12-15 13:21:09'),
(16, 8, 'address', '/əˈdres/', 'images/Npcw97wSZJaCdH4IuUWjkQ5aKeInRX5D5BVaMtrh.jpg', '(noun) details of where somebody lives or works and where letters, etc. can be sent', 'Marco\'s business plan addresses the needs of small business owners', '2024-12-15 13:22:14', '2024-12-15 13:22:14'),
(17, 8, 'avoid', '/əˈvɔɪd/', 'images/FeYj356SdHZRDpgaiffadHH3Tp8QWMra9WD1FzKW.jpg', '(verb) to prevent something bad from happening', 'To avoid going out of business, owners should prepare a proper business plan', '2024-12-15 13:22:47', '2024-12-15 13:22:47'),
(18, 8, 'demonstrate', '/ˈdemənstreɪt/', 'images/dLiJk5x0KDlCN3WB5SWwVqYbBXmiy46D1QhGXaGl.jpg', '(verb) to show something clearly by giving proof or evidence', 'The professor demonstrated through a case study that a business plan can impress a lender', '2024-12-15 13:23:24', '2024-12-15 13:23:24'),
(19, 8, 'develop', '/dɪˈveləp/', 'images/UkufgeoeksdPMpz78BBkJoG9BMNPeBUKZeEeDg4H.jpg', '(verb) to gradually grow or become bigger, more advanced, stronger, etc.; to make something do this', 'Lily developed her ideas into a business plan by taking a class at the community college', '2024-12-15 13:23:52', '2024-12-15 13:23:52');

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
-- Indexes for table `exam_tests`
--
ALTER TABLE `exam_tests`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `grammars_contents`
--
ALTER TABLE `grammars_contents`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `grammar_id` (`grammar_id`);

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
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `test_question`
--
ALTER TABLE `test_question`
  ADD PRIMARY KEY (`test_question_id`);

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
-- Indexes for table `vocabularies`
--
ALTER TABLE `vocabularies`
  ADD PRIMARY KEY (`vocabulary_id`),
  ADD KEY `topic_id` (`topic_id`);

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
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exam_tests`
--
ALTER TABLE `exam_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT for table `grammars_contents`
--
ALTER TABLE `grammars_contents`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learners`
--
ALTER TABLE `learners`
  MODIFY `learner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lesson_content`
--
ALTER TABLE `lesson_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;

--
-- AUTO_INCREMENT for table `tbl_exam_question`
--
ALTER TABLE `tbl_exam_question`
  MODIFY `exam_question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_learner_exam`
--
ALTER TABLE `tbl_learner_exam`
  MODIFY `learner_exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_question_group`
--
ALTER TABLE `tbl_question_group`
  MODIFY `question_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `tbl_score`
--
ALTER TABLE `tbl_score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `test_question`
--
ALTER TABLE `test_question`
  MODIFY `test_question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vocabularies`
--
ALTER TABLE `vocabularies`
  MODIFY `vocabulary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grammars_contents`
--
ALTER TABLE `grammars_contents`
  ADD CONSTRAINT `grammars_contents_ibfk_1` FOREIGN KEY (`grammar_id`) REFERENCES `grammars` (`grammar_id`);

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
  ADD CONSTRAINT `tbl_learner_vocabulary_ibfk_2` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabularies` (`vocabulary_id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Constraints for table `vocabularies`
--
ALTER TABLE `vocabularies`
  ADD CONSTRAINT `vocabularies_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
