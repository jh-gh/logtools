
#set -x
set -e 

lastdir=/tmp/johnh/mpq/last
newdir=/tmp/johnh/mpq/new
#gendir=/opt/fencepost/dropbox/genesis-test/
gendir=/usr/pentaho/etl_data/mpq/archive
aspdir=/usr/pentaho/etl_data/mpq/archive

suffix=`date +%m-%d-%H-%M-%S`
newdir=/tmp/johnh/mpq/files-$suffix


# GENESIS
cd $lastdir
lastgen=`ls -l GEN_20* | tail -1 | sed -e "s/.* GEN/GEN/"`
echo lastgen: $lastgen
cd $gendir
last=`ls -l GEN_20* | grep -n $lastgen | sed -e "s/:.*//"`
firstnew=`expr $last + 1`
genfiles=`ls -1 GEN_20* | sed -n "$firstnew,\$ p"`
if [[ "$genfiles" = "" ]]; then
	echo No new Genesis files found.  Exiting.
	exit 1
fi

# Aspire DTC
cd $lastdir
lastdtc=`ls -l DTC_0* | tail -1 | sed -e "s/.* DTC/DTC/"`
echo lastdtc: $lastdtc
cd $aspdir
last=`ls -l DTC_0* | grep -n $lastdtc | sed -e "s/:.*//"`
firstnew=`expr $last + 1`
dtcfiles=`ls -1 DTC_0* | sed -n "$firstnew,\$ p"`
if [[ "$dtcfiles" = "" ]]; then
	echo No new DTC files found.  Exiting.
	exit 1	
fi

# Aspire DTQ
cd $lastdir
lastdtq=`ls -l DTQ_0* | tail -1 | sed -e "s/.* DTQ/DTQ/"`
echo lastdtq: $lastdtq
cd $aspdir
last=`ls -l DTQ_0* | grep -n $lastdtq | sed -e "s/:.*//"`
firstnew=`expr $last + 1`
dtqfiles=`ls -1 DTQ_0* | sed -n "$firstnew,\$ p"`
if [[ "$dtqfiles" = "" ]]; then
	echo No new DTC files found.  Exiting.
	exit 1	
fi

mkdir -p $newdir
cd $gendir
cp -rp $genfiles $newdir
cd $aspdir
cp -rp $dtcfiles $newdir
cd $aspdir
cp -rp $dtqfiles $newdir	

chown dropbox.dropbox $newdir/*.csv
chmod o+r $newdir/*.csv
chown jh1038 $newdir

rm -f $lastdir
ln -s $newdir $lastdir


