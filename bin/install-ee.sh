#!/bin/sh

MAGE_ROOT="/var/www/html"
PATH="$MAGE_ROOT/bin:$PATH"

magento setup:install \
  --no-interaction \
  --admin-email=$MAGE_ADMIN_EMAIL \
  --admin-firstname=$MAGE_ADMIN_FIRSTNAME \
  --admin-lastname=$MAGE_ADMIN_LASTNAME \
  --admin-password=$MAGE_ADMIN_PASSWORD \
  --admin-use-security-key=$MAGE_ADMIN_USE_SECURITY_KEY \
  --admin-user=$MAGE_ADMIN_USERNAME \
  # --amqp-host=$RABBITMQ_HOST \
  # --amqp-port=$RABBITMQ_PORT \
  # --amqp-user=$RABBITMQ_USER \
  # --amqp-password=$RABBITMQ_PASSWORD \
  --base-url=$MAGE_BASE_URL \
  --base-url-secure=$MAGE_BASE_URL_SECURE \
  --backend-frontname=$MAGE_BACKEND_FRONTNAME \
  --currency=$MAGE_CURRENCY \
  --db-host=$MYSQL_HOST \
  --db-name=$MYSQL_DATABASE \
  --db-password=$MYSQL_PASSWORD \
  --db-user=$MYSQL_USER \
  --http-cache-hosts=$VARNISH_HOST \
  --language=$MAGE_LANGUAGE \
  --session-save=redis \
  --timezone=$MAGE_TIMEZONE \
  --use-rewrites=$MAGE_USE_REWRITES \
  --use-secure=$MAGE_USE_SECURE \
  --use-secure-admin=$MAGE_USE_SECURE_ADMIN

magento deploy:mode:set $MAGE_MODE
# magento setup:upgrade \
# && magento setup:di:compile \
# && magento setup:static-content:deploy \
# && magento indexer:reindex \
# && magento cache:clean \
magento config:set 'cache/varnish/enabled' 1
magento config:set 'system/full_page_cache/caching_application' 1
magento config:set 'system/full_page_cache/varnish/backend_host' http
magento config:set 'system/full_page_cache/varnish/backend_port' 8080
magento config:set 'system/full_page_cache/ttl' 86400
