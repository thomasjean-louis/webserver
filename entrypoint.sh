#!/bin/sh

cd /var/www/html

#sed -i "s/'quakejs:/window.location.hostname + ':/g" index.html

sed -i "s/'content_server'/'${CONTENT_SERVER}'/g" index.html
sed -i "s/'game_server/'${GAME_SERVER}/g" index.html

sed -i "s/':80'/':${HTTP_PORT}'/g" index.html

#/etc/init.d/apache2 start
apachectl -DFOREGROUND
cd /quakejs

#node build/ioq3ded.js +set fs_game baseq3 set dedicated 1 +exec server.cfg +set fs_cdn ${CONTENT_SERVER}
