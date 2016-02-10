
#set -x

cd /var/log/fencepost

hostname=`hostname`
log="/home/jh1038/logs/$hostname-$1-$2.txt"
log=`echo $log | sed -e "s/:/-/"`

if [ -f fencepost.2015-$1.log ]; then
  
first=`grep -n "^2015-$1 $2:[0-9][0-9]"  fencepost.2015-$1.log | head -1 | sed -e "s/:.*//"`
last=`grep -n "^2015-$1 $2:[0-9][0-9]"  fencepost.2015-$1.log | tail -1 | sed -e "s/:.*//"`

if [[ "$first" != "" ]]; then
sed -n "$first,$last p" fencepost.2015-$1.log >$log
fi

fi


first=`grep -n "^2015-$1 $2:[0-9][0-9]"  fencepost.log | head -1 | sed -e "s/:.*//"`
last=`grep -n "^2015-$1 $2:[0-9][0-9]"  fencepost.log | tail -1 | sed -e "s/:.*//"`


if [[ "$first" != "" ]]; then
sed -n "$first,$last p" fencepost.log >>$log
fi

chown jh1038.jh1038 $log

#echo "Log written to $log"

ls -l $log

