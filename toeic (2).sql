-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 02:03 AM
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
(4, 'Test 4', '120 phút', '2024-12-11 18:11:43', '2024-12-11 18:11:43');

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
(12, 3, 1, 2, 3, 4, 5, 6, 7, NULL, NULL);

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
(295, 4, NULL, 'part2 ls3', 'A', 'B', 'C', NULL, 'A', NULL, 'questions/audio/uf5oBaqihwTSjWPZyqC5iLEX3WWxoxJqVN2vQdDl.mp3', NULL, 'Would you like to work together or separately?(A) Actually, I prefer working alone.(B) Let\'s gather the company\'s data.(C) Before next Friday.', '2024-12-15 13:26:33', '2024-12-15 13:26:33');

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
('HJRo1vspNp34rcGH0aIUe9uyh0wtdDRAUlXpJahP', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWlJCV2tTaHVtVVI1ejh4S1NBRExSNjQ5dFI3cjJDTUJHNDlWVDhpQSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL0luZGV4QWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Z1bGx0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1734359191),
('l148Pu6lbREU0cORZmRObLp4hESHnBKvAQh1n4iw', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoib2hBN3J5MGlqQ0o4dFlWZHFkemhjUFE1a1E5bWZnYWRoWGg4bjd0eiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Fsc2VjdGlvbiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcWxzZWN0aW9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1734396740);

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
  `text` varchar(255) DEFAULT NULL,
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
(90, 'questions/audio/BeYCTFcEtluNUM77tn2BFOS6Uew0J5VtoosWATw2.mp3', NULL, NULL, NULL, NULL, '2024-12-15 12:41:11', '2024-12-15 12:41:11');

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
(1, 3, 'Test 1', '2024-11-30 14:02:31', '2024-11-30 14:02:31'),
(2, 4, 'Test 1 p2', '2024-12-08 04:51:47', '2024-12-08 04:51:47'),
(3, 6, 'Test 1 p3', '2024-12-08 06:05:03', '2024-12-08 06:05:03'),
(4, 7, 'Test 1 p4', '2024-12-08 06:29:18', '2024-12-08 06:29:18'),
(5, 8, 'Test 1 p5', '2024-12-08 06:34:34', '2024-12-08 06:34:34'),
(6, 9, 'Test 1 p6', '2024-12-08 06:40:02', '2024-12-08 06:40:02'),
(7, 10, 'test 1 p7', '2024-12-08 06:52:32', '2024-12-08 06:52:32');

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
(297, 2, 295, '2024-12-16 13:19:22', '2024-12-16 13:19:22');

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
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_tests`
--
ALTER TABLE `exam_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

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
  MODIFY `question_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tbl_score`
--
ALTER TABLE `tbl_score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `test_question`
--
ALTER TABLE `test_question`
  MODIFY `test_question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

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
