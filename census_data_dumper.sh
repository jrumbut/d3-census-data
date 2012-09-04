#!/bin/sh
# Census data dumper (to JSON)
# Usage: ./census_data_dumper.sh filename.json field table database user pass
# @author Joshua Rumbut first_name.last_name@gmail.com 
echo "\{" > ${1}
mysql -u${5} -p${6} ${4} -e "SELECT substr(GIDBG, 1, 5) AS id, ${2} as value FROM ${3};" | while read id value; do
    echo "\"${id}\":${value}," >> ${1}
done
echo "}" >> ${1}
