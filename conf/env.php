<?php
return array (
  'backend' => 
  array (
    'frontName' => 'admin',
  ),
  'cache' => 
  array (
    'frontend' => 
    array (
      'default' => 
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' => 
        array (
          'server' => '172.16.222.60',
          'port' => '6379',
          'database' => '0',
        ),
      ),
    ),
  ),
  'db' => 
  array (
    'connection' => 
    array (
      'default' => 
      array (
        'host' => '172.16.222.80',
        'dbname' => 'magento',
        'username' => 'magento',
        'password' => 'magento',
        'model' => 'mysql4',
        'initStatements' => 'SET NAMES utf8;',
        'active' => 1,
        'engine' => 'innodb',
      ),
    ),
    'table_prefix' => '',
  ),
  'session' => 
  array (
    'save' => 'files',
    'redis' => 
    array (
      'host' => '172.16.222.70',
      'port' => '6379',
      'password' => '',
      'timeout' => '2.5',
      'persistent_identifier' => '',
      'database' => '0',
      'compression_threshold' => '2048',
      'compression_library' => 'lzf',
      'log_level' => '3',
      'max_concurrency' => '6',
      'break_after_frontend' => '5',
      'break_after_adminhtml' => '30',
      'first_lifetime' => '600',
      'bot_first_lifetime' => '60',
      'bot_lifetime' => '7200',
      'disable_locking' => '0',
      'min_lifetime' => '60',
      'max_lifetime' => '2592000',
    ),
  ),
  'crypt' => 
  array (
    'key' => 'e6d6540b54904049cdbdd96d033aa3de',
  ),
  'resource' => 
  array (
    'default_setup' => 
    array (
      'connection' => 'default',
    ),
  ),
  'x-frame-options' => 'SAMEORIGIN',
  'MAGE_MODE' => 'default',
  'cache_types' => 
  array (
    'config' => 1,
    'layout' => 1,
    'block_html' => 1,
    'collections' => 1,
    'reflection' => 1,
    'db_ddl' => 1,
    'eav' => 1,
    'customer_notification' => 1,
    'full_page' => 1,
    'config_integration' => 1,
    'config_integration_api' => 1,
    'translate' => 1,
    'config_webservice' => 1,
  ),
  'install' => 
  array (
    'date' => 'Mon, 29 Aug 2016 05:45:57 +0000',
  ),
  'http_cache_hosts' => 
  array (
    0 => 
    array (
      'host' => '172.16.221.20',
    ),
  ),
);
