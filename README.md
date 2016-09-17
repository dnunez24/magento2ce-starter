# Magento 2 Project Starter

## Requirements

* Docker (>= 1.12.x)
* ?

## Setup

```bash
git clone https://github.com/dnunez24/magento2-docker-starter.git my-project
cd my-project

# Modify the .env.example file to provide environment variables to Docker Compose
cp .env.example .env

# Copy the Docker Compose template for the Magento Edition you're deploying
# to simplify docker-compose commands
cp docker-compose-ce.yml docker-compose.yml
```

### Existing Database

To use an existing Magento 2 database, copy a MySQL dump file into the project directory and uncomment the SQL import line for the `db` service in the `docker-compose.yml` file.

```bash
cp $HOME/my-magento-data.sql.gz conf/data.sql.gz
```

### Start the Services

```bash
# Start the Docker Compose environment
docker-compose up -d
```

## Install Magento

If you didn't already use existing data in the last step...

```bash
# Installs without enterprise args by default
bin/install
```

### Install Sample Data (optional)

```bash
bin/magento sampledata:deploy
bin/magento setup:upgrade
bin/magento setup:di:compile
bin/magento indexer:reindex
bin/magento cache:flush
```

## Known Issues

### Can't Compile Static Assets

#### Problem

Magento throws the following error when you try to deploy static assets:

```
[Exception]                                                                                                                                    
  Notice: Use of undefined constant GLOB_BRACE - assumed 'GLOB_BRACE' in /var/www/html/vendor/zendframework/zend-stdlib/src/Glob.php on line 64
```

This happens because of a Zend Framework dependency on `GLOB_BRACE` that doesn't work on Alpine Linux. You can see the discussion [here](https://github.com/magento/magento2/issues/2130) and [here](https://github.com/zendframework/zend-stdlib/issues/58). As of September 2016, Magento has not incorporated the upstream changes that have been made to fix this in Zend Framework so it is addressed with a workaround.

#### Solution

Overwrite the problematic file with a patched version until Magento incorporates the upstream Zend Framework version into the Magento Composer project dependencies that fixes this issue. The affected line in the `docker-compose.yml` templates looks like:

```yaml
...
  app:
    ...
    volumes:
      - ./conf/Glob.php:/var/www/html/vendor/zendframework/zend-stdlib/src/Glob.php
```

## TODO

* [ ] Enterprise Edition Elasticsearch
* [ ] Enterprise Edition message queues (via RabbitMQ)
* [ ] Full-fledged SSL configurations and docs
