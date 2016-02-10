
set -x

cd /var/log/fencepost

first=`grep -n "2014-$2 $1:[0-9][0-9]"  fencepost.log | head -1 | sed -e "s/:.*//"`
last=`grep -n "2014-$2 $1:[0-9][0-9]"  fencepost.log | tail -1 | sed -e "s/:.*//"`

echo $first
echo $last

sed -n "$first,$last p" fencepost.log >/tmp/johnh/$2:$1.txt

sudo chown jh1038.jh1038 /tmp/johnh/$2:$1.txt


