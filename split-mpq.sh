
# Usage split-mpq.sh 0929

#set -x
set -e 

newdir=../files-$1

mkdir $newdir

#ls -l *2015$1*.csv
cp -p *2015$1*.csv $newdir
chown -R jh1038.jh1038 $newdir

