-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2016 at 08:48 AM
-- Server version: 5.6.17-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- USE 'guzman';
-- Database: `guzman`
--

-- --------------------------------------------------------

--
-- Table structure for table `commits`
--

CREATE TABLE IF NOT EXISTS `commits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sha` varchar(40) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `committer_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ext_ref_id` varchar(24) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sha` (`sha`),
  KEY `author_id` (`author_id`),
  KEY `committer_id` (`committer_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=566693 ;

--
-- Table structure for table `commit_comments`
--

CREATE TABLE IF NOT EXISTS `commit_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(256) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `comment_id` int(11) NOT NULL,
  `ext_ref_id` varchar(24) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `day_of_week` varchar(16) NOT NULL,
  `time_of_day` varchar(16) NOT NULL,
  `security` tinyint(1) NOT NULL,
  `language` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_id` (`comment_id`),
  KEY `commit_id` (`commit_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121660 ;

--
-- Table structure for table `commit_comments_nltk`
--

CREATE TABLE IF NOT EXISTS `commit_comments_nltk` (
  `comment_id` int(11) NOT NULL,
  `sentiment` varchar(7) NOT NULL,
  `neg` double NOT NULL,
  `neutral` double NOT NULL,
  `pos` double NOT NULL,
  `sentimentscore` double NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `commit_comments_sentistrength`
--

CREATE TABLE IF NOT EXISTS `commit_comments_sentistrength` (
  `comment_id` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `neg` int(11) NOT NULL,
  `sentiment` varchar(16) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `commit_comments_top29`
--

CREATE TABLE IF NOT EXISTS `commit_comments_top29` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(256) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `comment_id` int(11) NOT NULL,
  `ext_ref_id` varchar(24) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `day_of_week` varchar(16) NOT NULL,
  `time_of_day` varchar(16) NOT NULL,
  `security` tinyint(1) NOT NULL,
  `language` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_id` (`comment_id`),
  KEY `commit_id` (`commit_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121643 ;

--
-- Table structure for table `commit_discussions`
--

CREATE TABLE IF NOT EXISTS `commit_discussions` (
  `commit_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `security` tinyint(1) NOT NULL,
  PRIMARY KEY (`commit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `commit_discussions_sentistrength`
--

CREATE TABLE IF NOT EXISTS `commit_discussions_sentistrength` (
  `commit_id` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `neg` int(11) NOT NULL,
  `sentiment` varchar(12) NOT NULL,
  PRIMARY KEY (`commit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ext_ref_id` varchar(24) NOT NULL DEFAULT '0',
  `forked_from` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`owner_id`),
  KEY `owner_id` (`owner_id`),
  KEY `forked_from` (`forked_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108741 ;

--
-- Table structure for table `projects_with_more_than_200_comments`
--

CREATE TABLE IF NOT EXISTS `projects_with_more_than_200_comments` (
  `project_id` int(11) NOT NULL,
  `nr_comments` int(11) NOT NULL,
  `nr_stars` int(11) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `project_commits`
--

CREATE TABLE IF NOT EXISTS `project_commits` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `commit_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`commit_id`),
  KEY `commit_id` (`commit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `pro_commit_comments_nltk`
--

CREATE TABLE IF NOT EXISTS `pro_commit_comments_nltk` (
  `comment_id` int(11) DEFAULT NULL,
  `sentiment` varchar(10) DEFAULT NULL,
  `sentimentscore` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `pro_commit_comments_sentistrength`
--

CREATE TABLE IF NOT EXISTS `pro_commit_comments_sentistrength` (
  `comment_id` int(11) DEFAULT NULL,
  `sentiment` varchar(10) DEFAULT NULL,
  `sentimentscore` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `pull_requests`
--

CREATE TABLE IF NOT EXISTS `pull_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_repo_id` int(11) DEFAULT NULL,
  `base_repo_id` int(11) NOT NULL,
  `head_commit_id` int(11) DEFAULT NULL,
  `base_commit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pullreq_id` int(11) NOT NULL,
  `intra_branch` tinyint(1) NOT NULL,
  `merged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pullreq_id` (`pullreq_id`,`base_repo_id`),
  KEY `head_repo_id` (`head_repo_id`),
  KEY `base_repo_id` (`base_repo_id`),
  KEY `head_commit_id` (`head_commit_id`),
  KEY `base_commit_id` (`base_commit_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82802 ;

--
-- Table structure for table `pull_request_comments`
--

CREATE TABLE IF NOT EXISTS `pull_request_comments` (
  `pull_request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` mediumtext NOT NULL,
  `position` int(11) DEFAULT NULL,
  `body` varchar(256) DEFAULT NULL,
  `commit_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ext_ref_id` varchar(24) NOT NULL DEFAULT '0',
  `security` tinyint(1) NOT NULL,
  KEY `pull_request_id` (`pull_request_id`),
  KEY `user_id` (`user_id`),
  KEY `commit_id` (`commit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `pull_request_comments_sentistrength`
--

CREATE TABLE IF NOT EXISTS `pull_request_comments_sentistrength` (
  `comment_id` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `neg` int(11) NOT NULL,
  `sentiment` varchar(16) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `pull_request_commits`
--

CREATE TABLE IF NOT EXISTS `pull_request_commits` (
  `pull_request_id` int(11) NOT NULL,
  `commit_id` int(11) NOT NULL,
  PRIMARY KEY (`pull_request_id`,`commit_id`),
  KEY `commit_id` (`commit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `pull_request_discussions`
--

CREATE TABLE IF NOT EXISTS `pull_request_discussions` (
  `pull_request_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `security` tinyint(1) NOT NULL,
  PRIMARY KEY (`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `pull_request_discussions_sentistrength`
--

CREATE TABLE IF NOT EXISTS `pull_request_discussions_sentistrength` (
  `pull_request_id` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `neg` int(11) NOT NULL,
  `sentiment` varchar(12) NOT NULL,
  PRIMARY KEY (`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*
INSERT INTO `commits` (`id`, `sha`, `author_id`, `committer_id`, `project_id`, `created_at`, `ext_ref_id`) VALUES
(1, '8047099afdfc5c973faa67a04f601a014de0fa73', 17, 17, 10, '2012-04-08 00:29:18', '52343eefbd35436e92000003');

INSERT INTO `commit_comments` (`id`, `commit_id`, `user_id`, `body`, `line`, `position`, `comment_id`, `ext_ref_id`, `created_at`, `day_of_week`, `time_of_day`, `security`, `language`) VALUES
(28479, 53162, 16, 'I posted this as a patch file several weeks ago on the issue tracker: https://github.com/TrinityCore/TrinityCore/issues/1188 Unfortunately the patch file could not be ported to the new tracker but how about credits for the original author... :(', NULL, NULL, 390328, '524dd257bd3543ae270027f6', '2011-05-19 08:37:02', 'Thursday', 'morning', 0, 'C++');

INSERT INTO `commit_comments_top29` (`id`, `commit_id`, `user_id`, `body`, `line`, `position`, `comment_id`, `ext_ref_id`, `created_at`, `day_of_week`, `time_of_day`, `security`, `language`) VALUES
(28479, 53162, 16, 'I posted this as a patch file several weeks ago on the issue tracker: https://github.com/TrinityCore/TrinityCore/issues/1188 Unfortunately the patch file could not be ported to the new tracker but how about credits for the original author... :(', NULL, NULL, 390328, '524dd257bd3543ae270027f6', '2011-05-19 08:37:02', 'Thursday', 'morning', 0, 'C++');

INSERT INTO `commit_discussions` (`commit_id`, `body`, `security`) VALUES
(404, 'I think there is a missing file: https://github.com/facebook/folly/issues/23', 0);
*/
INSERT INTO `projects` (`id`, `url`, `owner_id`, `name`, `description`, `language`, `created_at`, `ext_ref_id`, `forked_from`, `deleted`) VALUES
(12, 'https://api.github.com/repos/TrinityCore/TrinityCore', 16, 'TrinityCore', 'TrinityCore Open Source MMO Framework', 'C++', '2010-12-28 22:40:07', '52343eeebd35436eaf000002', NULL, 0),
(25875, 'https://api.github.com/repos/jquery/jquery', 75972, 'jquery', 'jQuery JavaScript Library', 'JavaScript', '2009-04-03 13:20:14', '52358fd1bd35431622000002', NULL, 0),
(78852, 'https://api.github.com/repos/rails/rails', 167988, 'rails', 'Ruby on Rails', 'Ruby', '2008-04-11 00:19:47', '5237b213bd3543c151000002', NULL, 0),
(22980, 'https://api.github.com/repos/Bukkit/CraftBukkit', 66764, 'CraftBukkit', 'The Minecraft Server Mod API Implementation', 'Java', '2011-01-02 23:10:05', '52355da9bd3543b496000002', NULL, 0),
(91331, 'https://api.github.com/repos/diaspora/diaspora', 178771, 'diaspora', 'Distributed and contextual social networking', 'Ruby', '2010-09-15 03:20:04', '5237ce3cbd3543c8cf000002', NULL, 0),
(289, 'https://api.github.com/repos/mangos/MaNGOS', 657, 'MaNGOS', 'This is the master Information repository for MaNGOS', 'C++', '2008-10-13 14:24:47', '52344017bd3543ed18000002', NULL, 0);
/*
(108342, 'https://api.github.com/repos/Craftbukkit/Bukkit', 505581, 'Bukkit', '', NULL, '2011-05-30 14:05:27', '524d8253bd3543afc8000002', NULL, 0),
(108518, 'https://api.github.com/repos/hawks008/CraftBukkit', 372757, 'CraftBukkit', 'The Minecraft Server Mod API Implementation', 'Java', '2013-09-30 08:58:39', '525012fcbd3543671d0007c0', 22980, 0),
(108519, 'https://api.github.com/repos/ase34/CraftBukkit', 71760, 'CraftBukkit', 'The Minecraft Server Mod API Implementation', 'Java', '2013-09-28 05:56:46', '52501323bd3543671d0007d8', 22980, 0),
(108520, 'https://api.github.com/repos/Lucariatias/CraftBukkit', 372673, 'CraftBukkit', 'The Minecraft Server Mod API Implementation', 'Java', '2013-09-23 15:50:45', '5250137dbd3543671d00080a', 22980, 0),
(91331, 'https://api.github.com/repos/diaspora/diaspora', 178771, 'diaspora', 'Distributed and contextual social networking', 'Ruby', '2010-09-15 03:20:04', '5237ce3cbd3543c8cf000002', NULL, 0),
(99413, 'https://api.github.com/repos/enathu/diaspora', 85743, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-15 23:35:11', '52382374bd3543c8cf003a43', 91331, 0),
(99414, 'https://api.github.com/repos/kalapani/diaspora', 188527, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-15 23:45:39', '52382375bd3543c8cf003a45', 91331, 0),
(99415, 'https://api.github.com/repos/nihillo/diaspora', 188528, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-15 23:53:16', '52382376bd3543c8cf003a47', 91331, 0),
(99416, 'https://api.github.com/repos/vzmind/diaspora', 170313, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-15 23:57:17', '52382377bd3543c8cf003a48', 91331, 0),
(99417, 'https://api.github.com/repos/natoodo/diaspora', 188529, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:00:46', '52382378bd3543c8cf003a4a', 91331, 0),
(99418, 'https://api.github.com/repos/TurboSwag/diaspora', 188530, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:06:01', '52382379bd3543c8cf003a4c', 91331, 0),
(99419, 'https://api.github.com/repos/saggim/diaspora', 135355, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:06:35', '52382379bd3543c8cf003a4d', 91331, 0),
(99420, 'https://api.github.com/repos/atiw003/diaspora', 79, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:08:13', '5238237abd3543c8cf003a4e', 91331, 0),
(99421, 'https://api.github.com/repos/CDTLabs/diaspora', 188531, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:10:48', '5238237bbd3543c8cf003a50', 91331, 0),
(99422, 'https://api.github.com/repos/danillos/diaspora', 188311, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:29:34', '5238237cbd3543c8cf003a51', 91331, 0),
(99423, 'https://api.github.com/repos/DotSauce/diaspora', 188533, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:31:43', '5238237dbd3543c8cf003a53', 91331, 0),
(99424, 'https://api.github.com/repos/joewest/diaspora', 28145, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:39:33', '5238237dbd3543c8cf003a54', 91331, 0),
(99425, 'https://api.github.com/repos/xenda/diaspora', 171640, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:42:00', '5238237ebd3543c8cf003a55', 91331, 0),
(99426, 'https://api.github.com/repos/TheJRB/diaspora', 188534, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 00:57:45', '52382384bd3543c8cf003a57', 91331, 0),
(99427, 'https://api.github.com/repos/wxmn/diaspora', 48567, 'diaspora', 'Distributed and contextual social networking', 'JavaScript', '2010-09-16 01:01:15', '52382384bd3543c8cf003a58', 91331, 0),
(4710, 'https://api.github.com/repos/Wyk3d/mangos', 12155, 'mangos', 'MaNGOS is a free, Open Source implementation of a game server compatible with the original World of Warcraft client.', 'C++', '2008-10-15 13:02:05', '52345be3bd3543ed18001d72', 289, 0),
(4711, 'https://api.github.com/repos/balrok/mangos', 11102, 'mangos', 'MaNGOS is a free, Open Source implementation of a game server compatible with the original World of Warcraft client.', 'C++', '2008-10-15 18:58:21', '52345be4bd3543ed18001d73', 289, 0);
*/
