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
docker-compose run --rm -v "$PWD/bin/install-ce.sh":install.sh app install.sh
bin/install community
```

### Install Sample Data (optional)

```bash
bin/magento sampledata:deploy
bin/magento setup:upgrade
bin/magento setup:di:compile
bin/magento indexer:reindex
bin/magento cache:flush
```

### Copy Files to Host (Optional)

If you want to be able to develop against the source used in the container, you will first need to copy those files to your host machine before starting the Docker Compose environment.

```bash
# Copy files from app container to host
docker cp app_1:/var/www/html magento

# Start the services
docker-compose up -d
```

## TODO

* [ ] Enterprise Edition Elasticsearch
* [ ] Enterprise Edition message queues (via RabbitMQ)
* [ ] Full-fledged SSL configurations and docs
