-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 01 2023 г., 04:07
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
(3, 'helpCard', 'Картка єПідтримка', 'Картка єПідтримка', '4149 4992 4532 1434', '4149 **** **** 1434', '12/25', '453', 2.7, 0, 0, 0);

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
-- Структура таблицы `date`
--

CREATE TABLE `date` (
  `id_date` int(11) NOT NULL,
  `id_card` int(11) DEFAULT NULL,
  `currentDate` date NOT NULL DEFAULT current_timestamp(),
  `strFullDate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `date`
--

INSERT INTO `date` (`id_date`, `id_card`, `currentDate`, `strFullDate`) VALUES
(11, 1, '2023-09-01', 'П\'ятниця, 01 вересня 2023'),
(12, 1, '2023-09-08', 'П\'ятниця, 08 вересня 2023'),
(13, 1, '2023-09-12', 'Вівторок, 12 вересня 2023'),
(14, 1, '2023-09-13', 'Середа, 13 вересня 2023'),
(15, 1, '2023-09-14', 'Четвер, 14 вересня 2023'),
(16, 1, '2023-09-20', 'Середа, 20 вересня 2023'),
(17, 1, '2023-10-01', 'Неділя, 01 жовтня 2023'),
(18, 1, '2023-10-06', 'П\'ятниця, 06 жовтня 2023'),
(19, 1, '2023-10-12', 'Четвер, 12 жовтня 2023'),
(20, 1, '2023-10-13', 'П\'ятниця, 13 жовтня 2023');

-- --------------------------------------------------------

--
-- Структура таблицы `date_card`
--

CREATE TABLE `date_card` (
  `id_date_card` int(11) NOT NULL,
  `id_card` int(11) NOT NULL,
  `id_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `date_card`
--

INSERT INTO `date_card` (`id_date_card`, `id_card`, `id_date`) VALUES
(1, 1, 11),
(2, 1, 12),
(3, 1, 13),
(4, 1, 14),
(5, 1, 15),
(6, 1, 16),
(7, 1, 17),
(8, 1, 18),
(9, 1, 19),
(10, 1, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_credit` int(11) DEFAULT NULL,
  `id_type_payment` int(11) DEFAULT NULL,
  `id_date_card` int(11) NOT NULL,
  `timePayment` time NOT NULL,
  `purpPayment` text NOT NULL,
  `sumPayment` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id_payment`, `id_credit`, `id_type_payment`, `id_date_card`, `timePayment`, `purpPayment`, `sumPayment`) VALUES
(1, 0, 0, 1, '00:00:00', 'Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 259.14 UAH	\n', -259.14),
(2, 1, 0, 2, '13:29:00', 'Зі своєї картки 41**08', 350.96),
(3, 1, 0, 2, '13:43:00', 'Зі своєї картки 41**08', 3),
(4, 0, 0, 3, '03:42:00', 'Комісія за обслуговування (членський внесок) за 08.2023', -20),
(5, 0, 0, 4, '04:38:00', 'Oplata komunal\'nykh posluh', -1),
(6, 0, 0, 5, '12:29:00', 'TOB «ГК «Нафтогаз України» (Київ)', -40.39),
(7, 0, 0, 6, '12:16:00', 'Поповнення мобільного +380686803471	\r\n', -57.57),
(8, 0, 0, 7, '00:00:00', 'Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 179.41 UAH', -179.41),
(9, 1, 0, 8, '02:43:00', 'Зі своєї картки 41**08\r\n', 243.97),
(10, 0, 0, 9, '04:07:00', 'Комісія за обслуговування (членський внесок) за 09.2023', -20),
(11, 1, 0, 10, '20:36:00', 'Зі своєї картки 41**08', 1);

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
  `ref_icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_payment`
--

INSERT INTO `type_payment` (`id_type_payment`, `name_type_payment`, `ref_icon`) VALUES
(1, 'Інше', ''),
(2, 'Перекази', ''),
(3, 'Кредити', ''),
(4, 'Пополнення мобільного', ''),
(5, 'Платежі', ''),
(6, 'Ресторани та бари', ''),
(7, 'Розваги', '');

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
-- Индексы таблицы `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`id_date`),
  ADD KEY `id_card` (`id_card`),
  ADD KEY `currentDate` (`currentDate`);

--
-- Индексы таблицы `date_card`
--
ALTER TABLE `date_card`
  ADD PRIMARY KEY (`id_date_card`),
  ADD KEY `id_card` (`id_card`),
  ADD KEY `id_date` (`id_date`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_credit` (`id_credit`),
  ADD KEY `id_credit_2` (`id_credit`),
  ADD KEY `id_date` (`id_date_card`);

--
-- Индексы таблицы `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id_rate`);

--
-- Индексы таблицы `type_payment`
--
ALTER TABLE `type_payment`
  ADD PRIMARY KEY (`id_type_payment`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `card`
--
ALTER TABLE `card`
  MODIFY `id_card` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `date`
--
ALTER TABLE `date`
  MODIFY `id_date` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `date_card`
--
ALTER TABLE `date_card`
  MODIFY `id_date_card` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `rate`
--
ALTER TABLE `rate`
  MODIFY `id_rate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `type_payment`
--
ALTER TABLE `type_payment`
  MODIFY `id_type_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
