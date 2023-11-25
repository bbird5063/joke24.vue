-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 25 2023 г., 15:34
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
  `sumCard` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `card`
--

INSERT INTO `card` (`id_card`, `key_card`, `nameCard`, `shortNameCard`, `numberCard`, `shortNumberCard`, `periodCard`, `cvv2`, `sumCard`) VALUES
(1, 'credidCard', 'Картка Універсальна Голд', 'Картка універсальна...', '5363 5421 8796 8945', '5363 **** **** 8945', '06/24', '548', 4452.34),
(2, 'paymentCard', 'Картка для виплат', 'Картка для виплат', '4149 4996 4364 8208', '4149 **** **** 8208', '11/24', '563', 4452.34),
(3, 'helpCard', 'Картка єПідтримка', 'Картка єПідтримка', '4149 4992 4532 1434', '4149 **** **** 1434', '12/25', '453', 2.7);

-- --------------------------------------------------------

--
-- Структура таблицы `date`
--

CREATE TABLE `date` (
  `id_date` int(11) NOT NULL,
  `id_card` int(11) NOT NULL DEFAULT 1,
  `currentDate` date NOT NULL DEFAULT current_timestamp(),
  `strFullDate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_card` int(11) NOT NULL,
  `id_date` int(11) NOT NULL,
  `id_type_payment` int(11) NOT NULL,
  `purpPayment` text NOT NULL,
  `sumPayment` float NOT NULL,
  `timePayment` time NOT NULL,
  `totalSumDay` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `name_type_payment` varchar(20) NOT NULL,
  `ref_icon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id_card`);

--
-- Индексы таблицы `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`id_date`),
  ADD KEY `id_card` (`id_card`),
  ADD KEY `currentDate` (`currentDate`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

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
  MODIFY `id_date` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rate`
--
ALTER TABLE `rate`
  MODIFY `id_rate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `type_payment`
--
ALTER TABLE `type_payment`
  MODIFY `id_type_payment` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
