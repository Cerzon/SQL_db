-- Generation time: Tue, 18 Jun 2019 22:53:56 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_25
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','1988-10-14 18:47:39'),
('2','2','2','1988-09-04 16:08:30'),
('3','3','3','1994-07-10 22:07:03'),
('4','4','4','1991-05-12 20:32:08'),
('5','5','5','1978-09-10 14:36:01'),
('6','6','6','1992-04-15 01:27:31'),
('7','7','7','2003-02-03 04:56:27'),
('8','8','8','2017-04-24 09:30:19'),
('9','9','9','1974-02-07 20:53:55'),
('10','10','10','1973-05-11 03:21:40'),
('11','11','11','2008-12-17 13:03:56'),
('12','12','12','1995-07-17 21:22:38'),
('13','13','13','1985-09-07 23:34:21'),
('14','14','14','1973-01-27 23:11:53'),
('15','15','15','2003-07-26 13:04:20'),
('16','16','16','1980-11-21 22:17:38'),
('17','17','17','1970-07-26 12:34:00'),
('18','18','18','1973-10-28 18:05:14'),
('19','19','19','2007-01-03 20:25:42'),
('20','20','20','2000-07-18 08:04:28'),
('21','21','21','2013-08-23 04:24:48'),
('22','22','22','2007-11-21 00:23:39'),
('23','23','23','1991-12-20 19:26:15'),
('24','24','24','1995-08-15 08:20:37'),
('25','25','25','1991-05-22 04:57:12'),
('26','26','26','1984-03-04 03:14:59'),
('27','27','27','1997-12-27 11:34:17'),
('28','28','28','2002-04-05 20:20:59'),
('29','29','29','1994-07-03 10:23:16'),
('30','30','30','1987-08-02 12:23:44'),
('31','31','31','1990-08-26 21:14:20'),
('32','32','32','2001-10-09 12:21:41'),
('33','33','33','2014-03-23 07:22:37'),
('34','34','34','1984-06-21 14:44:42'),
('35','35','35','2016-07-06 03:39:46'),
('36','36','36','1976-08-08 19:28:34'),
('37','37','37','2006-06-25 17:16:24'),
('38','38','38','1983-08-18 20:08:51'),
('39','39','39','1994-08-10 00:41:57'),
('40','40','40','1983-07-02 13:46:55'),
('41','41','41','1980-03-12 02:28:43'),
('42','42','42','2016-02-26 23:55:09'),
('43','43','43','2005-07-25 18:23:22'),
('44','44','44','2015-06-02 06:03:05'),
('45','45','45','1986-02-10 17:21:49'),
('46','46','46','1995-04-13 23:39:41'),
('47','47','47','2008-08-18 08:16:58'),
('48','48','48','2015-04-15 12:50:10'),
('49','49','49','2004-06-04 22:10:18'),
('50','50','50','1998-02-12 14:20:07'),
('51','51','51','1973-07-24 11:34:16'),
('52','52','52','2018-05-26 20:54:15'),
('53','53','53','1978-12-20 07:52:16'),
('54','54','54','2007-04-22 15:33:44'),
('55','55','55','1979-09-27 23:37:49'),
('56','56','56','2014-05-13 16:49:56'),
('57','57','57','2005-04-13 09:52:25'),
('58','58','58','2010-08-21 18:49:25'),
('59','59','59','1983-04-06 03:43:47'),
('60','60','60','1984-10-17 11:22:01'),
('61','61','61','2011-04-23 21:09:02'),
('62','62','62','2004-03-08 21:26:14'),
('63','63','63','2014-07-02 04:20:15'),
('64','64','64','2018-03-03 14:09:38'),
('65','65','65','2015-09-07 22:04:17'),
('66','66','66','2003-06-21 17:21:54'),
('67','67','67','1989-12-26 05:50:54'),
('68','68','68','1987-05-25 19:25:26'),
('69','69','69','1998-07-08 10:16:29'),
('70','70','70','2005-02-21 17:22:04'),
('71','71','71','2008-04-06 15:11:19'),
('72','72','72','2012-11-26 10:23:39'),
('73','73','73','1990-06-15 21:00:35'),
('74','74','74','2013-01-31 06:51:53'),
('75','75','75','2009-06-26 22:50:08'),
('76','76','76','2004-05-24 17:22:26'),
('77','77','77','1971-09-14 03:28:10'),
('78','78','78','1971-05-18 01:58:40'),
('79','79','79','2016-05-15 22:22:37'),
('80','80','80','1998-07-04 22:37:30'),
('81','81','81','1983-07-03 08:57:24'),
('82','82','82','2009-08-28 08:25:04'),
('83','83','83','1994-11-30 17:40:25'),
('84','84','84','1978-05-18 08:59:19'),
('85','85','85','1970-10-13 07:31:00'),
('86','86','86','1978-04-17 13:08:12'),
('87','87','87','1972-10-05 21:18:52'),
('88','88','88','2016-03-20 07:13:38'),
('89','89','89','1975-09-30 04:23:19'),
('90','90','90','2011-05-22 19:44:27'),
('91','91','91','2002-02-02 17:47:22'),
('92','92','92','1983-02-09 03:26:57'),
('93','93','93','2019-06-01 22:24:54'),
('94','94','94','2015-04-29 10:18:49'),
('95','95','95','1985-09-30 07:47:55'),
('96','96','96','2000-12-14 04:45:02'),
('97','97','97','1983-02-28 06:56:01'),
('98','98','98','2018-04-14 23:46:36'),
('99','99','99','2019-05-02 11:19:31'),
('100','100','100','2007-04-26 11:11:55'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

