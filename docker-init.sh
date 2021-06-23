#composer install
docker exec -w /www/vhosts/omp php composer install

#rename bower
docker exec -w /www/vhosts/omp php mkdir -p vendor/bower && cp -r vendor/bower-asset/* vendor/bower/

#node_modules copy



#npm build