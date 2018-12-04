-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2018 at 06:25 PM
-- Server version: 10.0.36-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menus_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `lang2` char(2) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lang2`, `name`) VALUES
(1, 'aa', 'Afar'),
(2, 'ab', 'Abkhazian'),
(3, 'ae', 'Avestan'),
(4, 'af', 'Afrikaans'),
(5, 'ak', 'Akan'),
(6, 'am', 'Amharic'),
(7, 'an', 'Aragonese'),
(8, 'ar', 'Arabic'),
(9, 'as', 'Assamese'),
(10, 'av', 'Avaric'),
(11, 'ay', 'Aymara'),
(12, 'az', 'Azerbaijani'),
(13, 'ba', 'Bashkir'),
(14, 'be', 'Belarusian'),
(15, 'bg', 'Bulgarian'),
(16, 'bh', 'Bihari languages'),
(17, 'bi', 'Bislama'),
(18, 'bm', 'Bambara'),
(19, 'bn', 'Bengali'),
(20, 'bo', 'Tibetan'),
(21, 'br', 'Breton'),
(22, 'bs', 'Bosnian'),
(23, 'ca', 'Catalan; Valencian'),
(24, 'ce', 'Chechen'),
(25, 'ch', 'Chamorro'),
(26, 'co', 'Corsican'),
(27, 'cr', 'Cree'),
(28, 'cs', 'Czech'),
(29, 'cu', 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),
(30, 'cv', 'Chuvash'),
(31, 'cy', 'Welsh'),
(32, 'da', 'Danish'),
(33, 'de', 'German'),
(34, 'dv', 'Divehi; Dhivehi; Maldivian'),
(35, 'dz', 'Dzongkha'),
(36, 'ee', 'Ewe'),
(37, 'el', 'Greek, Modern (1453-)'),
(38, 'en', 'English'),
(39, 'eo', 'Esperanto'),
(40, 'es', 'Spanish; Castilian'),
(41, 'et', 'Estonian'),
(42, 'eu', 'Basque'),
(43, 'fa', 'Persian'),
(44, 'ff', 'Fulah'),
(45, 'fi', 'Finnish'),
(46, 'fj', 'Fijian'),
(47, 'fo', 'Faroese'),
(48, 'fr', 'French'),
(49, 'fy', 'Western Frisian'),
(50, 'ga', 'Irish'),
(51, 'gd', 'Gaelic; Scottish Gaelic'),
(52, 'gl', 'Galician'),
(53, 'gn', 'Guarani'),
(54, 'gu', 'Gujarati'),
(55, 'gv', 'Manx'),
(56, 'ha', 'Hausa'),
(57, 'he', 'Hebrew'),
(58, 'hi', 'Hindi'),
(59, 'ho', 'Hiri Motu'),
(60, 'hr', 'Croatian'),
(61, 'ht', 'Haitian; Haitian Creole'),
(62, 'hu', 'Hungarian'),
(63, 'hy', 'Armenian'),
(64, 'hz', 'Herero'),
(65, 'ia', 'Interlingua (International Auxiliary Language Association)'),
(66, 'id', 'Indonesian'),
(67, 'ie', 'Interlingue; Occidental'),
(68, 'ig', 'Igbo'),
(69, 'ii', 'Sichuan Yi; Nuosu'),
(70, 'ik', 'Inupiaq'),
(71, 'io', 'Ido'),
(72, 'is', 'Icelandic'),
(73, 'it', 'Italian'),
(74, 'iu', 'Inuktitut'),
(75, 'ja', 'Japanese'),
(76, 'jv', 'Javanese'),
(77, 'ka', 'Georgian'),
(78, 'kg', 'Kongo'),
(79, 'ki', 'Kikuyu; Gikuyu'),
(80, 'kj', 'Kuanyama; Kwanyama'),
(81, 'kk', 'Kazakh'),
(82, 'kl', 'Kalaallisut; Greenlandic'),
(83, 'km', 'Central Khmer'),
(84, 'kn', 'Kannada'),
(85, 'ko', 'Korean'),
(86, 'kr', 'Kanuri'),
(87, 'ks', 'Kashmiri'),
(88, 'ku', 'Kurdish'),
(89, 'kv', 'Komi'),
(90, 'kw', 'Cornish'),
(91, 'ky', 'Kirghiz; Kyrgyz'),
(92, 'la', 'Latin'),
(93, 'lb', 'Luxembourgish; Letzeburgesch'),
(94, 'lg', 'Ganda'),
(95, 'li', 'Limburgan; Limburger; Limburgish'),
(96, 'ln', 'Lingala'),
(97, 'lo', 'Lao'),
(98, 'lt', 'Lithuanian'),
(99, 'lu', 'Luba-Katanga'),
(100, 'lv', 'Latvian'),
(101, 'mg', 'Malagasy'),
(102, 'mh', 'Marshallese'),
(103, 'mi', 'Maori'),
(104, 'mk', 'Macedonian'),
(105, 'ml', 'Malayalam'),
(106, 'mn', 'Mongolian'),
(107, 'mr', 'Marathi'),
(108, 'ms', 'Malay'),
(109, 'mt', 'Maltese'),
(110, 'my', 'Burmese'),
(111, 'na', 'Nauru'),
(112, 'nb', 'Bokmål, Norwegian; Norwegian Bokmål'),
(113, 'nd', 'Ndebele, North; North Ndebele'),
(114, 'ne', 'Nepali'),
(115, 'ng', 'Ndonga'),
(116, 'nl', 'Dutch; Flemish'),
(117, 'nn', 'Norwegian Nynorsk; Nynorsk, Norwegian'),
(118, 'no', 'Norwegian'),
(119, 'nr', 'Ndebele, South; South Ndebele'),
(120, 'nv', 'Navajo; Navaho'),
(121, 'ny', 'Chichewa; Chewa; Nyanja'),
(122, 'oc', 'Occitan (post 1500); Provençal'),
(123, 'oj', 'Ojibwa'),
(124, 'om', 'Oromo'),
(125, 'or', 'Oriya'),
(126, 'os', 'Ossetian; Ossetic'),
(127, 'pa', 'Panjabi; Punjabi'),
(128, 'pi', 'Pali'),
(129, 'pl', 'Polish'),
(130, 'ps', 'Pushto; Pashto'),
(131, 'pt', 'Portuguese'),
(132, 'qu', 'Quechua'),
(133, 'rm', 'Romansh'),
(134, 'rn', 'Rundi'),
(135, 'ro', 'Romanian; Moldavian; Moldovan'),
(136, 'ru', 'Russian'),
(137, 'rw', 'Kinyarwanda'),
(138, 'sa', 'Sanskrit'),
(139, 'sc', 'Sardinian'),
(140, 'sd', 'Sindhi'),
(141, 'se', 'Northern Sami'),
(142, 'sg', 'Sango'),
(143, 'si', 'Sinhala; Sinhalese'),
(144, 'sk', 'Slovak'),
(145, 'sl', 'Slovenian'),
(146, 'sm', 'Samoan'),
(147, 'sn', 'Shona'),
(148, 'so', 'Somali'),
(149, 'sq', 'Albanian'),
(150, 'sr', 'Serbian'),
(151, 'ss', 'Swati'),
(152, 'st', 'Sotho, Southern'),
(153, 'su', 'Sundanese'),
(154, 'sv', 'Swedish'),
(155, 'sw', 'Swahili'),
(156, 'ta', 'Tamil'),
(157, 'te', 'Telugu'),
(158, 'tg', 'Tajik'),
(159, 'th', 'Thai'),
(160, 'ti', 'Tigrinya'),
(161, 'tk', 'Turkmen'),
(162, 'tl', 'Tagalog'),
(163, 'tn', 'Tswana'),
(164, 'to', 'Tonga (Tonga Islands)'),
(165, 'tr', 'Turkish'),
(166, 'ts', 'Tsonga'),
(167, 'tt', 'Tatar'),
(168, 'tw', 'Twi'),
(169, 'ty', 'Tahitian'),
(170, 'ug', 'Uighur; Uyghur'),
(171, 'uk', 'Ukrainian'),
(172, 'ur', 'Urdu'),
(173, 'uz', 'Uzbek'),
(174, 've', 'Venda'),
(175, 'vi', 'Vietnamese'),
(176, 'vo', 'Volapük'),
(177, 'wa', 'Walloon'),
(178, 'wo', 'Wolof'),
(179, 'xh', 'Xhosa'),
(180, 'yi', 'Yiddish'),
(181, 'yo', 'Yoruba'),
(182, 'za', 'Zhuang; Chuang'),
(183, 'zh', 'Chinese'),
(184, 'zu', 'Zulu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lang2` (`lang2`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
