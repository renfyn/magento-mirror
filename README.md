# Magento Mirror Phing build for CI/CD

## run it localy:

first copy .env.dit to .env.  
Configure your environment variables:  

- DB_HOST=database
- DB_USER=root
- DB_PASS=<your custom password>
- DB_NAME=<your db name>
- TIMEZONE=<example europe/Paris>
- LOCALE_CODE=<example en_US>
- ADMIN=<exemple admin/ admin URL path>
- KEY=<secret key to encrypt datas>
  
run the following commands:  

```bash

docker-compose up --build -d
docker-composer exec magento /bin/bash
composer install
vendor/bin/phing setup

```
