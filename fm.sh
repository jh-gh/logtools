
#set -x

cd /var/log/fencepost

logsuffix=`date +%m-%d-%H-%M-%S`
hostname=`hostname`
log="/home/jh1038/logs/$hostname-extracted-at-$logsuffix.txt"
log=`echo $log | sed -e "s/:/-/"`

grep -i $1 fencepost.2015-$2*.log fencepost.log >$log

chown jh1038.jh1038 $log

#echo "Log written to $log"

ls -l $log
