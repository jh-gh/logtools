
#set -x
set -e 

basetargetdir=/tmp/johnh/dumps

if [[ `hostname` = "fendbint01.fonterra.solnetsolutions.co.nz" ]]; then
	echo "Integration Database is fencepost_db_4"
	databasename=fencepost_db_4
fi

targetdate=$1
pickupfile=$basetargetdir/pickups-$targetdate.csv
aggregatefile=$basetargetdir/aggregates-$targetdate.csv

psql $databasename << EOF
	\copy (select * from mb_milk_production_pickup where pickup_date = '$targetdate' order by id_farm_logical, pickup_number, vat_number) to '$pickupfile' with csv header
EOF