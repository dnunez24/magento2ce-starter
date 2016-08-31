#!/bin/bash

source ../.env

docker-compose exec app bin/magento setup:install \
  --no-interaction \
  --admin-email=$MAGE_ADMIN_EMAIL \
  --admin-firstname=$MAGE_ADMIN_FIRSTNAME \
  --admin-lastname=$MAGE_ADMIN_LASTNAME \
  --admin-password=$MAGE_ADMIN_PASSWORD \
  --admin-use-security-key=$MAGE_ADMIN_USE_SECURITY_KEY \
  --admin-user=$MAGE_ADMIN_USERNAME \
  --base-url=$MAGE_BASE_URL \
  --currency=$MAGE_CURRENCY \
  --db-host=$MYSQL_HOST \
  --db-name=$MYSQL_DATABASE \
  --db-password=$MYSQL_PASSWORD \
  --db-user=$MYSQL_USER \
  --http-cache-hosts=$VARNISH_HOST \
  --language=$MAGE_LANGUAGE \
  --session-save=files \
  --timezone=$MAGE_TIMEZONE \
  --use-rewrites=$MAGE_USE_REWRITES \
  --use-secure=$MAGE_USE_SECURE \
  --use-secure-admin=$MAGE_USE_SECURE_ADMIN
