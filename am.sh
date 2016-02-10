
set -x

cd /var/log/httpd

hostname=`hostname`
dateString=`echo $1 | sed -e "s/\//-/"`

log="/home/jh1038/logs/$hostname-api-access-$dateString-$2.txt"
log=`echo $log | sed -e "s/:/-/"`

first=`grep -n "$1/2014:$2:[0-9][0-9]"  api-access_log | head -1 | sed -e "s/:.*//"`
last=`grep -n "$1/2014:$2:[0-9][0-9]"  api-access_log | tail -1 | sed -e "s/:.*//"`


if [[ "$first" != "" ]]; then
sed -n "$first,$last p" api-access_log >>$log
fi

chown jh1038.jh1038 $log

echo "Log written to $log"

ls -l $log

