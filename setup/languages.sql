# remove the following after development is complete
drop table IF EXISTS languages;

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang2` char(2),
  `name` VARCHAR(80),
  PRIMARY KEY (`id`),
  INDEX `lang2` (`lang2`),
  CONSTRAINT  `name` UNIQUE (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
