#!/bin/bash
# удалить предыдущий контейнер
docker rm -f proxy

# Создаём nginx контейнер
# 1. В фоновом режиме
# 2. Мапим порт к host машине
# 3. Устанавливаем имя контейнера
CONTAINER_ID=$(docker container run -d -p 80:80 --name proxy1 nginx)

# Создать новый образ на основании контейнера
docker container commit --author "Yurii Tym yurii.tim@yahoo.com" --message "Add curl" "$CONTAINER_ID" 67344/nginx-curl:0.0.1
