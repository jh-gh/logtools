
#set -x

cd /var/log/fencepost-web

hostname=`hostname`
log="/home/jh1038/logs/$hostname-web-$1-$2.txt"
log=`echo $log | sed -e "s/:/-/"`

if [ -f fp-web-2015-$1.log ]; then
  
first=`grep -n "^2015-$1 $2:[0-9][0-9]"  fp-web-2015-$1.log | head -1 | sed -e "s/:.*//"`
last=`grep -n "^2015-$1 $2:[0-9][0-9]"  fp-web-2015-$1.log | tail -1 | sed -e "s/:.*//"`

if [[ "$first" != "" ]]; then
sed -n "$first,$last p" fp-web-2015-$1.log >$log
fi

fi

chown jh1038.jh1038 $log

#echo "Log written to $log"

ls -l $log

