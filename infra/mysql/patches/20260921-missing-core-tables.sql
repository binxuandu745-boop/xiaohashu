-- Development-only schema completion for the xiaohashu2 MySQL 3307 copy.
-- Reconstructed from this project's MyBatis mappers and cross-checked against
-- the matching table shapes in the public MeetPerfect/xiaohongshu SQL.
-- No DROP or data-copy statements are included.
USE `xiaohashu`;

CREATE TABLE IF NOT EXISTS `t_fans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `fans_user_id` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_fans_user_id` (`user_id`, `fans_user_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_following` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `following_user_id` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_following_user_id` (`user_id`, `following_user_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_note_collection` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `note_id` bigint NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_note_id` (`user_id`, `note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_note_count` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint unsigned NOT NULL,
  `like_total` bigint DEFAULT 0,
  `collect_total` bigint DEFAULT 0,
  `comment_total` bigint DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_note_id` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_note_like` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `note_id` bigint NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_note_id` (`user_id`, `note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_user_count` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `fans_total` bigint DEFAULT 0,
  `following_total` bigint DEFAULT 0,
  `note_total` bigint DEFAULT 0,
  `like_total` bigint DEFAULT 0,
  `collect_total` bigint DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- The following two tables are inferred from the currently called comment
-- mapper statements and CommentDO/CommentLikeDO, not from the tutorial DDL.
-- Older generated mapper methods mention unrelated columns and are not used
-- by the current comment service; those methods remain unverified.
CREATE TABLE IF NOT EXISTS `t_comment` (
  `id` bigint unsigned NOT NULL,
  `note_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `content_uuid` varchar(64) DEFAULT NULL,
  `is_content_empty` bit(1) NOT NULL DEFAULT b'1',
  `image_url` varchar(1024) DEFAULT NULL,
  `level` tinyint NOT NULL,
  `reply_total` bigint NOT NULL DEFAULT 0,
  `like_total` bigint NOT NULL DEFAULT 0,
  `parent_id` bigint unsigned DEFAULT NULL,
  `reply_comment_id` bigint unsigned DEFAULT NULL,
  `reply_user_id` bigint unsigned DEFAULT NULL,
  `is_top` tinyint NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `child_comment_total` bigint NOT NULL DEFAULT 0,
  `first_reply_comment_id` bigint unsigned NOT NULL DEFAULT 0,
  `heat` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_note_level_heat` (`note_id`, `level`, `heat` DESC, `id` DESC),
  KEY `idx_parent_level_id` (`parent_id`, `level`, `id`),
  KEY `idx_reply_comment_id` (`reply_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `t_comment_like` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `comment_id` bigint unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_comment_id` (`user_id`, `comment_id`),
  KEY `idx_comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
