#!/bin/bash

DIR=/var/backups/db
DATE=`date +%H`
PASS="password-root-o-similar"
EXCLUDE="Database|_schema"
#obtiene lista de bases de datos
DB=`echo "show databases;" | mysql -uroot -p$PASS|egrep -v $EXCLUDE`

DIAS=10
NICE="nice -n 10 ionice -c2 "
mkdir -p /var/backups/db -m777
cd $DIR

#limpieza de mas de 10 dias
#find -type f -name  "*.bz2" -mtime +$DIAS -delete

for i in $DB;
do
        FILE=$i-$DATE.sql
        $NICE        mysqldump  --triggers  -K -R -uroot -p$PASS $i | $NICE bzip2 -c > $FILE.bz2
        sleep 1
done
