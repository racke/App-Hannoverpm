SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_AUTO_VALUE_ON_ZERO,NO_ZERO_DATE,NO_ZERO_IN_DATE,STRICT_ALL_TABLES';

CREATE SCHEMA IF NOT EXISTS `app_hannoverpm` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
SHOW WARNINGS;
USE `app_hannoverpm` ;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Languages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Languages` (
  `language_id` VARCHAR(20) NOT NULL COMMENT 'RFC-5646 Tags for Identifying Languages' ,
  `native_name` VARCHAR(70) NOT NULL COMMENT 'Language name in the target native language.' ,
  `english_name` VARCHAR(70) NOT NULL COMMENT 'Language name in the english language.' ,
  `german_name` VARCHAR(70) NOT NULL COMMENT 'Language name in the german language.' ,
  PRIMARY KEY (`language_id`) ,
  UNIQUE INDEX `IDX_LANGUAGES_ENGLISHNAME` (`english_name` ASC) ,
  UNIQUE INDEX `IDX_LANGAUGES_GERMANNAME` (`german_name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Generic language keys';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Users` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Internal numerical user identifier' ,
  `display_name` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Display name e.g. shown in posts, comments or user profile.' ,
  `email` VARCHAR(254) NULL DEFAULT NULL COMMENT 'E-mail address' ,
  `prefered_language` VARCHAR(20) NOT NULL COMMENT 'User\'s prefered language' ,
  `signup_datetime` DATETIME NOT NULL COMMENT 'Date and time of account creation' ,
  `last_login_datetime` DATETIME NULL DEFAULT NULL COMMENT 'Date and time of last account login' ,
  `has_login_fails` TINYINT UNSIGNED NOT NULL COMMENT 'Number of failed logins since last successful login' ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `IDX_USERS_DISPLAYNAME` (`display_name` ASC) ,
  UNIQUE INDEX `IDX_USERS_EMAIL` (`email` ASC) ,
  INDEX `IDX_USERS_PREFEREDLANGUAGE` (`prefered_language` ASC) ,
  CONSTRAINT `FK_USERS_LANGUAGES`
    FOREIGN KEY (`prefered_language` )
    REFERENCES `app_hannoverpm`.`Languages` (`language_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Generic user data';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Roles` (
  `role_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Internal numerical role identifier' ,
  `role_name` VARCHAR(25) NOT NULL COMMENT 'Internal role name used in source code' ,
  PRIMARY KEY (`role_id`) ,
  UNIQUE INDEX `IDX_ROLES_ROLENAME` (`role_name` ASC) )
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Generic role data';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Users_Roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Users_Roles` (
  `user_id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal numerical user identifier' ,
  `role_id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal numerical role identifier' ,
  PRIMARY KEY (`user_id`, `role_id`) ,
  INDEX `IDX_USERSROLES_ROLEID` (`role_id` ASC) ,
  INDEX `IDX_USERSROLES_USERID` (`user_id` ASC) ,
  CONSTRAINT `FK_USERROLES_USERS`
    FOREIGN KEY (`user_id` )
    REFERENCES `app_hannoverpm`.`Users` (`user_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `FK_USERROLES_ROLES`
    FOREIGN KEY (`role_id` )
    REFERENCES `app_hannoverpm`.`Roles` (`role_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Users has roles';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Users_OAuth`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Users_OAuth` (
  `user_id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal numerical user identifier' ,
  `service` VARCHAR(25) NOT NULL COMMENT 'OAuth service like GitHub, Twitter or Facebook' ,
  `external_user_id` VARCHAR(250) NOT NULL COMMENT 'External user identification string from the OAuth service' ,
  INDEX `IDX_USERSOAUTH_USERID` (`user_id` ASC) ,
  PRIMARY KEY (`service`, `external_user_id`) ,
  CONSTRAINT `FK_USERSOAUTH_USERS`
    FOREIGN KEY (`user_id` )
    REFERENCES `app_hannoverpm`.`Users` (`user_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Users has external OAuth ids';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`News`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`News` (
  `news_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Internal numerical news identifier' ,
  `publication_datetime` DATETIME NULL DEFAULT NULL COMMENT 'Date and time of final publication' ,
  `has_views` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of views for this news' ,
  PRIMARY KEY (`news_id`) ,
  INDEX `IDX_NEWS_VIEWS` (`has_views` ASC) ,
  INDEX `IDX_NEWS_PUBLICATIONDATETIME` (`publication_datetime` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Generic news data';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`News_I18N`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`News_I18N` (
  `news_id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal numerical news identifier' ,
  `language_id` VARCHAR(20) NOT NULL COMMENT 'RFC-5646 Tags for Identifying Languages' ,
  `subject` VARCHAR(70) NOT NULL COMMENT 'Plain subject in native language' ,
  `abstract` VARCHAR(150) NOT NULL COMMENT 'Plain abstract in native language' ,
  `message` MEDIUMTEXT NOT NULL COMMENT 'Markdown message in native language' ,
  `has_edits` SMALLINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of edits for this specific news internationalization' ,
  `last_edit_datetime` DATETIME NULL COMMENT 'Date and time of last edit for this specific news internationalization' ,
  `last_editor` INT(10) UNSIGNED NOT NULL COMMENT 'Last editor (user_id) for this specific news internationalization' ,
  PRIMARY KEY (`news_id`, `language_id`) ,
  INDEX `IDX_NEWSI18N_LANGUAGEID` (`language_id` ASC) ,
  INDEX `IDX_NEWSI18N_LASTEDITOR` (`last_editor` ASC) ,
  INDEX `IDX_NEWSI18N_LASTEDITDATETIME` (`last_edit_datetime` ASC) ,
  CONSTRAINT `FK_NEWSI18N_NEWS`
    FOREIGN KEY (`news_id` )
    REFERENCES `app_hannoverpm`.`News` (`news_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `FK_NEWSI18N_LANGUAGES`
    FOREIGN KEY (`language_id` )
    REFERENCES `app_hannoverpm`.`Languages` (`language_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `FK_NEWSI18N_USERS`
    FOREIGN KEY (`last_editor` )
    REFERENCES `app_hannoverpm`.`Users` (`user_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'News internationalization';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Tags` (
  `tag_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Internal numerical tag identifier' ,
  `has_entries` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of entries associated to this tag' ,
  PRIMARY KEY (`tag_id`) ,
  INDEX `IDX_TAGS_HASENTRIES` (`has_entries` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Generic tag data';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Tags_Languages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Tags_Languages` (
  `tag_id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal numerical tag identifier' ,
  `language_id` VARCHAR(20) NOT NULL COMMENT 'RFC-5646 Tags for Identifying Languages' ,
  `name` VARCHAR(25) NOT NULL COMMENT 'Tag name in native language' ,
  PRIMARY KEY (`tag_id`, `language_id`) ,
  INDEX `IDX_TAGSLANGUAGES_LANGUAGEID` (`language_id` ASC) ,
  INDEX `IDX_TAGSLANGUAGES_TAGID` (`tag_id` ASC) ,
  UNIQUE INDEX `IDX_TAGSLANGUAGES_NAMEID` (`name` ASC) ,
  CONSTRAINT `FK_TAGSLANGUAGES_TAGS`
    FOREIGN KEY (`tag_id` )
    REFERENCES `app_hannoverpm`.`Tags` (`tag_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `FK_TAGSLANGUAGES_LANGUAGES`
    FOREIGN KEY (`language_id` )
    REFERENCES `app_hannoverpm`.`Languages` (`language_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tag internationalization';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`News_Tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`News_Tags` (
  `news_id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal numerical news identifier' ,
  `tag_id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal numerical tag identifier' ,
  PRIMARY KEY (`news_id`, `tag_id`) ,
  INDEX `IDX_NEWSTAGS_TAGID` (`tag_id` ASC) ,
  INDEX `IDX__NEWSTAGS_NEWSID` (`news_id` ASC) ,
  CONSTRAINT `FK_NEWSTAGS_NEWS`
    FOREIGN KEY (`news_id` )
    REFERENCES `app_hannoverpm`.`News` (`news_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `FK_NEWSTAGS_TAGS`
    FOREIGN KEY (`tag_id` )
    REFERENCES `app_hannoverpm`.`Tags` (`tag_id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'News has tags';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `app_hannoverpm`.`Database_Information`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `app_hannoverpm`.`Database_Information` (
  `key` VARCHAR(25) NOT NULL ,
  `value` VARCHAR(250) NULL DEFAULT NULL ,
  PRIMARY KEY (`key`) )
ENGINE = InnoDB;

SHOW WARNINGS;
USE `app_hannoverpm` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
