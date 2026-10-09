CREATE KEYSPACE IF NOT EXISTS xiaohashu
WITH replication = {
  'class': 'SimpleStrategy',
  'replication_factor': 1
};

CREATE TABLE IF NOT EXISTS xiaohashu.comment_content (
  note_id bigint,
  year_month text,
  content_id uuid,
  content text,
  PRIMARY KEY ((note_id, year_month), content_id)
) WITH CLUSTERING ORDER BY (content_id ASC);
