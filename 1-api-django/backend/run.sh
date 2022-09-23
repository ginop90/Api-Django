#!/bin/bash

network_name="1-api-django-net"
db_volume="postgres-data"
server_name="1-api-django"
db_name="1-backend-postgresql"

echo "****** Construyendo imagen $server_name ******"
docker build -t $server_name:latest .
test $? -ne 0 && echo "¡¡¡ ERROR al construir imagen $server_name... !!!" && exit 1
echo "****** Imagen $server_name construida ******"

echo "****** Creando red $network_name ******"
docker network create $network_name
test $? -ne 0 && echo "¡¡¡ ERROR al crear red $network_name... !!!" && exit 1
echo "****** Red $network_name creada ******"

echo "****** Creando volumen $db_volume ******"
docker volume create $db_volume
test $? -ne 0 && echo "¡¡¡ ERROR al crear volumen $db_volume... !!!" && exit 1
echo "****** Volumen $db_volume creado ******"

echo "****** Levantando base de datos $db_name ******"
docker run -d --network $network_name --env-file .env-postgres --volume $db_volume:/var/lib/postgresql/data --name $db_name postgres:latest
test $? -ne 0 && echo "¡¡¡ ERROR al levantar base de datos $db_name... !!!" && exit 1
echo "****** Base de datos $db_name corriendo ******"

echo "****** Levantando servidor $server_name ******"
docker run -d --network $network_name -p 80:8001 --env-file .env --name $server_name $server_name:latest
test $? -ne 0 && echo "¡¡¡ ERROR al levantar servidor $server_name... !!!" && exit 1
echo "****** Servidor $db_name corriendo en >>>>> http://localhost <<<<< ******"