# Magento Mirror Phing build for CI/CD

## run it localy:

*Requirements :* install docker and docker-compose.  

first copy .env.dit to .env.  
Configure your environment variables:  

- DB_HOST=database
- DB_USER=root
- DB_PASS=your custom password
- DB_NAME=your db name
- TIMEZONE=< example europe/Paris >
- LOCALE_CODE=< example en_US or fr_FR >
- ADMIN=< exemple admin/ admin URL path >
- KEY=< secret key to encrypt datas >
  
run the following commands:  

```bash

docker-compose up --build -d
docker-composer exec magento /bin/bash
composer install
vendor/bin/phing setup

```

## use it in CI/CD:

*Requirements :* run it in a preconfigured ennvironment with existing Magento database.  

Configure your environments variables as secrets in you CI/CD plateform.  

- DB_HOST=database
- DB_USER=root
- DB_PASS=your custom password
- DB_NAME=your db name
- TIMEZONE=< example europe/Paris >
- LOCALE_CODE=< example en_US or fr_FR >
- ADMIN=< exemple admin/ admin URL path >
- KEY=< secret key to encrypt datas >
  
In your build stage install depedencies and prepare configuration setup:

```bash

composer install
vendor/bin/phing setup

```
  
Now you can build and push your contianer.  
