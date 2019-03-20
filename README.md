# docker-livehelperchat
Live Helper Chat (https://livehelperchat.com) in docker



Usage: 
createdocker-compose.yml with content

```
version: '2'
services:
  app:
    build: .
    ports:
      - "8082:80"
    volumes:
       - ./lhc_storage:/app/var/storage
    depends_on:
      - db
    restart: always
  db:
    image: mysql:5
    environment:
      MYSQL_RANDOM_ROOT_PASSWORD: true
      MYSQL_DATABASE: lhc
      MYSQL_USER: lhc
      MYSQL_PASSWORD: lhc
      TZ: Europe/Moscow
    volumes:
       - ./dbdata:/var/lib/mysql
    ports:
       - 127.0.0.1:3307:3306
    restart: always
```

Than type ```docker-compose up -d``` and press Entern/Return
