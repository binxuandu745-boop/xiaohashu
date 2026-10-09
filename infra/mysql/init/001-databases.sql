CREATE DATABASE IF NOT EXISTS xiaohashu
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS leaf
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS xxl_job
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE leaf;

CREATE TABLE IF NOT EXISTS leaf_alloc (
  biz_tag VARCHAR(128) NOT NULL DEFAULT '',
  max_id BIGINT NOT NULL DEFAULT 1,
  step INT NOT NULL,
  description VARCHAR(256) DEFAULT NULL,
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (biz_tag)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO leaf_alloc (biz_tag, max_id, step, description) VALUES
  ('leaf-segment-xiaohashu-id', 1, 2000, 'Xiaohashu business id'),
  ('leaf-segment-user-id', 1, 2000, 'User id'),
  ('leaf-segment-comment-id', 1, 2000, 'Comment id');
