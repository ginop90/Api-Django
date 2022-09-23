#!/bin/bash

network_name="1-api-django-net"
db_volume="postgres-data"
server_name="1-api-django"
db_name="1-backend-postgresql"

echo "****** Borrando servidor $server_name ******"
docker rm -f $server_name
#test $? -ne 0 && echo "¡¡¡ ERROR al levantar servidor $$server_name... !!!" && exit 1
echo "****** Servidor $db_name BORRADO ******"

echo "****** Borrando imagen $server_name ******"
docker image rm -f $server_name:latest
#test $? -ne 0 && echo "¡¡¡ La imagen $server_nameB no pudo ser borrada... !!!" && exit 1
echo "****** Imagen $server_name BORRADA ******"

echo "****** Borrando base de datos $db_name ******"
docker rm -f $db_name 
#$test $? -ne 0 && echo "¡¡¡ ERROR al levantar base de datos $$db_name... !!!" && exit 1
echo "****** Base de datos $$db_name BORRADA ******"

echo "****** Borrando volumen $db_volume ******"
docker volume rm $db_volume
#test $? -ne 0 && echo "¡¡¡ ERROR al crear volumen $$db_volume... !!!" && exit 1
echo "****** Volumen $$db_volume BORRADO ******"

echo "****** Borrando red $network_name ******"
docker network rm $network_name
#test $? -ne 0 && echo "¡¡¡ ERROR al crear red $$network_name... !!!" && exit 1
echo "****** Red $network_name BORRADA ******"