-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.0
-- Время создания: Ноя 28 2024 г., 17:56
-- Версия сервера: 8.0.35
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab10_metro`
--

-- --------------------------------------------------------

--
-- Структура таблицы `lines`
--

CREATE TABLE `lines` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `lines`
--

INSERT INTO `lines` (`id`, `name`, `color`) VALUES
(1, 'Saltivska liniia', 'Blue'),
(2, 'Oleksiivska liniia', 'Green'),
(3, 'Kholodnohorsko-Zavodska liniia', 'Red');

-- --------------------------------------------------------

--
-- Структура таблицы `line_stations`
--

CREATE TABLE `line_stations` (
  `id` bigint UNSIGNED NOT NULL,
  `line_id` bigint UNSIGNED NOT NULL,
  `station_id` bigint UNSIGNED NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `line_stations`
--

INSERT INTO `line_stations` (`id`, `line_id`, `station_id`, `position`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 1, 6, 6),
(7, 1, 7, 7),
(8, 1, 8, 8),
(9, 2, 9, 1),
(10, 2, 10, 2),
(11, 2, 11, 3),
(12, 2, 12, 4),
(13, 2, 13, 5),
(14, 2, 14, 6),
(15, 2, 7, 7),
(16, 2, 15, 8),
(17, 2, 16, 9),
(18, 3, 17, 1),
(19, 3, 18, 2),
(20, 3, 19, 3),
(21, 3, 20, 4),
(22, 3, 6, 5),
(23, 3, 21, 6),
(24, 3, 22, 7),
(25, 3, 23, 8),
(26, 3, 24, 9),
(27, 3, 25, 10),
(28, 3, 26, 11),
(29, 3, 27, 12),
(30, 3, 28, 13),
(31, 3, 29, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `stations`
--

CREATE TABLE `stations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `stations`
--

INSERT INTO `stations` (`id`, `name`, `is_active`) VALUES
(1, 'Heroiv Pratsi', 1),
(2, 'Studentska', 1),
(3, 'Pavlova', 1),
(4, 'Barabashova', 1),
(5, 'Kyivska', 1),
(6, 'Pushkinska', 1),
(7, 'Universytet', 1),
(8, 'Istorychnyi muzei', 1),
(9, 'Peremoha', 1),
(10, 'Oleksiivska', 1),
(11, '23 Serpnia', 1),
(12, 'Botanichnyi sad', 1),
(13, 'Naukova', 1),
(14, 'Derzhprom', 1),
(15, 'Arhitektora Beketova', 1),
(16, 'Zahistnikiv Ukrainy', 1),
(17, 'Kholodna hora', 1),
(18, 'Pivdennyi vokzal', 1),
(19, 'Tsentralnyi rynok', 1),
(20, 'Maidan Konstytutsii', 1),
(21, 'Prospekt Gagarina', 1),
(22, 'Metrobudivelnikiv', 1),
(23, 'Malysheva', 1),
(24, 'Turboatom', 1),
(25, 'Palaz Sporty', 1),
(26, 'Armiyska', 1),
(27, 'Imeni O.S. Maselskoho', 1),
(28, 'Traktorniy zavod', 1),
(29, 'Industrialna', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `from_station_id` bigint UNSIGNED NOT NULL,
  `to_station_id` bigint UNSIGNED NOT NULL,
  `is_bidirectional` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `transfers`
--

INSERT INTO `transfers` (`id`, `from_station_id`, `to_station_id`, `is_bidirectional`) VALUES
(1, 8, 20, 1),
(2, 22, 25, 1),
(3, 7, 14, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lines`
--
ALTER TABLE `lines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `line_stations`
--
ALTER TABLE `line_stations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_line_stations_line` (`line_id`),
  ADD KEY `fk_line_stations_station` (`station_id`);

--
-- Индексы таблицы `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_transfers_from_station` (`from_station_id`),
  ADD KEY `fk_transfers_to_station` (`to_station_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lines`
--
ALTER TABLE `lines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `line_stations`
--
ALTER TABLE `line_stations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `stations`
--
ALTER TABLE `stations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `line_stations`
--
ALTER TABLE `line_stations`
  ADD CONSTRAINT `fk_line_stations_line` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_line_stations_station` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `fk_transfers_from_station` FOREIGN KEY (`from_station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transfers_to_station` FOREIGN KEY (`to_station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
