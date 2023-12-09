-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 08 2023 г., 19:45
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `joke24`
--

-- --------------------------------------------------------

--
-- Структура таблицы `card`
--

CREATE TABLE `card` (
  `id_card` int(11) NOT NULL,
  `key_card` text NOT NULL,
  `nameCard` varchar(40) NOT NULL,
  `shortNameCard` varchar(30) NOT NULL,
  `numberCard` varchar(19) NOT NULL,
  `shortNumberCard` varchar(19) NOT NULL,
  `periodCard` varchar(5) NOT NULL,
  `cvv2` varchar(3) NOT NULL,
  `sumCard` double NOT NULL,
  `limitCard` double NOT NULL DEFAULT 0,
  `debtCard` double NOT NULL DEFAULT 0,
  `minSumCard` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `card`
--

INSERT INTO `card` (`id_card`, `key_card`, `nameCard`, `shortNameCard`, `numberCard`, `shortNumberCard`, `periodCard`, `cvv2`, `sumCard`, `limitCard`, `debtCard`, `minSumCard`) VALUES
(1, 'credidCard', 'Картка Універсальна Голд', 'Картка універсальна...', '5363 5421 8796 8945', '5363 **** **** 8945', '06/24', '548', 12707.01, 14020.02, -1312.98, 100),
(2, 'paymentCard', 'Картка для виплат', 'Картка для виплат', '4149 4996 4364 8208', '4149 **** **** 8208', '11/24', '563', 4452.33, 0, 0, 0),
(3, 'helpCard', 'Картка єПідтримка', 'Картка єПідтримка', '4149 4992 4532 1434', '4149 **** **** 1434', '11/24', '453', 2.7, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `credit`
--

CREATE TABLE `credit` (
  `id_credit` int(11) NOT NULL,
  `NameCredit` text NOT NULL,
  `UserIndex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `credit`
--

INSERT INTO `credit` (`id_credit`, `NameCredit`, `UserIndex`) VALUES
(0, 'расход', 2),
(1, 'ПРИХОД', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `day_payment`
--

CREATE TABLE `day_payment` (
  `id_date_payment` int(11) NOT NULL,
  `date_payment` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `day_payment`
--

INSERT INTO `day_payment` (`id_date_payment`, `date_payment`) VALUES
(21, '2021-12-24'),
(22, '2022-01-01'),
(23, '2022-01-07'),
(24, '2022-01-18'),
(25, '2022-07-27'),
(11, '2023-09-01'),
(27, '2023-09-06'),
(12, '2023-09-08'),
(13, '2023-09-12'),
(14, '2023-09-13'),
(15, '2023-09-14'),
(16, '2023-09-20'),
(17, '2023-10-01'),
(72, '2023-10-04'),
(18, '2023-10-06'),
(73, '2023-10-09'),
(19, '2023-10-12'),
(20, '2023-10-13'),
(80, '2023-10-15'),
(81, '2023-11-01'),
(74, '2023-11-04'),
(75, '2023-11-06'),
(76, '2023-11-09'),
(82, '2023-11-12'),
(77, '2023-11-13'),
(83, '2023-11-15'),
(84, '2023-12-01'),
(78, '2023-12-03'),
(79, '2023-12-05'),
(26, '2023-12-07');

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_date_payment` int(11) NOT NULL,
  `id_card` int(11) NOT NULL DEFAULT 1,
  `id_type_payment` int(11) DEFAULT NULL,
  `time_payment` time NOT NULL,
  `purpPayment` text NOT NULL,
  `sumPayment` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id_payment`, `id_date_payment`, `id_card`, `id_type_payment`, `time_payment`, `purpPayment`, `sumPayment`) VALUES
(1, 11, 1, 3, '00:00:00', 'Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 259.14 UAH	\n', -259.14),
(2, 12, 1, 2, '13:29:00', 'Зі своєї картки 41**08', 350.96),
(3, 12, 1, 2, '13:43:00', 'Зі своєї картки 41**08', 3210),
(4, 13, 1, 1, '03:42:00', 'Комісія за обслуговування (членський внесок) за 08.2023', -20),
(5, 14, 1, 5, '04:38:00', 'Oplata komunal\'nykh posluh', -1044.1),
(6, 15, 1, 5, '12:29:00', 'TOB «ГК «Нафтогаз України» (Київ)', -40.39),
(7, 16, 1, 4, '12:16:00', '+380686803471	\r\n', -57.57),
(8, 17, 1, 3, '00:00:00', 'Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 179.41 UAH', -179.41),
(9, 18, 1, 2, '02:43:00', 'Зі своєї картки 41**08\r\n', 243.97),
(10, 19, 1, 1, '04:07:00', 'Комісія за обслуговування (членський внесок) за 09.2023', -20),
(11, 20, 1, 2, '20:36:00', 'Зі своєї картки 41**08', 1947),
(12, 21, 3, 2, '03:47:00', 'Виплата за програмою эПідтримка', 1000),
(13, 22, 3, 7, '15:09:00', 'Knizhnij intern', -541.1),
(14, 23, 3, 7, '12:53:00', 'Valliza-book FL', -296.01),
(15, 24, 3, 7, '05:16:00', 'WFP.YAKABOO.UA, DNIPRO', -152),
(16, 25, 3, 9, '08:44:00', 'На свою картку', -10.05),
(17, 79, 2, 9, '14:51:00', 'Зі своєї картки', -107.43),
(18, 79, 2, 3, '14:18:00', 'Платіж в 1 клік', -100),
(19, 78, 2, 2, '13:43:00', 'Виплати Соціального фонду, субсидія', 1189.56),
(20, 77, 2, 9, '13:34:00', 'На свою картку 53**45', -1674),
(21, 77, 2, 9, '13:33:00', 'Куян Оксана Теодозіївна', -440),
(22, 77, 2, 5, '12:06:00', 'Oplata komunalnykh posluh', -1246.62),
(23, 76, 2, 2, '12:10:00', 'Пенсія', 2760),
(24, 75, 2, 9, '20:43:00', 'На свою картку 53**45', -146.26),
(25, 75, 2, 9, '20:41:00', 'Зі своєї картки', -108.59),
(26, 74, 2, 2, '13:14:00', 'Виплати Соціального фонду, субсидія', 855.17),
(27, 20, 2, 9, '20:36:00', 'На свою картку 53**45', -1947),
(28, 20, 2, 5, '20:35:00', 'Карбівничий Олександр Іванович, ФОП', -75),
(29, 20, 2, 5, '20:35:00', 'Oplata komunalnykh posluh', -879.51),
(30, 73, 2, 2, '11:28:00', 'Пенсія', 2760),
(31, 18, 2, 9, '02:43:00', 'На свою картку 53**45', -243.97),
(32, 18, 2, 9, '02:41:00', 'Зі своєї картки', -113.99),
(33, 72, 2, 2, '17:30:00', 'Виплати Соціального фонду, субсидія', 498.5),
(34, 12, 2, 9, '13:43:00', 'На свою картку 53**45', -3210),
(35, 12, 2, 9, '13:29:00', 'На свою картку 53**45', -350.96),
(36, 12, 2, 9, '13:24:00', 'Зі своєї картки', -121.26),
(37, 27, 2, 2, '18:38:00', 'Виплати Соціального фонду, субсидія', 414.47),
(38, 27, 2, 2, '18:34:00', 'Виплати Соціального фонду, субсидія', 498.5),
(39, 80, 1, 4, '11:47:00', '+380686803471', -37.37),
(40, 81, 1, 3, '00:00:00', 'Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано', -130.42),
(41, 75, 1, 8, '20:43:00', 'Зі своєї картки 41**08	', 146.26),
(42, 82, 1, 1, '02:26:00', 'Комісія за обслуговування (членський внесок) за 10.2023', -20),
(43, 77, 1, 8, '13:34:00', 'Зі своєї картки 41**08', 1674),
(44, 83, 1, 4, '00:43:00', '+380972433748	', -57.57),
(45, 84, 1, 3, '00:00:00', 'Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 68.23 UAH', -68.23),
(46, 79, 1, 3, '14:18:00', 'Платіж в 1 клік', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `rate`
--

CREATE TABLE `rate` (
  `id_rate` int(11) NOT NULL,
  `buyRate` float NOT NULL,
  `sellRate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rate`
--

INSERT INTO `rate` (`id_rate`, `buyRate`, `sellRate`) VALUES
(1, 36.67, 37.99);

-- --------------------------------------------------------

--
-- Структура таблицы `type_payment`
--

CREATE TABLE `type_payment` (
  `id_type_payment` int(11) NOT NULL,
  `name_type_payment` varchar(40) NOT NULL,
  `order_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_payment`
--

INSERT INTO `type_payment` (`id_type_payment`, `name_type_payment`, `order_by`) VALUES
(1, 'Інше', 0),
(2, 'Зарахування', 1),
(3, 'Кредити', -1),
(4, 'Пополнення мобіль...', -4),
(5, 'Платежі', -2),
(6, 'Ресторани та бари', -6),
(7, 'Розваги', -5),
(8, 'Перекази', 2),
(9, 'Перекази', -3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id_card`);

--
-- Индексы таблицы `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id_credit`),
  ADD KEY `UserIndex` (`UserIndex`);

--
-- Индексы таблицы `day_payment`
--
ALTER TABLE `day_payment`
  ADD PRIMARY KEY (`id_date_payment`),
  ADD UNIQUE KEY `date_payment` (`date_payment`),
  ADD KEY `currentDate` (`date_payment`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_date_payment` (`id_date_payment`),
  ADD KEY `timePayment` (`time_payment`),
  ADD KEY `id_date_payment_2` (`id_date_payment`);

--
-- Индексы таблицы `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id_rate`);

--
-- Индексы таблицы `type_payment`
--
ALTER TABLE `type_payment`
  ADD PRIMARY KEY (`id_type_payment`),
  ADD KEY `order_by` (`order_by`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `card`
--
ALTER TABLE `card`
  MODIFY `id_card` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `day_payment`
--
ALTER TABLE `day_payment`
  MODIFY `id_date_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `rate`
--
ALTER TABLE `rate`
  MODIFY `id_rate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `type_payment`
--
ALTER TABLE `type_payment`
  MODIFY `id_type_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
