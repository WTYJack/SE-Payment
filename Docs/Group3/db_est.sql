-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 06 月 11 日 18:03
-- 服务器版本: 5.5.25
-- PHP 版本: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `payment`
--

--
-- 转存表中的数据 `airplane_ticket`
--

INSERT INTO `airplane_ticket` (`id`, `name`, `seller_id`, `bought_count`, `score`, `score_count`, `image_uri`, `stock`, `description`, `price`, `departue_date_time`, `arrival_date_time`, `departue_place`, `arrival_place`, `non_stop`, `carbin_type`) VALUES
(3, '阿溴的私人飞机[@.@]efghi', 1, 0, 4.5000000000, 1, 'www.baidu.com', 20, '很好', 100.00, 1370208720000, 1370208900000, 'Hangzhou', 'Hangzhou', 1, 'First');

--
-- 转存表中的数据 `general_goods`
--

INSERT INTO `general_goods` (`id`, `name`, `price`, `seller_id`, `bought_count`, `score`, `score_count`, `place`, `image_uri`, `stock`, `description`) VALUES
(1, 'abcdefg溴溴溴', 0.50, 1, 0, 5.0000000000, 1, '杭州', 'www.baidu.com', 20, '很好');

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `type`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- 转存表中的数据 `hotel_room`
--

INSERT INTO `hotel_room` (`id`, `name`, `price`, `seller_id`, `bought_count`, `score`, `score_count`, `place`, `image_uri`, `stock`, `description`, `date_time`, `suit_type`) VALUES
(2, '阿溴的房间[>.<]efghi', 0.30, 1, 0, 4.0000000000, 1, 'Hangzhou', 'www.baidu.com', 20, '很好', 1370208720000, 'luxury');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
