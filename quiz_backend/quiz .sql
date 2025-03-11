-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 06:49 AM
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
-- Database: `quiz`
--

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
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'C', '1738764564_C.jpeg', 'welcome to c', '2025-02-05 08:39:24', '2025-02-05 08:39:24'),
(2, 'C++', '1738764625_cpp.jpeg', 'welcome to c++', '2025-02-05 08:40:25', '2025-02-05 08:40:25'),
(3, 'HTML/CSS', '1738764685_htmlcss.jpg', 'welcome to html/css', '2025-02-05 08:41:25', '2025-02-05 08:41:25'),
(4, 'Jquery', '1738764715_jquery.png', 'welcome to Jquery', '2025-02-05 08:41:55', '2025-02-05 08:41:55'),
(5, 'Javascript', '1738764743_javascript.jpg', 'welcome to Javascript', '2025-02-05 08:42:23', '2025-02-05 08:42:23'),
(6, 'PHP', '1738764818_php.png', 'welcome to PHP', '2025-02-05 08:43:38', '2025-02-05 08:43:38'),
(7, 'React Js', '1740482050_react.png', 'Wecome To React', '2025-02-25 05:44:10', '2025-02-25 05:44:10');

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
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_04_095224_create_courses_table', 1),
(5, '2025_02_04_095422_create_questions_table', 1),
(6, '2025_02_04_095646_create_quizzes_table', 1),
(7, '2025_02_04_095950_create_quiz_res_table', 1),
(8, '2025_02_04_100312_create_registrations_table', 1),
(9, '2025_02_04_105459_create_personal_access_tokens_table', 2),
(10, '2025_02_05_140238_create_courses_table', 2),
(11, '2025_02_06_071202_create_questions_table', 3);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Questions` varchar(255) NOT NULL,
  `Course_id` varchar(255) NOT NULL,
  `Answer` text NOT NULL,
  `Correct_Answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `Questions`, `Course_id`, `Answer`, `Correct_Answer`, `created_at`, `updated_at`) VALUES
(1, 'Which of the following is the correct syntax to print \'Hello World\' in C?', '1', '[\"printf(\'Hello World\');\",\"cout << \'Hello World\';\",\"System.out.println(\'Hello World\');\",\"print(\'Hello World\');\"]', 'printf(\'Hello World\');', '2025-02-07 02:15:06', '2025-02-07 02:15:06'),
(2, 'Which data type is used to store a single character in C?', '1', '[\"int\",\"char\",\"string\",\"float\"]', 'char', '2025-02-07 02:15:47', '2025-02-07 02:15:47'),
(3, 'Which operator is used for the logical AND operation in C?', '1', '[\"&&\",\"||\",\"!\",\"&\"]', '&&', '2025-02-07 02:15:59', '2025-02-07 02:15:59'),
(4, 'Which of the following is used to take input from the user in C?', '1', '[\"print()\",\"scanf()\",\"cin>>\",\"input()\"]', 'scanf()', '2025-02-07 02:16:11', '2025-02-07 02:16:11'),
(5, 'What is the size of an `int` in C (assuming a 32-bit system)?', '1', '[\"2 bytes\",\"4 bytes\",\"8 bytes\",\"16 bytes\"]', '4 bytes', '2025-02-07 02:17:18', '2025-02-07 02:17:18'),
(6, 'Which of the following is a loop construct in C?', '1', '[\"if\",\"switch\",\"for\",\"break\"]', 'for', '2025-02-07 02:17:36', '2025-02-07 02:17:36'),
(7, 'Which of the following is used to define a constant in C?', '1', '[\"#define\",\"const\",\"static\",\"final\"]', '#define', '2025-02-07 02:17:54', '2025-02-07 02:17:54'),
(8, 'What is the return type of the `main()` function in C?', '1', '[\"void\",\"int\",\"char\",\"float\"]', 'int', '2025-02-07 02:18:14', '2025-02-07 02:18:14'),
(9, 'Which keyword is used to declare a pointer in C?', '1', '[\"ptr\",\"*\",\"&\",\"->\"]', '*', '2025-02-07 02:18:30', '2025-02-07 02:18:30'),
(10, 'Which header file is used for input and output operations in C?', '1', '[\"stdio.h\",\"stdlib.h\",\"conio.h\",\"math.h\"]', 'stdio.h', '2025-02-07 02:19:19', '2025-02-07 02:19:19'),
(11, 'Which of the following is used to output text in C++?', '2', '[\"printf()\",\"cout <<\",\"print()\",\"echo\"]', 'cout <<', '2025-02-07 02:21:44', '2025-02-07 02:21:44'),
(12, 'Which of the following is not a C++ data type?', '2', '[\"int\",\"float\",\"boolean\",\"string\"]', 'boolean', '2025-02-07 02:22:10', '2025-02-07 02:22:10'),
(13, 'Which keyword is used to define a class in C++?', '2', '[\"class\",\"struct\",\"define\",\"namespace\"]', 'class', '2025-02-07 02:22:20', '2025-02-07 02:22:20'),
(14, 'Which of the following is the correct way to declare a pointer in C++?', '2', '[\"int ptr;\",\"int *ptr;\",\"pointer<int> ptr;\",\"ptr<int>;\"]', 'int *ptr;', '2025-02-07 02:22:30', '2025-02-07 02:22:30'),
(15, 'Which operator is used to access a member of an object through a pointer?', '2', '[\".\",\"->\",\":\",\"::\"]', '->', '2025-02-07 02:22:43', '2025-02-07 02:22:43'),
(16, 'What is the default access specifier for members of a class in C++?', '2', '[\"public\",\"private\",\"protected\",\"none\"]', 'private', '2025-02-07 02:22:57', '2025-02-07 02:22:57'),
(17, 'Which of the following is used for dynamic memory allocation in C++?', '2', '[\"malloc()\",\"calloc()\",\"new\",\"alloc()\"]', 'new', '2025-02-07 02:23:06', '2025-02-07 02:23:06'),
(18, 'Which of the following is used to delete dynamically allocated memory?', '2', '[\"remove\",\"delete\",\"free\",\"clear\"]', 'delete', '2025-02-07 02:23:16', '2025-02-07 02:23:16'),
(19, 'Which of the following is not a valid C++ loop construct?', '2', '[\"for\",\"while\",\"do-while\",\"foreach\"]', 'foreach', '2025-02-07 02:23:26', '2025-02-07 02:23:26'),
(20, 'Which C++ feature allows multiple functions to have the same name with different parameters?', '2', '[\"Function Overloading\",\"Function Overriding\",\"Function Cloning\",\"Function Inheritance\"]', 'Function Overloading', '2025-02-07 02:23:38', '2025-02-07 02:23:38'),
(21, 'What does HTML stand for?', '3', '[\"Hyper Text Markup Language\",\"Hyperlinks and Text Markup Language\",\"Home Tool Markup Language\",\"Hyper Transfer Markup Language\"]', 'Hyper Text Markup Language', '2025-02-07 02:32:49', '2025-02-07 02:32:49'),
(22, 'Which HTML tag is used to create a hyperlink?', '3', '[\"<link>\",\"<a>\",\"<href>\",\"<hyperlink>\"]', '<a>', '2025-02-07 02:33:24', '2025-02-07 02:33:24'),
(23, 'Which property is used in CSS to change the background color?', '3', '[\"color\",\"background-color\",\"bgcolor\",\"background\"]', 'background-color', '2025-02-07 02:34:34', '2025-02-07 02:34:34'),
(24, 'What is the correct way to comment out something in HTML?', '3', '[\"<!-- This is a comment -->\",\"\\/\\/ This is a comment\",\"\\/* This is a comment *\\/\",\"** This is a comment **\"]', '<!-- This is a comment -->', '2025-02-07 02:34:47', '2025-02-07 02:34:47'),
(25, 'Which CSS property controls the text size?', '3', '[\"text-size\",\"font-style\",\"text-style\",\"font-size\"]', 'font-size', '2025-02-07 02:35:07', '2025-02-07 02:35:07'),
(26, 'Which HTML tag is used to insert an image?', '3', '[\"<img>\",\"<image>\",\"<picture>\",\"<src>\"]', '<img>', '2025-02-07 02:35:27', '2025-02-07 02:35:27'),
(27, 'Which CSS property is used to make text bold?', '3', '[\"text-bold\",\"bold\",\"font-weight\",\"font-bold\"]', 'font-weight', '2025-02-07 02:35:39', '2025-02-07 02:35:39'),
(28, 'What is the default alignment of text in an HTML paragraph?', '3', '[\"Left\",\"Center\",\"Right\",\"Justify\"]', 'Left', '2025-02-07 02:35:56', '2025-02-07 02:35:56'),
(29, 'Which tag is used to create a table in HTML?', '3', '[\"<table>\",\"<tab>\",\"<tr>\",\"<td>\"]', '<table>', '2025-02-07 02:36:08', '2025-02-07 02:36:08'),
(30, 'Which CSS property is used to create space between elements?', '3', '[\"padding\",\"margin\",\"spacing\",\"border\"]', 'margin', '2025-02-07 02:36:33', '2025-02-07 02:36:33'),
(31, 'Which symbol is used for jQuery?', '4', '[\"&\",\"$\",\"@\",\"#\"]', '$', '2025-02-07 02:38:16', '2025-02-07 02:38:16'),
(32, 'Which method is used to hide an element in jQuery?', '4', '[\"hide()\",\"invisible()\",\"remove()\",\"none()\"]', 'hide()', '2025-02-07 02:38:27', '2025-02-07 02:38:27'),
(33, 'Which method is used to get the value of an input field in jQuery?', '4', '[\"text()\",\"val()\",\"getValue()\",\"input()\"]', 'val()', '2025-02-07 02:38:38', '2025-02-07 02:38:38'),
(34, 'Which jQuery method is used to change the HTML content of an element?', '4', '[\"text()\",\"val()\",\"html()\",\"changeHTML()\"]', 'html()', '2025-02-07 02:40:02', '2025-02-07 02:40:02'),
(35, 'Which jQuery method is used to add a CSS class to an element?', '4', '[\"addClass()\",\"setClass()\",\"cssClass()\",\"applyClass()\"]', 'addClass()', '2025-02-07 02:40:29', '2025-02-07 02:40:29'),
(36, 'Which function is used to run code when the document is fully loaded?', '4', '[\"$(document).ready()\",\"window.onload()\",\"$(window).load()\",\"document.onload()\"]', '$(document).ready()', '2025-02-07 02:40:49', '2025-02-07 02:40:49'),
(37, 'Which method is used to remove an element from the DOM in jQuery?', '4', '[\"remove()\",\"delete()\",\"detach()\",\"erase()\"]', 'remove()', '2025-02-07 02:41:01', '2025-02-07 02:41:01'),
(38, 'Which jQuery method is used to perform an asynchronous HTTP request?', '4', '[\"ajax()\",\"httpRequest()\",\"fetch()\",\"load()\"]', 'ajax()', '2025-02-07 02:41:13', '2025-02-07 02:41:13'),
(39, 'Which jQuery method is used to slide an element up?', '4', '[\"slideUp()\",\"slideDown()\",\"slideToggle()\",\"fadeOut()\"]', 'slideUp()', '2025-02-07 02:41:26', '2025-02-07 02:41:26'),
(40, 'Which method is used to attach an event handler in jQuery?', '4', '[\"on()\",\"click()\",\"bind()\",\"attach()\"]', 'on()', '2025-02-07 02:41:39', '2025-02-07 02:41:39'),
(41, 'Which keyword is used to declare a variable in JavaScript?', '5', '[\"var\",\"int\",\"string\",\"declare\"]', 'var', '2025-02-07 02:43:15', '2025-02-07 02:43:15'),
(42, 'Which symbol is used for single-line comments in JavaScript?', '5', '[\"\\/\\/\",\"\\/*\",\"#\",\"--\"]', '//', '2025-02-07 02:43:27', '2025-02-07 02:43:27'),
(43, 'How do you create a function in JavaScript?', '5', '[\"function myFunction()\",\"def myFunction()\",\"create myFunction()\",\"func myFunction()\"]', 'function myFunction()', '2025-02-07 02:43:41', '2025-02-07 02:43:41'),
(44, 'Which of the following is used to check strict equality in JavaScript?', '5', '[\"==\",\"===\",\"!=\",\"<>\"]', '===', '2025-02-07 02:43:55', '2025-02-07 02:43:55'),
(45, 'Which built-in method is used to convert a string to an integer in JavaScript?', '5', '[\"parseInt()\",\"toInteger()\",\"Number()\",\"convertToInt()\"]', 'parseInt()', '2025-02-07 02:44:09', '2025-02-07 02:44:09'),
(46, 'Which function is used to print something in the browser console?', '5', '[\"console.log()\",\"print()\",\"echo()\",\"log.console()\"]', 'console.log()', '2025-02-07 02:44:24', '2025-02-07 02:44:24'),
(47, 'Which operator is used to concatenate strings in JavaScript?', '5', '[\"+\",\"&\",\"%\",\"*\"]', '+', '2025-02-07 02:44:38', '2025-02-07 02:44:38'),
(48, 'What will be the output of `typeof([])` in JavaScript?', '5', '[\"array\",\"object\",\"list\",\"undefined\"]', 'object', '2025-02-07 02:44:53', '2025-02-07 02:44:53'),
(49, 'Which method is used to remove the last element from an array?', '5', '[\"pop()\",\"shift()\",\"splice()\",\"remove()\"]', 'pop()', '2025-02-07 02:45:06', '2025-02-07 02:45:06'),
(50, 'Which JavaScript framework is used for building user interfaces?', '5', '[\"React\",\"Laravel\",\"Django\",\"Flask\"]', 'React', '2025-02-07 02:45:17', '2025-02-07 02:45:17'),
(51, 'What does PHP stand for?', '6', '[\"Personal Home Page\",\"Preprocessor Hypertext\",\"PHP: Hypertext Preprocessor\",\"Programming Hypertext Processor\"]', 'PHP: Hypertext Preprocessor', '2025-02-07 02:48:48', '2025-02-07 02:48:48'),
(52, 'Which symbol is used to denote a variable in PHP?', '6', '[\"&\",\"$\",\"#\",\"@\"]', '$', '2025-02-07 02:49:03', '2025-02-07 02:49:03'),
(53, 'Which function is used to output text in PHP?', '6', '[\"print()\",\"echo\",\"printf()\",\"display()\"]', 'echo', '2025-02-07 02:49:13', '2025-02-07 02:49:13'),
(54, 'Which of the following is a PHP superglobal variable?', '6', '[\"$_SESSION\",\"$GLOBALS\",\"$_POST\",\"All of the above\"]', 'All of the above', '2025-02-07 02:49:24', '2025-02-07 02:49:24'),
(55, 'Which of the following is the correct way to start a PHP script?', '6', '[\"<?php\",\"<php>\",\"<?\",\"<?script>\"]', '<?php', '2025-02-07 02:49:37', '2025-02-07 02:49:37'),
(56, 'Which function is used to connect to a MySQL database in PHP?', '6', '[\"connect_mysql()\",\"mysqli_connect()\",\"db_connect()\",\"mysql_connect()\"]', 'mysqli_connect()', '2025-02-07 02:49:47', '2025-02-07 02:49:47'),
(57, 'Which of the following function is used to get the length of a string in PHP?', '6', '[\"strlen()\",\"length()\",\"strlength()\",\"size()\"]', 'strlen()', '2025-02-07 02:50:00', '2025-02-07 02:50:00'),
(58, 'Which PHP function is used to include a file in another file?', '6', '[\"require()\",\"include()\",\"import()\",\"Both require() and include()\"]', 'Both require() and include()', '2025-02-07 02:50:16', '2025-02-07 02:50:16'),
(59, 'Which of the following is used to check if a variable is set in PHP?', '6', '[\"isset()\",\"isnull()\",\"exists()\",\"defined()\"]', 'isset()', '2025-02-07 02:50:28', '2025-02-07 02:50:28'),
(60, 'What will `count([1,2,3])` return in PHP?', '6', '[\"1\",\"2\",\"3\",\"4\"]', '3', '2025-02-07 02:50:42', '2025-02-07 02:50:42'),
(61, 'What is React.js?', '7', '[\"A JavaScript library for building user interfaces\",\"A programming language\",\"A database management system\",\"A web browser\"]', 'A JavaScript library for building user interfaces', '2025-02-25 08:51:18', '2025-02-25 08:51:18'),
(62, 'Which company developed React.js?', '7', '[\"Google\",\"Facebook (Meta)\",\"Microsoft\",\"Apple\"]', 'Facebook (Meta)', '2025-02-25 08:52:06', '2025-02-25 08:52:06'),
(63, 'What is the purpose of JSX in React?', '7', '[\"To define CSS styles\",\"To extend JavaScript syntax for UI development\",\"To manage databases\",\"To handle HTTP requests\"]', 'To extend JavaScript syntax for UI development', '2025-02-25 08:52:22', '2025-02-25 08:52:22'),
(64, 'What is a state in React?', '7', '[\"A permanent storage\",\"A built-in database\",\"A way to manage component data\",\"A type of function\"]', 'A way to manage component data', '2025-02-25 08:52:36', '2025-02-25 08:52:36'),
(65, 'What hook is used to manage state in a functional component?', '7', '[\"useState\",\"useEffect\",\"useReducer\",\"useContext\"]', 'useState', '2025-02-25 08:52:52', '2025-02-25 08:52:52'),
(66, 'Which React hook is used for side effects?', '7', '[\"useEffect\",\"useState\",\"useMemo\",\"useRef\"]', 'useEffect', '2025-02-25 08:53:07', '2025-02-25 08:53:07'),
(67, 'How can you pass data from a parent component to a child component?', '7', '[\"Using Redux\",\"Using props\",\"Using state\",\"Using local storage\"]', 'Using props', '2025-02-25 08:53:23', '2025-02-25 08:53:23'),
(68, 'What is the virtual DOM in React?', '7', '[\"A lightweight copy of the actual DOM\",\"A database for React components\",\"A type of component\",\"A JavaScript function\"]', 'A lightweight copy of the actual DOM', '2025-02-25 08:53:59', '2025-02-25 08:53:59'),
(69, 'Which method is used to render a React component in the DOM?', '7', '[\"ReactDOM.render()\",\"React.create()\",\"React.mount()\",\"React.inject()\"]', 'ReactDOM.render()', '2025-02-25 08:54:16', '2025-02-25 08:54:16'),
(70, 'What is the purpose of useRef in React?', '7', '[\"To access DOM elements directly\",\"To manage state\",\"To create reducers\",\"To fetch API data\"]', 'To access DOM elements directly', '2025-02-25 08:54:33', '2025-02-25 08:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Course_id` varchar(255) NOT NULL,
  `req_id` varchar(255) NOT NULL,
  `Selected_ans` varchar(255) NOT NULL,
  `Question_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `Course_id`, `req_id`, `Selected_ans`, `Question_id`, `created_at`, `updated_at`) VALUES
(1, '5', '5', 'var', '41', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(2, '5', '5', '//', '42', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(3, '5', '5', 'function myFunction()', '43', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(4, '5', '5', '===', '44', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(5, '5', '5', 'toInteger()', '45', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(6, '5', '5', 'print()', '46', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(7, '5', '5', '%', '47', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(8, '5', '5', 'array', '48', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(9, '5', '5', 'shift()', '49', '2025-02-25 01:39:28', '2025-02-25 01:39:28'),
(10, '6', '4', '$_SESSION', '54', '2025-02-25 01:41:01', '2025-02-25 01:41:01'),
(11, '6', '4', '<?php', '55', '2025-02-25 01:41:01', '2025-02-25 01:41:01'),
(12, '6', '4', 'connect_mysql()', '56', '2025-02-25 01:41:01', '2025-02-25 01:41:01'),
(13, '6', '4', 'length()', '57', '2025-02-25 01:41:01', '2025-02-25 01:41:01'),
(14, '6', '4', 'include()', '58', '2025-02-25 01:41:01', '2025-02-25 01:41:01'),
(15, '6', '4', 'exists()', '59', '2025-02-25 01:41:01', '2025-02-25 01:41:01'),
(16, '6', '4', '4', '60', '2025-02-25 01:41:01', '2025-02-25 01:41:01'),
(17, '2', '4', 'cout <<', '11', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(18, '2', '4', 'boolean', '12', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(19, '2', '4', 'class', '13', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(20, '2', '4', 'int ptr;', '14', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(21, '2', '4', '->', '15', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(22, '2', '4', 'private', '16', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(23, '2', '4', 'calloc()', '17', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(24, '2', '4', 'Function Overloading', '20', '2025-02-25 01:43:00', '2025-02-25 01:43:00'),
(25, '7', '5', 'A JavaScript library for building user interfaces', '61', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(26, '7', '5', 'Facebook (Meta)', '62', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(27, '7', '5', 'To extend JavaScript syntax for UI development', '63', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(28, '7', '5', 'A way to manage component data', '64', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(29, '7', '5', 'useState', '65', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(30, '7', '5', 'useEffect', '66', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(31, '7', '5', 'Using Redux', '67', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(32, '7', '5', 'A lightweight copy of the actual DOM', '68', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(33, '7', '5', 'ReactDOM.render()', '69', '2025-02-25 08:56:47', '2025-02-25 08:56:47'),
(34, '7', '5', 'To create reducers', '70', '2025-02-25 08:56:47', '2025-02-25 08:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_res`
--

CREATE TABLE `quiz_res` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Quiz_id` varchar(255) NOT NULL,
  `req_id` varchar(255) NOT NULL,
  `Score` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `name`, `email`, `password`, `image`, `address`, `contact`, `created_at`, `updated_at`) VALUES
(1, 'abc', 'abc@gmail.com', 'abc@123', '1738762338_python.jpg', 'solapur', '0987654321', '2025-02-05 08:02:18', '2025-02-05 08:02:18'),
(2, 'love', 'love@gmail.com', 'love@123', '1738997367_jacket2.jpg', 'Solapurqwe', '9874563210', '2025-02-08 01:19:27', '2025-02-22 00:13:27'),
(3, 'Premsai', 'prem@gmail.com', 'premsai@123', '1738997436_jacket2.jpg', 'Solapur', '9881569494', '2025-02-08 01:20:36', '2025-02-08 01:20:36'),
(4, 'Tukaram', 'achugatla@gmail.com', 'Achugatla@12345', '1738997762_tshirt2.jpg', 'solapur', '9881569492', '2025-02-08 01:26:02', '2025-02-08 01:26:02'),
(5, 'Ranii', 'rani@gmail.com', 'rani@123', '1739434697_testimonial-1.jpg', 'Solapur', '9881569494', '2025-02-13 02:48:17', '2025-02-24 05:04:39'),
(6, 'Tukaram', 'tukaramachugatla@gmail.com', 'Achugatla@123', '1739878657_testimonial-3.jpg', 'Solapur', '9885546124', '2025-02-18 06:07:37', '2025-02-18 06:07:37'),
(7, 'xyzdfg', 'xuz@gmail.com', 'xyz@123', '1740461845_jacket1.jpg', 'testing', '9845874587', '2025-02-24 05:51:07', '2025-02-25 00:07:25'),
(8, 'efg', 'efg@gmail.com', 'efg@123', '1740397791_blog.jpg', 'Solapur', '9874563215', '2025-02-24 06:19:51', '2025-02-24 06:19:51'),
(9, 'rishika', 'rishikaupadhye@gmail.com', 'rishika22', '1740464121_testimonial-4.jpg', 'solapur', '9881569495', '2025-02-25 00:42:07', '2025-02-25 00:45:21');

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
('AVAIrnDh6dGucwXZOTMx1YEQYoD2E9UkQX7ABUNp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXczbW9PNTN2RVhyTHdHdEFFRGpoZGZCUGRGVUYwRzRFWkN4T1czUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739425774),
('dqxFAkaycFbATe2dqM1q5QFJa28TjFZZdSSwP0dW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3N5Y21ranozTGRHZmxyMlhxMTN0R0FzOHAwdDVXY0d5VEN4b29zdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739253518),
('Fg777y0PTnhTkNeL0hNgKztkOxbLUcmvABqFqBsP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEhCQXZhZ0JIQXpnc0NQWDZlTnBGWGlKMkFFWUhxN0JqNVB0b29vaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739877708),
('Gw6oABznBwE1YScmu1NByYK8Z37bWpkluhLdrjS1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnB0RFNuTDI4UGVVaVVncGhKOHF4eUJhTmFBY0h0c3FNT0RPMjYwbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740202859),
('GWAdggO6vZ3qlkGxJ3baIZm8p0kk8K9mCQMh0aew', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczZYZ1Z6T2pER0ttVFpoSllKWXpQYkl6eWR3d1RXcTFYV0FURWpaUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738920363),
('jMFn6elr1c9OIToQZGFRDzaubewREAcpgpXFaIgq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVhqVnRGYm5XSFdEdUtQdXpQUFRHMVpIWTcyUHdtQXZKdlBXTFVqOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738995320),
('juCiAc82qzOPYL28q6uDQMCitjnKx7NERvtXtinS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic21QWjNBUnhXUU1YOUd6SVN4aXpONkdTR3VvMVZ3SVRCUWlLb1hSUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740483233),
('KR5gWzsmmHx9JgWqxbgcVHEmaJNqpKnncdcGXdYe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRm9kTERGTWxmWE4zbUhkcjV0dHp0eEhPOGVqSW9VT3pCN3ZOMDZWMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740492892),
('lpAraoXYpZ4f3aCDleFRIkbI0P3zUY3AtEzGOvwt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWExCYnhzeG1SU0M0ekxRZ1Vva3ROdDB0b2JreTlsUzBVNUtTUGV3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739433327),
('YZXakbksDQRx2uPuRVp1vEWmPzHrnmT19hr94BN5', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2JQdndNT0pzM0JFbGJjN1RlbjBpdWh5U0dxUDJKS3VGTGNQNDJ0eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739441048);

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
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_res`
--
ALTER TABLE `quiz_res`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `quiz_res`
--
ALTER TABLE `quiz_res`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
