## MySQL server

Version: 8.0

##### How to run:

```shell script
mkdir /var/lib/mysql
docker volume create --driver local \
                     --opt type=none \
                     --opt device=/var/lib/mysql \
                     --opt o=bind \
                     --name=mysql-data-volume
docker-compose up --build -d
```

Environment variables can be set in `.env` file