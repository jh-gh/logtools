
#set -x
set -e 


chown dropbox.dropbox GEN_* DTC_* DTQ_*
chmod 660 GEN_* DTC_* DTQ_*

targetdir=/opt/fencepost/dropbox/mpq

if [[ `hostname` = "fendbint01.fonterra.solnetsolutions.co.nz" ]]; then
	echo Copying Genesis files
	targetdir=/opt/fencepost/dropbox/mpq-manual-drops	
	cp -p GEN_* $targetdir
fi

if [[ `hostname` = "fenartqadb01" ]]; then
	echo Copying Genesis files
	targetdir=/opt/fencepost/dropbox/mpq	
	cp -p GEN_* $targetdir
fi

echo Copying DTC/DTQ files
cp -p DTC_* DTQ_* $targetdir

ls -l $targetdir
