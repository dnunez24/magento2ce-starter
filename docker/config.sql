-- INSERT INTO core_config_data (`scope`, `scope_id`, `path`, `value`)
-- VALUES
/* default, 0 are default MySQL values, skip them for speed improvement */
--   ('default', 0, 'system/full_page_cache/caching_application', '2'),
--   ('default', 0, 'system/full_page_cache/varnish/access_list', 'app.magento.dev'),
--   ('default', 0, 'system/full_page_cache/varnish/backend_host', 'http.magento.dev'),
--   ('default', 0, 'system/full_page_cache/varnish/backend_port', '8080'),
--   ('default', 0, 'catalog/search/min_query_length', '3'),
--   ('default', 0, 'catalog/search/engine', 'elasticsearch'),
--   ('default', 0, 'catalog/search/elasticsearch_server_hostname', 'search.magento.dev'),
--   ('default', 0, 'catalog/search/elasticsearch_server_port', '9200'),
--   ('default', 0, 'catalog/search/elasticsearch_index_prefix', 'magento')
-- ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

LOAD DATA INFILE 'core_config_data.csv'
REPLACE INTO TABLE `core_config_data`
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES
(`scope`, `scope_id`, `path`, `value`);
