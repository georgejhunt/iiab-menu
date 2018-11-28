CREATE DATABASE IF NOT EXISTS menus_db;

USE menus_db;

# remove the following after development is complete
drop table IF EXISTS menus;

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40),
   title VARCHAR(100),
   description VARCHAR(1000),
   present BOOLEAN DEFAULT 0,
  `visible` BOOLEAN DEFAULT 0,
  `seq` TINYINT DEFAULT 0,
   extra_html VARCHAR(4000),
   zim_name VARCHAR(400),
   lang VARCHAR(10),
   logo_url VARCHAR(400),
   intended_use VARCHAR(40),
   moddir VARCHAR(40),
   menu_item_name VARCHAR(40),
   start_url VARCHAR(400),
   apk_file VARCHAR(400),
   apk_file_size INTEGER,
  `datetime_created` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `js` VARCHAR(10000),
  PRIMARY KEY (`id`),
  CONSTRAINT  `name` UNIQUE (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON menus_db.* TO 'menus_user'@'localhost';
