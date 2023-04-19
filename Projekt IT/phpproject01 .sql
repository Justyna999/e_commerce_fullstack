-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Sty 2022, 16:16
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `phpproject01`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `grand_total` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `status` enum('Pending','Completed','Cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product`
--

CREATE TABLE `product` (
  `item_id` int(11) NOT NULL,
  `item_gender` varchar(255) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_color` varchar(255) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_actual_price` decimal(10,2) DEFAULT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_image2` varchar(255) DEFAULT NULL,
  `item_image3` varchar(255) DEFAULT NULL,
  `item_image4` varchar(255) DEFAULT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_status` enum('0','1') NOT NULL COMMENT '0-active,1-inactive'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `product`
--

INSERT INTO `product` (`item_id`, `item_gender`, `item_type`, `item_name`, `item_color`, `item_price`, `item_actual_price`, `item_image`, `item_image2`, `item_image3`, `item_image4`, `item_quantity`, `item_status`) VALUES
(1, 'woman', 'top', 'Cream jersey body', 'cream', '15.99', NULL, './images/1/4.jpg', './images/2/4.jpg', './images/3/4.jpg', './images/4/4.jpg', 100, '1'),
(3, 'woman', 'jeans ', 'Blue boyfriend jeans', 'blue', '49.99', NULL, './images/1/8.jpg\r\n', './images/2/8.jpg', './images/3/8.jpg', './images/4/8.jpg', 100, '1'),
(5, 'man', 'blouse', 'Orange hoodie', 'orange', '29.99', NULL, './images/1/3.jpg', './images/2/3.jpg', './images/3/3.jpg', './images/4/3.jpg', 100, '1'),
(6, 'man', 'blouse', 'Brown turtleneck', 'brown', '59.99', NULL, './images/1/7.jpg', './images/2/7.jpg', './images/3/7.jpg', './images/4/7.jpg', 100, '1'),
(7, 'boy', 'blouse', 'Blue shirt', 'blue', '19.99', NULL, './images/1/1.jpg', './images/2/1.jpg', './images/3/1.jpg', './images/4/1.jpg', 100, '1'),
(8, 'girl', 'top', 'Violet unicorn T-shirt', 'violet', '9.99', NULL, './images/1/2.jpg', './images/2/2.jpg', './images/3/2.jpg', './images/4/2.jpg', 100, '1'),
(9, 'girl', 'jeans', 'Grey jeans', 'grey', '35.99', NULL, './images/1/6.jpg', './images/2/6.jpg', './images/3/6.jpg', './images/4/6.jpg', 100, '1'),
(10, 'boy', 'pants', 'Khaki pants with neon green stripe', 'khanki', '14.99', '50.59', './images/1/5.jpg', './images/2/5.jpg', './images/3/5.jpg', './images/4/5.jpg', 10, '1'),
(12, 'woman', 'top', 'Jersey body', 'white', '12.99', NULL, './images/1/10.jpg', './images/2/10.jpg', './images/3/10.jpg', './images/4/10.jpg', 100, '1'),
(13, 'woman', 'top', 'Rib knit jersey crop top', 'violet', '12.99', NULL, './images/1/11.jpg', './images/2/11.jpg', './images/3/11.jpg', './images/4/11.jpg', 100, '1'),
(14, 'woman', 'top', 'Rib knit jersey crop top', 'black', '12.99', NULL, './images/1/12.jpg', './images/2/12.jpg', './images/3/12.jpg', './images/4/12.jpg', 100, '1'),
(15, 'woman', 'top', 'Ribbed jersey body', 'violet', '15.99', NULL, './images/1/13.jpg', './images/2/13.jpg', './images/3/13.jpg', './images/4/13.jpg', 100, '1'),
(16, 'woman', 'top', 'Rib knit jersey crop top', 'white', '70.00', NULL, './images/1/14.jpg', './images/2/14.jpg', './images/3/14.jpg', './images/4/14.jpg', 100, '1'),
(17, 'woman', 'top', 'Ribbed jersey body', 'black', '15.99', NULL, './images/1/15.jpg', './images/2/15.jpg', './images/3/15.jpg', './images/4/15.jpg', 100, '1'),
(18, 'woman', 'top', 'Cotton T-shirt', 'green', '15.99', NULL, './images/1/16.jpg', './images/2/16.jpg', './images/3/16.jpg', './images/4/16.jpg', 100, '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `usersName` varchar(128) NOT NULL,
  `usersEmail` varchar(128) NOT NULL,
  `usersUid` varchar(128) NOT NULL,
  `usersPwd` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indeksy dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indeksy dla tabeli `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`item_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT dla tabeli `product`
--
ALTER TABLE `product`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
