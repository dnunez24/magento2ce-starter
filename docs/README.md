# Magento 2 Project Starter

## Requirements

* Docker for Mac (>= 1.12.x)
* Docker Compose

## Setup

```bash
git clone https://github.com/dnunez24/magento2-docker-starter.git my-project
cd my-project

```

Modify the `.env` file to provide environment variables to Docker Compose

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

## Develop

Add your theme, module or language pack to `src` directory.

```bash
mkdir src/module-my-feature
```

Add your local module directory as a Composer repository with the `path` type.

```bash
composer config repositories.my-feature path ./src/module-my-feature
```

Add a `composer.json` file to your module directory.

```bash
touch src/module-my-feature/composer.json
```

[Configure your component](http://devdocs.magento.com/guides/v2.1/extension-dev-guide/package/package_module.html) in the `composer.json` file you created. Its contents should look something like the following:

```json
{
    "name": "my-vendor/module-my-feature",
    "description": "Some new feature",
    "type": "magento2-module",
    "version": "dev-master",
    "license": [
        "OSL-3.0",
        "AFL-3.0"
    ],
    "require": {
        "php": "~5.5.0|~5.6.0|~7.0.0",
        "magento/magento-composer-installer": "*",
        "magento/framework": "100.1.*"
    },
    "autoload": {
        "files": [
            "registration.php"
        ],
        "psr-4": {
            "MyVendor\\MyFeature\\": ""
        }
    }
}
```

Add your `registration.php` file for Composer autoloading.

```bash
touch src/module-my-feature/registration.php
```

Configure your module registration. It should look something like the following:

```php
<?php

use \Magento\Framework\Component\ComponentRegistrar;

ComponentRegistrar::register(
    ComponentRegistrar::MODULE,
    'MyVendor_MyModule',
    __DIR__
);

```

Require your module through Composer.

```bash
composer require my-vendor/module-my-feature:dev-master
```

The project root level `composer.json` should then look something like the following:

```json
"require": {
    "composer/composer": "@alpha",
    "magento/magento-composer-installer": "*",
    "magento/product-community-edition": "2.1.4",
    "my-vendor/module-my-feature": "dev-master"
},
```

Enable and set up your module in Magento.

```bash
bin/magento module:enable MyVendor_MyFeature
bin/magento setup:upgrade
```

## Linting & Testing

### Linting

You can manually run static analysis tools during development

```bash
phpcs
```

Or, better yet, configure your editor to support on-the-fly linting. Here are some resources for common editors:

[Atom](https://atom.io/packages/linter)  
[Sublime Text](http://www.sublimelinter.com/en/latest/)  
[PHP Storm](https://www.jetbrains.com/help/phpstorm/2016.3/using-php-code-sniffer-tool.html)  
[Vim](https://github.com/bpearson/vim-phpcs)  

## Testing

TODO

## Roadmap

* [ ] Add HTTPS capability and docs
* [ ] Configure Behat bootstraps for Magento 2 testing
